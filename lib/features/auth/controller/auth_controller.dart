
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:laundry/features/auth/repository/auth_repository.dart';

final authControllerProvider = Provider(
  (ref) => AuthController(
    authRepository: ref.read(authRepositoryProvider), ref: ref,

  ),
);

class AuthController {

   final AuthRepository _authRepository;
     AuthController({required AuthRepository authRepository, required Ref ref})
      : _authRepository = authRepository;
       
   
   void signInWithGoogle(){

      _authRepository.signInWithGoogle();
   }


}