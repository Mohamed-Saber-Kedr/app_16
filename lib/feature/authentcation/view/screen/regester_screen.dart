import 'dart:io';
import 'package:app_9/core/validator/custom_validator.dart';
import 'package:app_9/core/widget/custom_text_filed.dart';
import 'package:app_9/feature/authentcation/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import 'login-screen.dart';

class RegesterScreen extends StatelessWidget {
  RegesterScreen({super.key});


  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController nationalIdController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  ImagePicker imagePicker = ImagePicker();

  File? image;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Sign Up"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {},
            builder: (context, state) {
              AuthCubit authCubit = AuthCubit();
              return Column(
                children: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.camera_alt)),
                  image != null
                      ? Image(
                    image: FileImage(image!),
                  )
                      : Text("no Image"),
                  CustomTextField(
                    controller: nameController,
                    textInputType: TextInputType.text,
                    validator: (value) {
                      return MyValidators.displayNameValidator(value);
                    },
                    label: "name",
                    hintText: "Enter your name here",
                  ),
                  CustomTextField(
                    controller: emailController,
                    textInputType: TextInputType.emailAddress,
                    validator: (value) {
                      return MyValidators.emailValidator(value);
                    },
                    label: "Email",
                    hintText: "Enter your Email",
                  ),
                  CustomTextField(
                      controller: phoneController,
                      textInputType: TextInputType.phone,
                      validator: (value) {
                        return MyValidators.phoneValidator(value);
                      },
                      label: "Phone",
                      hintText: "Enter 11 digit"),
                  CustomTextField(
                    controller: passwordController,
                    textInputType: TextInputType.visiblePassword,
                    validator: (value) {
                      return MyValidators.passwordValidator(value);
                    },
                    label: "Password",
                    hintText: "Enter your password",
                  ),
                  CustomTextField(
                    controller: nationalIdController,
                    textInputType: TextInputType.visiblePassword,
                    validator: (value) {
                      return MyValidators.nationalIdValidator(value);
                    },
                    label: "National Id",
                    hintText: "Enter National Id here",
                  ),
                  CustomTextField(
                    controller: genderController,
                    textInputType: TextInputType.text,
                    validator: (value) {
                      return MyValidators.genderValidator(value: value);
                    },
                    label: "Gender",
                    hintText: "Gender",
                  ),
                  BlocConsumer<AuthCubit, AuthState>(
                    listener: (context, state) {
                      if(state is AuthRegesterSuccess){
                        if (state.response.statusCode == 201){
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("you are login successful"),),);
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen(),),);
                        }
                        else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.response.data["massage"]),),);
                        }
                      }
                    },
                    builder: (context, state) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton.outlined(
                              onPressed: () {
                                authCubit.regesterCubit(
                                    name: nameController.text,
                                    email: emailController.text,
                                    phone: phoneController.text,
                                    nationalId: nationalIdController.text,
                                    gender: genderController.text,
                                    password: passwordController.text
                                );
                              },
                              icon: Icon(Icons.start),),
                          SizedBox(width: 15,),
                          InkWell(
                            onTap: () {
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen(),),);
                            },
                            child: Text("Login",style: TextStyle(decoration: TextDecoration.underline,fontSize: 25),),
                          )
                        ],
                      );
                    },
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
