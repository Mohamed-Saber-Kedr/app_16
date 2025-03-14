import 'package:app_9/core/validator/custom_validator.dart';
import 'package:app_9/core/widget/custom_text_filed.dart';
import 'package:app_9/feature/authentcation/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../home/view/home_screen.dart';



class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            CustomTextField(
                controller: emailController,
                textInputType: TextInputType.text,
                validator: (value) {
                  return MyValidators.emailValidator(value);
                },
                label: "Email",
                hintText: "Enter your email"),
            CustomTextField(
                controller: passwordController,
                textInputType: TextInputType.text,
                validator: (value) {
                  return MyValidators.passwordValidator(value);
                },
                label: "Password",
                hintText: "Enter your password"),
            SizedBox(height: 15,),
            BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is AuthLoginSuccess){
                if(state.response.data["status"]=="success"){
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor: Colors.green,content: Text(state.response.data['message'],),),);
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen(),),);
                  }
                if(state.response.data["status"]=="error"){
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor: Colors.red,content: Text(state.response.data['message'],),),);
                }
                }
              },
              builder: (context, state) {
                AuthCubit authCubit = AuthCubit();
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        var x = authCubit.loginCubit(
                          email: emailController.text,
                          password: passwordController.text,
                        );
                      },
                      child: Center(child: Text("Login",style: TextStyle(decoration: TextDecoration.underline,fontSize: 25),)),
                    )
                  ],
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
