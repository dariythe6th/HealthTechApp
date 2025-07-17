import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:health_app/features/auth/widgets/text_field.dart';

class FormWidgetSignUp extends StatelessWidget {
  const FormWidgetSignUp({
    super.key,
    required GlobalKey<FormState> formKey,
    required this.emailFieldKey,
    required this.emailController,
    required this.emailFocusNode,
    required this.passwordFocusNode,
    required bool autoValidate,
    required this.passwordFieldKey,
    required this.passwordController,
    required this.confirmPasswordFocusNode,
    required this.confirmPasswordFieldKey,
    required this.confirmPasswordController,
  }) : _formKey = formKey,
       _autoValidate = autoValidate;

  final GlobalKey<FormState> _formKey;
  final GlobalKey<FormFieldState> emailFieldKey;
  final TextEditingController emailController;
  final FocusNode emailFocusNode;
  final FocusNode passwordFocusNode;
  final bool _autoValidate;
  final GlobalKey<FormFieldState> passwordFieldKey;
  final TextEditingController passwordController;
  final FocusNode confirmPasswordFocusNode;
  final GlobalKey<FormFieldState> confirmPasswordFieldKey;
  final TextEditingController confirmPasswordController;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(height: 29),
          Center(
            child: SvgPicture.asset(
              'assets/Activity.svg',
              width: 151,
              height: 151,
            ),
          ),
          SizedBox(height: 106),
          Text(
            'Email',
            textAlign: TextAlign.left,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          TextFieldWidget(
            hintText: 'Enter your email...',
            fieldKey: emailFieldKey,
            controller: emailController,
            textInputType: TextInputType.emailAddress,
            isSuffixIcon: false,
            focusNode: emailFocusNode,
            nextFocusNode: passwordFocusNode,
            validator: (value) {
              if (value == null || value.isEmpty) return 'Email is required';
              final isValid = RegExp(
                r'^[^@\s]+@[^@\s]+\.[^@\s]+$',
              ).hasMatch(value);
              return isValid ? null : 'Invalid email';
            },
            autoValidate: _autoValidate,
            onFieldSubmitted: () {
              if (emailFieldKey.currentState?.validate() ?? false) {
                FocusScope.of(context).requestFocus(passwordFocusNode);
              }
            },
          ),
          const SizedBox(height: 28),
          Text(
            'Password',
            textAlign: TextAlign.left,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          TextFieldWidget(
            hintText: 'Enter your password...',
            fieldKey: passwordFieldKey,
            controller: passwordController,
            textInputType: TextInputType.visiblePassword,
            isSuffixIcon: true,
            focusNode: passwordFocusNode,
            nextFocusNode: confirmPasswordFocusNode,
            validator: (value) {
              if (value == null || value.isEmpty) return 'Password is required';
              if (!(value.length >= 8 &&
                  value.contains(RegExp(r'[A-Z]')) &&
                  value.contains(RegExp(r'[0-9]')) &&
                  value.contains(RegExp(r'[!@#\$&*~]')))) {
                return 'Password must be at least 8 characters and include an uppercase letter, number, and symbol.';
              }
              return null;
            },
            autoValidate: _autoValidate,
            onFieldSubmitted: () {
              if (passwordFieldKey.currentState?.validate() ?? false) {
                FocusScope.of(context).requestFocus(confirmPasswordFocusNode);
              }
            },
          ),
          const SizedBox(height: 28),
          Text(
            'Confirm password',
            style: Theme.of(context).textTheme.titleSmall,
          ),
          TextFieldWidget(
            hintText: 'Confirm your password...',
            fieldKey: confirmPasswordFieldKey,
            controller: confirmPasswordController,
            textInputType: TextInputType.visiblePassword,
            isSuffixIcon: true,
            focusNode: confirmPasswordFocusNode,
            validator: (value) {
              if (value == null || value.isEmpty)
                return 'Confirm your password';
              return passwordController.text != confirmPasswordController.text
                  ? 'Wrong password'
                  : null;
            },
            autoValidate: _autoValidate,
            onFieldSubmitted: () {
              if (confirmPasswordFieldKey.currentState?.validate() ?? false) {
                FocusScope.of(context).unfocus();
              }
            },
          ),
        ],
      ),
    );
  }
}
