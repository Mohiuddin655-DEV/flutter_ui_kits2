import 'dart:io';

import 'package:flutter/material.dart';

class AvatarView extends StatelessWidget {
  final String? imageAsset, imageUrl;
  final File? imageFile;
  final double width, height;
  final bool isCircular;
  final BorderRadiusGeometry? borderRadius;
  final Color? backgroundColor, borderColor, innerBorderColor;
  final double borderSize;
  final double innerBorderSize;
  final Function()? onPress;

  const AvatarView({
    Key? key,
    this.imageFile,
    this.width = 100,
    this.height = 100,
    this.isCircular = true,
    this.borderRadius,
    this.backgroundColor,
    this.borderColor,
    this.borderSize = 0,
    this.imageAsset,
    this.imageUrl,
    this.innerBorderColor,
    this.innerBorderSize = 0,
    this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        clipBehavior: Clip.antiAlias,
        padding: EdgeInsets.all(borderSize),
        decoration: BoxDecoration(
          color: borderColor,
          shape: isCircular ? BoxShape.circle : BoxShape.rectangle,
          borderRadius: !isCircular ? borderRadius : null,
        ),
        child: Container(
          padding: EdgeInsets.all(innerBorderSize),
          decoration: BoxDecoration(
            color: innerBorderColor,
            shape: isCircular ? BoxShape.circle : BoxShape.rectangle,
            borderRadius: !isCircular ? borderRadius : null,
          ),
          child: Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: backgroundColor,
              shape: isCircular ? BoxShape.circle : BoxShape.rectangle,
              borderRadius: !isCircular ? borderRadius : null,
            ),
            child: _loadImage(),
          ),
        ),
      ),
    );
  }

  Widget _loadImage() {
    if (imageUrl != null && imageUrl!.isNotEmpty) {
      return Image.network(
        imageUrl!,
        width: width,
        height: height,
        fit: BoxFit.cover,
      );
    } else if (imageFile != null) {
      return Image.file(
        imageFile!,
        width: width,
        height: height,
        fit: BoxFit.cover,
      );
    } else if (imageAsset != null && imageAsset!.isNotEmpty) {
      return Image.asset(
        imageAsset!,
        width: width,
        height: height,
        fit: BoxFit.cover,
      );
    } else {
      return Container();
    }
  }
}
