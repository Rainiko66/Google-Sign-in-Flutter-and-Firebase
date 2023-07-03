import 'package:flutter/material.dart';
import 'package:laundry/core/constants/constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../features/auth/controller/auth_controller.dart';
import '../../theme/theme.dart';


class SignInButton extends ConsumerWidget {
  const SignInButton ({Key? key}) : super(key: key);


   void signInWithGoogle(WidgetRef ref) {
    ref.read(authControllerProvider).signInWithGoogle();
   }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton.icon(
      onPressed: () => signInWithGoogle(ref),
      icon: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset(Constants.googlePath, width: 35,),
      ),
      label: const Text('Continue with Google', style: TextStyle(fontSize: 18),
      ),
      style: ElevatedButton.styleFrom( 
        backgroundColor: Pallete.greyColor,
        minimumSize: const Size(double.infinity, 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          ),
      ),
      
      
      );
   
  
  }


}