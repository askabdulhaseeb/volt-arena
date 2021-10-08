import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:volt_arena_app/utilities/custom_validator.dart';
import '../../utilities/utilities.dart';

class PasswordTextFormField extends StatefulWidget {
  const PasswordTextFormField({
    required TextEditingController controller,
    Key? key,
  })  : _controller = controller,
        super(key: key);
  final TextEditingController _controller;
  @override
  PasswordTextFormFieldState createState() => PasswordTextFormFieldState();
}

class PasswordTextFormFieldState extends State<PasswordTextFormField> {
  bool _notVisible = true;
  void _onListener() => setState(() {});
  @override
  void initState() {
    widget._controller.addListener(_onListener);
    super.initState();
  }

  @override
  void dispose() {
    widget._controller.removeListener(_onListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: TextFormField(
        controller: widget._controller,
        obscureText: _notVisible,
        validator: (String? value) => CustomValidator.password(value),
        decoration: InputDecoration(
          labelText: 'Password',
          hintText: 'Password',
          suffixIcon: IconButton(
            onPressed: () => setState(() {
              _notVisible = !_notVisible;
            }),
            splashRadius: Utilities.padding,
            icon: (_notVisible == true)
                ? const Icon(CupertinoIcons.eye)
                : const Icon(CupertinoIcons.eye_slash),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Utilities.borderRadius),
          ),
        ),
      ),
    );
  }
}
