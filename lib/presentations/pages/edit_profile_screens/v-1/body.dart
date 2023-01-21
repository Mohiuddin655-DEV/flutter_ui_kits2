import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_ui_kits/presentations/pages/edit_profile_screens/v-1/widgets/edit_avatar_view.dart';
import 'package:flutter_ui_kits/presentations/pages/edit_profile_screens/v-1/widgets/edit_field.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/constants.dart';
import 'widgets/dropdown_field.dart';

class EditProfileV1Body extends StatefulWidget {
  const EditProfileV1Body({Key? key}) : super(key: key);

  @override
  State<EditProfileV1Body> createState() => _EditProfileV1BodyState();
}

class _EditProfileV1BodyState extends State<EditProfileV1Body> {
  File? _image;

  Future _pickImage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    print(image);
    if (image == null) return;
    File? img = File(image.path);
    img = await _cropImage(imageFile: img);
    setState(() {
      _image = img;
      print(_image);
    });
  }

  Future<File?> _cropImage({required File imageFile}) async {
    CroppedFile? croppedImage =
        await ImageCropper().cropImage(sourcePath: imageFile.path);
    if (croppedImage == null) return null;
    return File(croppedImage.path);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          color: Colors.white,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  EditAvatarView(
                    avatarFile: _image,
                    onPress: () {
                      _pickImage(ImageSource.gallery);
                    },
                  ),
                  const SizedBox(height: 40),
                  EditField(
                    title: 'Name',
                    hint: 'Your name',
                    onChanged: (value) {
                      print(value);
                    },
                  ),
                  const SizedBox(height: 24),
                  EditField(
                    title: 'Email Address',
                    hint: 'example@gmail.com',
                    onChanged: (value) {
                      print(value);
                    },
                  ),
                  const SizedBox(height: 24),
                  EditField(
                    title: 'Username',
                    hint: '@yourname',
                    onChanged: (value) {
                      print(value);
                    },
                  ),
                  const SizedBox(height: 24),
                  DropdownField(
                    title: 'Age',
                    items: appRequiredAgeList,
                    onChanged: (value) {
                      print(value);
                    },
                  ),
                  const SizedBox(height: 24),
                  DropdownField(
                    title: 'Gender',
                    items: appRequiredGanderList,
                    onChanged: (value) {
                      print(value);
                    },
                  ),
                  const SizedBox(height: 50),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Submit'),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Powered By Tech Analytica Limited \nBeta Version 1.0.0',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey.shade800,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
