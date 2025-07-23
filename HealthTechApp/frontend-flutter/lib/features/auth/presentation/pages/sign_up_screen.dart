import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:health_app/%20config/theme/widgets/primary_elevated_button.dart';
import 'package:health_app/features/auth/presentation/widgets/form_sign_up.dart';
import 'package:health_app/%20config/router/router.gr.dart';
import 'package:talker_flutter/talker_flutter.dart';

@RoutePage()
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenViewState();
}

class _SignUpScreenViewState extends State<SignUpScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final confirmPasswordFocusNode = FocusNode();

  bool _autoValidate = false;
  bool _isLoading = false;

  final _formKey = GlobalKey<FormState>();
  final emailFieldKey = GlobalKey<FormFieldState>();
  final passwordFieldKey = GlobalKey<FormFieldState>();
  final confirmPasswordFieldKey = GlobalKey<FormFieldState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    confirmPasswordFocusNode.dispose();
    super.dispose();
  }

  void _onSignUpPressed() async {
    setState(() {
      _autoValidate = true;
      _isLoading = true;
    });

    if (!_formKey.currentState!.validate()) {
      GetIt.I<Talker>().warning('Форма не прошла валидацию');
      setState(() => _isLoading = false);
      return;
    }

    // Имитируем "регистрацию"
    await Future.delayed(const Duration(seconds: 1));
    GetIt.I<Talker>().debug('Форма валидна, можно отправлять данные');

    if (!mounted) return;
    context.router.replace(FormRoute());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: FormWidgetSignUp(
                    formKey: _formKey,
                    emailFieldKey: emailFieldKey,
                    emailController: emailController,
                    emailFocusNode: emailFocusNode,
                    passwordFocusNode: passwordFocusNode,
                    autoValidate: _autoValidate,
                    passwordFieldKey: passwordFieldKey,
                    passwordController: passwordController,
                    confirmPasswordFocusNode: confirmPasswordFocusNode,
                    confirmPasswordFieldKey: confirmPasswordFieldKey,
                    confirmPasswordController: confirmPasswordController,
                  ),
                ),
                Center(
                  child: TextButton(
                    onPressed: () {
                      context.router.replace(LogInRoute());
                    },
                    child: Text.rich(
                      TextSpan(
                        text: 'Already have an account?',
                        style: Theme.of(context).textTheme.titleSmall,
                        children: [
                          TextSpan(
                            text: ' Log in',
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 23),
                _isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : PrimaryElevatedButton(
                        text: 'Sign Up',
                        onPressed: _onSignUpPressed,
                      ),
                const SizedBox(height: 29),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
