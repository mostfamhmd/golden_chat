// ignore_for_file: body_might_complete_normally_nullable

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextFormFieldComponent extends StatefulWidget {
  TextFormFieldComponent({super.key, this.hintext, this.onChanged});
  Function(String)? onChanged;
  String? hintext;

  @override
  State<TextFormFieldComponent> createState() => _TextFormFieldComponentState();
}

class _TextFormFieldComponentState extends State<TextFormFieldComponent> {
  bool isHiding = true;
  @override
  Widget build(BuildContext context) {
    return widget.hintext == "Email"
        ? TextFormField(
            validator: (data) {
              if (data!.isEmpty) {
                return "this field is required";
              }
            },
            onChanged: widget.onChanged,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: widget.hintext,
              hintStyle: const TextStyle(color: Colors.white),
              border: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                ),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                ),
              ),
            ),
          )
        : TextFormField(
            obscureText: isHiding,
            validator: (data) {
              if (data!.isEmpty) {
                return "this field is required";
              }
            },
            onChanged: widget.onChanged,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              suffixIcon: isHiding == true
                  ? GestureDetector(
                      onTap: () {
                        isHiding = false;
                        setState(() {});
                      },
                      child: const Icon(Icons.remove_red_eye))
                  : GestureDetector(
                      onTap: () {
                        isHiding = true;
                        setState(() {});
                      },
                      child: const Icon(Icons.remove_red_eye_outlined)),
              suffixIconColor: Colors.white,
              hintText: widget.hintext,
              hintStyle: const TextStyle(color: Colors.white),
              border: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                ),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                ),
              ),
            ),
          );
  }
}
