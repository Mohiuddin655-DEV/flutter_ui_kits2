import 'package:flutter/material.dart';

class DropDownView extends StatefulWidget {
  final List<String> items;
  final Function(String) onChanged;
  final double? height, width;
  final double borderWidth;
  final Color? color, backgroundColor;
  final Color borderColor;
  final EdgeInsetsGeometry? padding;
  final double borderRadius;

  const DropDownView({
    Key? key,
    required this.items,
    required this.onChanged,
    this.height,
    this.padding,
    this.borderWidth = 0,
    this.borderRadius = 16,
    this.width,
    this.color,
    this.backgroundColor,
    this.borderColor = Colors.transparent,
  }) : super(key: key);

  @override
  State<DropDownView> createState() => _DropDownViewState();
}

class _DropDownViewState extends State<DropDownView> {
  late List<String> items = widget.items;
  late String _value = items.isNotEmpty ? items[0] : '';

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      clipBehavior: Clip.antiAlias,
      padding: widget.padding ?? const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: BorderRadius.circular(widget.borderRadius),
        border:
            Border.all(width: widget.borderWidth, color: widget.borderColor),
      ),
      child: DropdownButton<String>(
        style: TextStyle(
          color: widget.color ?? Colors.black,
        ),
        value: _value,
        elevation: 0,
        iconEnabledColor: widget.color,
        isExpanded: true,
        isDense: false,
        onChanged: (String? newValue) {
          setState(() {
            _value = newValue!;
            widget.onChanged.call(_value);
          });
        },
        underline: Container(),
        items: items.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
