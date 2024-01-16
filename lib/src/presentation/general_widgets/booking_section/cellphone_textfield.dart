import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:project_task/src/core/general_theme/theme.dart';

class CellPhoneTextField extends StatefulWidget {
  final GlobalKey<CellPhoneTextFieldState> fieldKey;
  final TextEditingController textController;

  const CellPhoneTextField({
    required this.fieldKey,
    required this.textController,
  }) : super(key: fieldKey);

  @override
  State<CellPhoneTextField> createState() => CellPhoneTextFieldState();
}

class CellPhoneTextFieldState extends State<CellPhoneTextField> {
  final phoneFormatter = MaskTextInputFormatter(
      mask: '(###) ###-##-##', filter: {"#": RegExp(r'[0-9]')});
  bool isError = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isError ? const Color(0x26EB5757) : const Color(0xFFF6F6F9),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        controller: widget.textController,
        keyboardType: TextInputType.phone,
        inputFormatters: [phoneFormatter],
        decoration: const InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            labelText: 'Номер телефона',
            labelStyle: TextStylesOfPattern.hintStyle,
            prefixText: "+7 ",
            prefixStyle: TextStylesOfPattern.textFieldStyle,
            border: InputBorder.none),
        style: TextStylesOfPattern.textFieldStyle,
        cursorColor: TextStylesOfPattern.textFieldStyle.color,
        cursorHeight: TextStylesOfPattern.hintStyle.fontSize,
        onFieldSubmitted: (_) {
          if (widget.textController.text.length != 15) {
            setState(() {
              isError = true;
            });
          }
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
