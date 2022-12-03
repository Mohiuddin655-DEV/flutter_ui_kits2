import 'dart:io';

import 'package:flutter/material.dart';

import 'child/avatar_view.dart';

class EditAvatarView extends StatelessWidget {
  final String? avatarUrl;
  final File? avatarFile;
  final Function()? onPress;

  const EditAvatarView({
    Key? key,
    this.avatarUrl,
    this.avatarFile,
    this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final avatarSize = size.width / 3.5;
    return Stack(
      children: [
        AvatarView(
          width: avatarSize,
          height: avatarSize,
          imageUrl: avatarUrl,
          imageFile: avatarFile,
          imageAsset: 'assets/images/img_user_placeholder.jpg',
          backgroundColor: Colors.blue,
          borderSize: 3,
          innerBorderSize: 3,
          borderColor: Colors.blue,
          innerBorderColor: Colors.white,
        ),
        Positioned(
          right: 2,
          bottom: 2,
          child: GestureDetector(
            onTap: onPress,
            child: Container(
              height: 40,
              width: 40,
              decoration: const BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.camera_alt_outlined,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}