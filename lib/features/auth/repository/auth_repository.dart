import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:laundry/core/providers/firebase_providers.dart';
import 'package:laundry/models/user_model.dart';

import '../../../core/constants/constants.dart';
import '../../../core/constants/firebase_constant.dart';


final authRepositoryProvider = Provider((ref) => AuthRepository(
    firestore: ref.read(firestoreProvider),
    auth: ref.read(authProvider),
    googleSignIn: ref.read(googleSignInProvider),
    ));

class AuthRepository {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;
  final GoogleSignIn _googleSignIn;

  AuthRepository({
    required FirebaseFirestore firestore,
    required FirebaseAuth auth,
    required GoogleSignIn googleSignIn,
  })  : _auth = auth,
        _firestore = firestore,
        _googleSignIn = googleSignIn;

        CollectionReference get _users => _firestore.collection(FirebaseConstants.usersCollection);

  Future<void> signInWithGoogle() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      
      final googleAuth = await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      UserCredential userCredential = await  _auth.signInWithCredential(credential);

      UserModel userModel = UserModel(
        uid: userCredential.user!.uid,
        name: userCredential.user!.displayName??'No Name',
        profilePic: userCredential.user!.photoURL??Constants.avatarDefault,
        banner: Constants.bannerDefault,
        isAuthenticated: true,
      );


     await  _users.doc(userCredential.user!.uid).set(userModel.toMap());
    } catch (e) {
      print(e);
    }
  }
}
