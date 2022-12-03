import 'package:flutter/material.dart';

import 'child/edit_text.dart';

class EditField extends StatelessWidget {
  final String title;
  final String? hint;
  final Function(String)? onChanged;

  const EditField({
    Key? key,
    required this.title,
    this.hint,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 8.0,
          ),
          child: Text(
            title,
            style: Theme.of(context).textTheme.subtitle1!.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
        EditText(
          hint: hint ?? title,
          onChanged: onChanged,
        ),
      ],
    );
  }
}