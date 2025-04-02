import 'package:flutter/material.dart';

class TextFieldStyle extends StatelessWidget {
  final String hintText;
  final IconData prefixIcon;
  final IconData? suffixIcon;
  final VoidCallback? onTap;  
  final bool obscureText;
  final TextEditingController controller;
  final bool autofocus;
  

  const TextFieldStyle({
    super.key,
    required this.hintText,
    required this.prefixIcon,
    this.suffixIcon,
    required this.controller,
    this.obscureText = false,
    this.onTap,
    this.autofocus = false,
  
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
                      child: TextField(
                        obscureText: obscureText,
                        autofocus: autofocus,
                        controller: controller,
                        decoration: InputDecoration(
                          hintText: hintText,
                          prefixIcon: Icon(prefixIcon),
                          suffixIcon: controller.text.isNotEmpty ? IconButton(onPressed: ()=> controller.clear(), icon: Icon(Icons.clear),):null,
                          fillColor: Colors.white,
                          filled: true,
                          labelStyle: TextStyle(color: Colors.black),
                          focusedBorder: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                        ),
                        onSubmitted: (value) => controller,
                      ),
                      
                    );
  }
}