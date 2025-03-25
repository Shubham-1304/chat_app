import 'package:chat_app/core/injection_container.dart';
import 'package:chat_app/my_app.dart';
import 'package:flutter/material.dart';

Future<void> main() async{
  await init();
  runApp(const MyApp());
}
