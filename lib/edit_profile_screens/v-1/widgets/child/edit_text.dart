import 'package:flutter/material.dart';

class EditText extends StatelessWidget {
  final String hint;
  final double width;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;

  const EditText({
    Key? key,
    required this.hint,
    this.width = double.infinity,
    this.onChanged,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: TextFormField(
        onChanged: onChanged,
        validator: validator,
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color(0xFFF1F4FB),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(16),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 24),
          hintText: hint,
        ),
      ),
    );
  }
}