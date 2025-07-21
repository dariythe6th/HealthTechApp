import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:health_app/features/auth/presentation/widgets/elevated_button.dart';
import 'package:health_app/features/auth/presentation/widgets/form_log_in.dart';
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

  final _formKey = GlobalKey<FormState>();

  final emailFieldKey = GlobalKey<FormFieldState>();
  final passwordFieldKey = GlobalKey<FormFieldState>();

  bool _autoValidate = false;
  bool _isLoading = false;
  bool _isChecked = false;

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
    print(Theme.of(context).textTheme.titleSmall);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
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
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Checkbox(
                    value: _isChecked,
                    onChanged: (value) {
                      setState(() {
                        _isChecked = value ?? false;
                      });
                    },
                    checkColor: Color(0xFFFCFFF3),
                    activeColor: Color(0xFF8D957E),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  SizedBox(width: 0),
                  Text(
                    'lalalalla',
                    style: Theme.of(
                      context,
                    ).textTheme.bodySmall!.copyWith(color: Color(0xFF364025)),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 37),
                child: Text(
                  'lalalalla',
                  style: Theme.of(context).textTheme.bodySmall,
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
              ElevatedButtonWidget(
                text: 'Log In',
                onPressed: _isChecked
                    ? _onLoginPressed
                    : () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Please agree to our terms')),
                        );
                      },
              ),
              const SizedBox(height: 29),
            ],
          ),
        ),
      ),
    );
  }
}
