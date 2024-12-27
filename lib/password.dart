import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EnterYourPassword extends StatefulWidget {
  EnterYourPassword(
      {super.key,
      required this.controller,
      required this.formKey,
      required this.focusNode,
      required this.validator, required this.onFieldSubmitted});
  var controller;
  var formKey;
  var focusNode;
  Function(String)? onFieldSubmitted;
  String? Function(String?)? validator;
  @override
  State<EnterYourPassword> createState() => _EnterYourPasswordState();
}

class _EnterYourPasswordState extends State<EnterYourPassword> {
  var isObscureTrue = true;
  @override
  Widget build(BuildContext context) {
    return Form(
        key: widget.key,
        autovalidateMode: AutovalidateMode.always,
        child: TextFormField(
          onFieldSubmitted:widget.onFieldSubmitted ,
          obscureText: isObscureTrue,
          validator: widget.validator,
          controller: widget.controller,
          focusNode: widget.focusNode,
          keyboardType: TextInputType.text,
          onChanged: (value) {
            setState(() {});
          },
          decoration: InputDecoration(
              label: const FittedBox(
                child: Text(
                  'Enter your Password',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              prefixIcon: const Icon(Icons.lock),
              suffixIcon: (isObscureTrue == true)
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          isObscureTrue = false;
                        });
                      },
                      icon: const Icon(Icons.visibility))
                  : IconButton(
                      onPressed: () {
                        setState(() {
                          isObscureTrue = true;
                        });
                      },
                      icon: const Icon(Icons.visibility_off)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: const BorderSide(color: Colors.brown, width: 2)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: (widget.controller.text.isEmpty)
                      ? const BorderSide(color: Colors.black, width: 1)
                      : const BorderSide(color: Colors.green, width: 2))),
        ));
  }
}
