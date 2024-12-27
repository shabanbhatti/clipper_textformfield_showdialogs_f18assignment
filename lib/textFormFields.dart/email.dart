import 'package:flutter/material.dart';

class EnterYourEmail extends StatefulWidget {
  EnterYourEmail(
      {super.key,
      required this.controller,
      required this.formKey,
      required this.focusNode,
      required this.validator, required this.onFieldSubmitted});

  String? Function(String?)? validator;
  var controller;
  var formKey;
  var focusNode;
  Function(String)? onFieldSubmitted;

  @override
  State<EnterYourEmail> createState() => _EnterYourEmailState();
}

class _EnterYourEmailState extends State<EnterYourEmail> {
  @override
  Widget build(BuildContext context) {
    var mqSize = MediaQuery.of(context).size;
    return Form(
        key: widget.key,
        autovalidateMode: AutovalidateMode.always,
        child: SizedBox(
          
          child: TextFormField(
            onFieldSubmitted:widget.onFieldSubmitted ,
            validator: widget.validator,
            controller: widget.controller,
            focusNode: widget.focusNode,
            onChanged: (value) {
              setState(() {});
            },
            decoration: InputDecoration(
                label: const FittedBox(
                  child: Text(
                    'Enter your Email',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                prefixIcon: const Icon(Icons.mail),
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
          ),
        ));
  }
}
