import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget({
    super.key,
    required this.controller,
    required this.textInputType,
    required this.isSuffixIcon,
    required this.focusNode,
    this.nextFocusNode,
    required this.validator,
    this.textInputAction = TextInputAction.done,
    required this.autoValidate,
    this.onFieldSubmitted,
    required this.fieldKey,
    required this.hintText,
  });

  final TextEditingController controller;
  final TextInputType textInputType;
  final bool isSuffixIcon;
  final FocusNode focusNode;
  final FocusNode? nextFocusNode;
  final TextInputAction textInputAction;
  final String? Function(String?) validator;
  final bool autoValidate;
  final VoidCallback? onFieldSubmitted;
  final GlobalKey<FormFieldState>? fieldKey;
  final String hintText;

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  bool isPasswordvisible = false;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: 30),
      child: TextFormField(
        key: widget.fieldKey,

        autovalidateMode: widget.autoValidate
            ? AutovalidateMode.always
            : AutovalidateMode.disabled,
        validator: widget.validator,
        focusNode: widget.focusNode,
        style: Theme.of(
          context,
        ).textTheme.titleSmall!.copyWith(color: Color(0xFFE8D957E)),
        cursorHeight: 15,
        controller: widget.controller,
        keyboardType: widget.textInputType,
        textInputAction: TextInputAction.done,
        autofocus: false,
        cursorColor: Color(0xFF364025),
        cursorErrorColor: Color(0xFFBA7551),
        obscureText: isPasswordvisible,
        onFieldSubmitted: (_) {
          if (widget.onFieldSubmitted != null) {
            widget.onFieldSubmitted!();
          }
          if (widget.nextFocusNode != null) {
            FocusScope.of(context).requestFocus(widget.nextFocusNode);
          } else {
            FocusScope.of(context).unfocus();
          }
        },
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: Theme.of(context).textTheme.headlineSmall!.copyWith(
            color: Color(0xFF8D957E),
            fontWeight: FontWeight.w400,
          ),
          errorMaxLines: 1,
          helperText: ' ',
          contentPadding: EdgeInsets.all(16),
          fillColor: Color(0xFFFCFFF3),
          filled: true,
          suffixIcon: widget.isSuffixIcon
              ? IconButton(
                  onPressed: () =>
                      setState(() => isPasswordvisible = !isPasswordvisible),
                  icon: isPasswordvisible
                      ? Icon(Icons.visibility_off)
                      : Icon(Icons.visibility),
                )
              : Container(width: 0),
          suffixIconColor: Color(0xFF8D957E),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Color(0xFFBBCF9A), width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Color(0xFF8D957E), width: 2),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: Color(0xFFBA7551),
              width: 2,
            ), // как enabledBorder
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: Color(0xFFBA7551),
              width: 2,
            ), // как enabledBorder
          ),
        ),
      ),
    );
  }
}
