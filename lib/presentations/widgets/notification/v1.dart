import 'package:flutter/material.dart';

class NotificationV1 extends StatelessWidget {
  const NotificationV1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 220,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(8),
      ),

    );
  }
}
