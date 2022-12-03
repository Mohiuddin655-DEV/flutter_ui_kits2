import 'package:flutter/material.dart';
import 'package:flutter_ui_kits/edit_profile_screens/v-1/body.dart';

class EditProfileV1Page extends StatelessWidget {
  const EditProfileV1Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Ui Kits'),
        elevation: 0,
      ),
      body: const SafeArea(child: EditProfileV1Body()),
    );
  }
}
