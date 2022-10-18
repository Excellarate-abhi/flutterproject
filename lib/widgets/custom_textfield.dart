import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController? controller;
  final bool? obscure;
  final String? hint;
  final String? label;
  final TextInputType? inputType;
  final Function? validator;

  const CustomTextField(
      {this.controller,
      this.obscure,
      this.hint,
      this.inputType,
      this.validator,
      this.label,
      Key? key})
      : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool obsc = widget.obscure ?? false;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: widget.inputType,
      controller: widget.controller,
      obscureText: obsc,
      decoration: InputDecoration(
        hintText: widget.hint,
        labelText: widget.label,
        fillColor: Colors.grey.shade200,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.5),
          borderSide: const BorderSide(color: Colors.blue, width: 1.6),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.5),
          borderSide: const BorderSide(color: Colors.blue, width: 1.6),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.5),
          borderSide: const BorderSide(color: Colors.blue, width: 1.6),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.5),
          borderSide: const BorderSide(color: Colors.red, width: 1.6),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.5),
          borderSide: const BorderSide(color: Colors.white10, width: 1.6),
        ),
      ),
    );
  }
}
