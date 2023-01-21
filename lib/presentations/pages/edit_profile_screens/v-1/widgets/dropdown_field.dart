import 'package:flutter/material.dart';

import 'child/drop_down.dart';

class DropdownField extends StatelessWidget {
  final String title;
  final List<String> items;
  final Function(String) onChanged;

  const DropdownField({
    Key? key,
    required this.title,
    required this.items,
    required this.onChanged,
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
        DropDownView(
          backgroundColor: const Color(0xFFECEFF8),
          borderRadius: 16,
          items: items,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
