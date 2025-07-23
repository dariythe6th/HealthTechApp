// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextfield extends StatefulWidget {
  CustomTextfield({
    Key? key,
    required this.dateController,
    required this.inputFormatters,
    required this.keyboardType,
    required this.labelText,
    required this.helperText,
    this.sufficbutton,
  }) : super(key: key);

  @override
  State<CustomTextfield> createState() => _CustomTextfieldState();
  final TextEditingController dateController;
  final List<TextInputFormatter> inputFormatters;
  final TextInputType keyboardType;
  final String labelText;
  final String helperText;
  final IconButton? sufficbutton;
}

class _CustomTextfieldState extends State<CustomTextfield> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.dateController,
      style: Theme.of(
        context,
      ).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.w400),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(color: Color(0XFF8D957E), width: 3),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(color: Color(0XFF8D957E), width: 3),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(color: Color(0XFF8D957E), width: 3),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        fillColor: Color(0XFFFFFFFF),
        filled: true,
        labelText: widget.labelText,
        helperText: widget.helperText,
        helperStyle: Theme.of(
          context,
        ).textTheme.titleSmall!.copyWith(fontSize: 12),
        labelStyle: Theme.of(context).textTheme.labelSmall,
        suffixIcon: widget.sufficbutton,
      ),
      keyboardType: widget.keyboardType,
      inputFormatters: widget.inputFormatters,
    );
  }
}
