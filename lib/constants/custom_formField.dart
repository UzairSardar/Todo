
import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  const  CustomFormField({
    super.key,
    this.text,
    required this.obscureText,
    this.keyboardType,
    this.suffixIcon,
    this.suffix,
    this.controller,
    this.validator,
    this.prefixIcon,
    this.focusNode
  });
  final String? text;
  final bool? obscureText;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final FocusNode? focusNode;
  final  suffix;
  final TextEditingController? controller ;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(bottom: 8),
      child: TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          style:  TextStyle(fontSize:16, color: Colors.black,fontWeight: FontWeight.w500),
          decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical:17,horizontal: 12),
              suffixIcon: suffixIcon,
              prefixIcon: prefixIcon,
              labelText: null,

              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.grey)
              ),
              focusedBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.orange)),
              hintText: text,
              hintStyle:  TextStyle(fontSize: 18,color: Colors.grey)),
          validator:
          validator
      ),
    );
  }
}