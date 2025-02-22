import 'package:flutter/material.dart';
import 'app/app.dart';
import 'di.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  runApp(const MyApp());
}