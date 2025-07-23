import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:health_app/%20config/format/text_date_format.dart';
import 'package:health_app/%20config/theme/widgets/primary_elevated_button.dart';
import 'package:health_app/features/form/presentation/widgets/custom_textfield.dart';
import 'package:health_app/features/form/presentation/widgets/gender_selection.dart';
import 'package:talker_flutter/talker_flutter.dart';

@RoutePage()
class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  Set<String> _selected = {'F'};
  final TextEditingController dateController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  bool _isChecked = false;
  bool _isCheckedSmoke = false;
  bool _isLoading = false;
  bool _autoValidate = false;
  final _formKey = GlobalKey<FormState>();

  void updateSelected(Set<String> newSelection) {
    setState(() {
      _selected = newSelection;
    });
  }

  void _onLoginPressed() async {
    setState(() {
      _autoValidate = true;
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 33),
                SvgPicture.asset(
                  'assets/Generic_avatar.svg',
                  width: 124,
                  height: 124,
                ),
                SizedBox(height: 11),
                Text('Nexium', style: Theme.of(context).textTheme.labelLarge),
                SizedBox(height: 2),
                Text(
                  'user@nexium.com',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                SizedBox(height: 23),
                Text(
                  'Let\'s fill base info about you',
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                SizedBox(height: 22),
                Text(
                  'Choose your sex',
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                GenderSelection(
                  selected: _selected,
                  onSelectionChanged: updateSelected,
                ),
                SizedBox(height: 20.5),
                CustomTextfield(
                  dateController: dateController,
                  inputFormatters: [
                    DateInputFormatter(),
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9/]')),
                    LengthLimitingTextInputFormatter(10),
                  ],
                  keyboardType: TextInputType.datetime,
                  labelText: 'Birthday date',
                  helperText: 'MM/DD/YYYY',
                  sufficbutton: IconButton(
                    onPressed: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime(2101),
                      );
                      if (pickedDate != null) {
                        setState(() {
                          dateController.text =
                              "${pickedDate.month.toString().padLeft(2, '0')}/${pickedDate.day.toString().padLeft(2, '0')}/${pickedDate.year}";
                        });
                      }
                    },
                    icon: const Icon(Icons.calendar_today),
                  ),
                ),

                SizedBox(height: 14),
                CustomTextfield(
                  dateController: heightController,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                    LengthLimitingTextInputFormatter(3),
                  ],
                  keyboardType: TextInputType.number,
                  labelText: 'Height',
                  helperText: '(cm)',
                ),
                SizedBox(height: 2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Do you drink alcohol more than 3 times \n a week?',
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    SizedBox(width: 4),
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
                  ],
                ),
                SizedBox(height: 23),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Do you smoke more than 3 times a day?',
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    SizedBox(width: 4),
                    Checkbox(
                      value: _isCheckedSmoke,
                      onChanged: (value) {
                        setState(() {
                          _isCheckedSmoke = value ?? false;
                        });
                      },
                      checkColor: Color(0xFFFCFFF3),
                      activeColor: Color(0xFF8D957E),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                  ],
                ),
                Spacer(),
                PrimaryElevatedButton(
                  text: 'Log In',
                  onPressed: _isChecked
                      ? _onLoginPressed
                      : () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Please agree to our terms'),
                            ),
                          );
                        },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
