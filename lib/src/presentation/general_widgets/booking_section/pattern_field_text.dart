import 'package:flutter/material.dart';
import 'package:project_task/src/core/general_theme/theme.dart';

class PatternTextField extends StatefulWidget {
  final String labelText;
  final TextEditingController controller;
  final bool isError;
  final ValueChanged<bool> onErrorChanged;
  final GlobalKey<PatternTextFieldState> fieldKey;

  const PatternTextField({
    required this.fieldKey,
    required this.labelText,
    required this.controller,
    required this.isError,
    required this.onErrorChanged,
  }) : super(key: fieldKey);

  @override
  State<PatternTextField> createState() => PatternTextFieldState();
}

class PatternTextFieldState extends State<PatternTextField> {
  bool checkText() {
    widget.onErrorChanged(widget.controller.text.isEmpty);
    return widget.controller.text.isEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color:
        widget.isError ? const Color(0x26EB5757) : const Color(0xFFF6F6F9),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        controller: widget.controller,
        autocorrect: false,
        decoration: InputDecoration(
          contentPadding:
          const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          labelText: widget.labelText,
          labelStyle: TextStylesOfPattern.hintStyle,
          border: InputBorder.none,
        ),
        style: TextStylesOfPattern.textFieldStyle,
        cursorColor: TextStylesOfPattern.textFieldStyle.color,
        cursorHeight: TextStylesOfPattern.textFieldStyle.fontSize,
        onTap: () {
          setState(() {
            widget.onErrorChanged(false);
          });
        },
      ),
    );
  }
}