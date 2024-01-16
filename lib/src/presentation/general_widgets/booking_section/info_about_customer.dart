import 'package:flutter/material.dart';
import 'package:project_task/src/core/general_theme/theme.dart';
import 'package:project_task/src/presentation/general_widgets/booking_section/cellphone_textfield.dart';
import 'package:project_task/src/presentation/general_widgets/booking_section/email_textfield.dart';
import 'package:project_task/src/presentation/general_widgets/pattern_container_rounded.dart';

class InfoAboutCustomer extends StatefulWidget {
  const InfoAboutCustomer({super.key,
  required this.emailTextController,
  required this.cellPhoneFieldKey,
  required this.cellPhoneTextController,
  required this.emailTextFieldKey
  });
  final TextEditingController emailTextController;
  final TextEditingController cellPhoneTextController;

  final GlobalKey<EmailTextFieldState> emailTextFieldKey;
  final GlobalKey<CellPhoneTextFieldState> cellPhoneFieldKey;
  @override
  State<InfoAboutCustomer> createState() => _InfoAboutCustomerState();
}

class _InfoAboutCustomerState extends State<InfoAboutCustomer> {
  @override
  Widget build(BuildContext context) {
    return PatternContainerRounded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Информация о покупателе',
              style: TextStylesOfPattern.blackTextStyle,
            ),
            const SizedBox(height: 20,),
            CellPhoneTextField(
                fieldKey: widget.cellPhoneFieldKey,
                textController: widget.cellPhoneTextController
            ),
            const SizedBox(
              height: 8,
            ),
            EmailTextField(
                fieldKey: widget.emailTextFieldKey,
                textController: widget.emailTextController
            ),
            const SizedBox(height: 8,),
            Text(
              'Эти данные никому не передаются. После оплаты мы вышли чек на указанный вами номер и почту',
              style: TextStylesOfPattern.greyTextStyle.copyWith(fontSize: 14),
            ),
          ],
        ),
    );
  }
}
