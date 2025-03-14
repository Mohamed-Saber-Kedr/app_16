import 'package:app_9/test/block_observ.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'my_app.dart';



void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}
