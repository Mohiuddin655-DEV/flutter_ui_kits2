import 'package:flutter/material.dart';
import 'package:flutter_ui_kits/core/constants.dart';
import 'package:flutter_ui_kits/presentations/pages/edit_profile_screens/v-1/widgets/child/avatar_view.dart';

class CommentView extends StatelessWidget {
  const CommentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 120,
      decoration: const BoxDecoration(
        color: Colors.red,
      ),
      child: Row(
        children: [
          AvatarView(imageAsset: kAvatarAsset,)
        ],
      ),
    );
  }
}
