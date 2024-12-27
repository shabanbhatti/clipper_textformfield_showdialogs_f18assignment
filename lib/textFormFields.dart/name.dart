import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EnterYourName extends StatefulWidget {
  EnterYourName(
      {super.key,
      required this.controller,
      required this.formKey,
      required this.focusNode,
      required this.validator,
      required this.onFieldSubmitted});
  var controller;
  var formKey;
  var focusNode;
  Function(String)? onFieldSubmitted;
  String? Function(String?)? validator;
  @override
  State<EnterYourName> createState() => _EnterYourNameState();
}

class _EnterYourNameState extends State<EnterYourName> {
  @override
  Widget build(BuildContext context) {
    return Form(
        key: widget.key,
        autovalidateMode: AutovalidateMode.always,
        child: TextFormField(
          onFieldSubmitted: widget.onFieldSubmitted,
          validator: widget.validator,
          controller: widget.controller,
          focusNode: widget.focusNode,
          keyboardType: TextInputType.name,
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp('[a-z A-Z \\s]'))
          ],
          onChanged: (value) {
            setState(() {});
          },
          decoration: InputDecoration(
              label: const FittedBox(
                child: Text(
                  'Enter your Name',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              prefixIcon: const Icon(Icons.person),
              suffixIcon: (widget.controller.text.isNotEmpty)
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          widget.controller.clear();
                        });
                      },
                      icon: const Icon(Icons.close))
                  : null,
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
