import 'package:flutter/material.dart';
import 'package:volt_arena_app/utilities/custom_validator.dart';
import 'package:volt_arena_app/utilities/utilities.dart';
import 'package:volt_arena_app/widgets/custom_button.dart';
import 'package:volt_arena_app/widgets/custom_textformfield.dart';
import 'package:volt_arena_app/widgets/password_textformfield.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);
  static const routeName = '/SignupScreen';
  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController _name = TextEditingController();
    final TextEditingController _email = TextEditingController();
    final TextEditingController _password = TextEditingController();
    final TextEditingController _confirmPassword = TextEditingController();
    final GlobalKey<FormState> _key = GlobalKey<FormState>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Utilities.padding),
        child: Form(
          key: _key,
          child: Column(
            children: [
              _signupLine(context),
              const SizedBox(height: 30),
              CustomTextFormField(
                title: 'Name',
                controller: _name,
                autoFocus: true,
                validator: (String? value) => CustomValidator.lessThen4(value),
              ),
              CustomTextFormField(
                title: 'Email',
                controller: _email,
                validator: (String? value) => CustomValidator.email(value),
              ),
              PasswordTextFormField(controller: _password),
              PasswordTextFormField(
                controller: _confirmPassword,
                title: 'Confirm Password',
              ),
              CustomTextButton(
                  onTap: () {
                    if (_key.currentState!.validate()) {}
                  },
                  text: 'Sign up')
            ],
          ),
        ),
      ),
    );
  }

  Row _signupLine(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Text(
          'Sign up',
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
