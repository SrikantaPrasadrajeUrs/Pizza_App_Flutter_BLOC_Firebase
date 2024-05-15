import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final emailController=TextEditingController();
  final passController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener(
        listener: (context,state){

        },
        child: Form(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width*10~/10*.9,
                )
              ],
            )
        ),
    );
  }
}
