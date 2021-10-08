import 'package:flutter/material.dart';
import 'package:volt_arena_app/utilities/custom_validator.dart';
import 'package:volt_arena_app/utilities/utilities.dart';
import 'package:volt_arena_app/widgets/custom_button.dart';
import 'package:volt_arena_app/widgets/custom_textformfield.dart';
import 'package:volt_arena_app/widgets/password_textformfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const String routeName = '/LoginScreen';
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Utilities.padding),
        child: Form(
          key: _key,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              _loginWord(context),
              CustomTextFormField(
                title: 'Email',
                controller: _email,
                hint: 'example@example.com',
                validator: (String? value) => CustomValidator.email(value),
                autoFocus: true,
              ),
              PasswordTextFormField(controller: _password),
              _forgetPassword(),
              CustomTextButton(
                onTap: () {
                  if (_key.currentState!.validate()) {}
                },
                text: 'Login',
              ),
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector _forgetPassword() {
    return GestureDetector(
      onTap: () {
        // TODO: Forget password
      },
      child: Container(
        padding: const EdgeInsets.all(6),
        alignment: Alignment.centerRight,
        child: const Text('Forget password?'),
      ),
    );
  }

  Row _loginWord(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Text(
          'Login',
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 4),
          child: Icon(
            Icons.fiber_manual_record,
            size: 18,
          ),
        )
      ],
    );
  }
}
