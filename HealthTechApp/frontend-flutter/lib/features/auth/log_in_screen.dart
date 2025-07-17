import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:health_app/features/auth/widgets/elevated_button.dart';
import 'package:health_app/features/auth/widgets/form_log_in.dart';
import 'package:health_app/%20config/router/router.gr.dart';
import 'package:talker_flutter/talker_flutter.dart';

@RoutePage()
class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenViewState();
}

class _LogInScreenViewState extends State<LogInScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  bool _autoValidate = false;
  final _formKey = GlobalKey<FormState>();

  final emailFieldKey = GlobalKey<FormFieldState>();
  final passwordFieldKey = GlobalKey<FormFieldState>();

  bool _isLoading = false;

  void _onLoginPressed() async {
    setState(() {
      _autoValidate = true;
      _isLoading = true;
    });

    final isValid = _formKey.currentState?.validate() ?? false;
    if (!isValid) {
      setState(() {
        _isLoading = false;
      });
      return;
    }

    // Заглушка — логика авторизации
    await Future.delayed(const Duration(seconds: 1));

    GetIt.I<Talker>().debug('Форма валидна, можно отправлять данные');

    // Переход на HomeRoute (замени на нужный экран)
    // if (context.mounted) {
    //   context.router.replace(HomeRoute());
    // }
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
                  child: FormWidgetLogIn(
                    formKey: _formKey,
                    emailFieldKey: emailFieldKey,
                    emailController: emailController,
                    emailFocusNode: emailFocusNode,
                    passwordFocusNode: passwordFocusNode,
                    autoValidate: _autoValidate,
                    passwordFieldKey: passwordFieldKey,
                    passwordController: passwordController,
                  ),
                ),
                SizedBox(height: 12),
                Center(
                  child: TextButton(
                    onPressed: () {
                      context.router.push(SignUpRoute());
                    },
                    child: Text.rich(
                      TextSpan(
                        text: 'Don\'t have an account?',
                        style: Theme.of(context).textTheme.titleSmall,
                        children: [
                          TextSpan(
                            text: ' Sign up',
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
                    : ElevatedButtonWidget(
                        text: 'Log In',
                        onPressed: _onLoginPressed,
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
