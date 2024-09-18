import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizza_app_bloc_firebase/authentication_bloc/authentication_bloc.dart';
import 'package:pizza_app_bloc_firebase/screens/auth/bloc/sign_in_bloc/sign_in_bloc.dart';
import 'package:pizza_app_bloc_firebase/screens/auth/bloc/sign_up_bloc/sign_up_bloc.dart';
import 'package:pizza_app_bloc_firebase/screens/auth/view/welcome_screen.dart';
import 'package:pizza_app_bloc_firebase/screens/home/view/home_screen.dart';

class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.light(
          primary: Colors.blue,
          onBackground: Colors.black,
          background: Colors.grey.shade100,
          onPrimary: Colors.white
        )
      ),
      debugShowCheckedModeBanner: false,
      title: "Pizza Delivery",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Pizza App"),
          centerTitle: true,
        ),
        body: BlocBuilder<AuthenticationBloc,AuthenticationState>(
          builder: (context,state){
            if(state.status==AuthenticationStatus.authenticated){
              return MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context)=> SignUpBloc(context.read<AuthenticationBloc>().userRepository),
                    )
                  ],
                  child: const HomeScreen());
            }else{
              return MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context)=> SignInBloc(context.read<AuthenticationBloc>().userRepository),
                    ),
                    BlocProvider(
                      create: (context)=> SignUpBloc(context.read<AuthenticationBloc>().userRepository),
                    )
                  ],
                  child: const WelcomeScreen());
            }
          },
        ),
      ),
    );
  }
}

