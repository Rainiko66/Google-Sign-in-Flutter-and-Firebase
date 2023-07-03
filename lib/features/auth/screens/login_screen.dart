import 'package:flutter/material.dart';
import 'package:laundry/core/common/sign_in_button.dart';
import 'package:laundry/core/constants/constants.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

   @override
  Widget build(BuildContext context) {
    //final isLoading = ref.watch(authControllerProvider);


    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(8.0),
           
          child: Image.asset(Constants.logoPath , height: 40,),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              'Skip',
              style: TextStyle(fontWeight: FontWeight.bold, color: Color.fromARGB(255, 0, 0, 0)),
            ),
          ),
        ],
      ),

      body: Column(children: [
        const SizedBox(height: 20,),
        const Text('NYUAD LAUNDRY', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, letterSpacing: 0.5),),

        const SizedBox(height: 20,),
          Align(
            alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Image.asset(Constants.washingPath, height: 200,),
        ),
          ),

        const SizedBox(height: 20,),
        const SignInButton(),
      ],
      ),
    );

  }
}

