import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:health_app/%20config/router/router.gr.dart';
import 'package:health_app/%20config/theme/widgets/appbar.dart';
import 'package:health_app/%20config/theme/widgets/drawer.dart';
import 'package:health_app/%20config/theme/widgets/primary_elevated_button.dart';
import 'package:health_app/features/home/presentation/widgets/custom_input_field.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _formKey = GlobalKey<FormState>();

  final systolicController = TextEditingController();
  final diastolicController = TextEditingController();
  final weightController = TextEditingController();
  final glucoseController = TextEditingController();
  final heartRateController = TextEditingController();

  @override
  void dispose() {
    systolicController.dispose();
    diastolicController.dispose();
    weightController.dispose();
    glucoseController.dispose();
    heartRateController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState?.validate() ?? false) {
      context.router.push(const ResultRoute());
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Please fill in all fields')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      drawer: DrawerWidget(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 35),
              Text(
                'Blood pressure',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: CustomInputField(
                      hint: 'systolic',
                      controller: systolicController,
                      validator: _validateNotEmpty,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Text('/', style: Theme.of(context).textTheme.bodyLarge),
                  const SizedBox(width: 6),
                  Expanded(
                    child: CustomInputField(
                      hint: 'diastolic',
                      controller: diastolicController,
                      validator: _validateNotEmpty,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 36),
              Text('Weight', style: Theme.of(context).textTheme.bodyLarge),
              const SizedBox(height: 8),
              Padding(
                padding: EdgeInsets.only(right: 124),
                child: CustomInputField(
                  hint: '(kg)',
                  controller: weightController,
                  validator: _validateNotEmpty,
                ),
              ),
              const SizedBox(height: 35),
              Text(
                'Glucose level',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 8),
              Padding(
                padding: EdgeInsets.only(right: 124),
                child: CustomInputField(
                  hint: '(mg/dL)',
                  controller: glucoseController,
                  validator: _validateNotEmpty,
                ),
              ),
              const SizedBox(height: 35),
              Text('Heart rate', style: Theme.of(context).textTheme.bodyLarge),
              const SizedBox(height: 8),
              Padding(
                padding: EdgeInsets.only(right: 124),
                child: CustomInputField(
                  hint: '(bpm)',
                  controller: heartRateController,
                  validator: _validateNotEmpty,
                ),
              ),
              const Spacer(),
              PrimaryElevatedButton(text: 'Check', onPressed: _submit),
              const SizedBox(height: 29),
            ],
          ),
        ),
      ),
    );
  }

  String? _validateNotEmpty(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Required';
    }
    return null;
  }
}
