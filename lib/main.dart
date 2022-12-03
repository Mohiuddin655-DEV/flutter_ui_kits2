import 'package:flutter/material.dart';
import 'package:flutter_ui_kits/edit_profile_screens/v-1/page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const EditProfileV1Page(),
    );
  }
}
