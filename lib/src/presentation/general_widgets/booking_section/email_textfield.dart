import 'package:flutter/material.dart';
import 'package:project_task/src/core/general_theme/theme.dart';

class EmailTextField extends StatefulWidget {
  final GlobalKey<EmailTextFieldState> fieldKey;
  final TextEditingController textController;

  const EmailTextField({
    required this.fieldKey,
    required this.textController,
  }) : super(key: fieldKey);

  @override
  State<EmailTextField> createState() => EmailTextFieldState();
}

class EmailTextFieldState extends State<EmailTextField> {
  bool isError = false;

  final RegExp emailRegExp =
  RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');

  void validateEmail() {
    if (emailRegExp.hasMatch(widget.textController.text)) {
      isError = false;
    } else {
      isError = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isError ? const Color(0x26EB5757) : const Color(0xFFF6F6F9),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        controller: widget.textController,
        autocorrect: false,
        keyboardType: TextInputType.emailAddress,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          labelText: 'Почта',
          labelStyle: TextStylesOfPattern.hintStyle,
          border: InputBorder.none,
        ),
        style: TextStylesOfPattern.textFieldStyle,
        cursorColor: TextStylesOfPattern.textFieldStyle.color,
        cursorHeight: TextStylesOfPattern.textFieldStyle.fontSize,
        onFieldSubmitted: (_) {
          setState(() {
            validateEmail();
          });
        },
        onTap: () {
          setState(() {
            isError = false;
          });
        },
      ),
    );
  }
}
