import 'package:flutter/material.dart';
import 'package:skinalayz/utli/constant/colours.dart';
class FormBox extends StatelessWidget {
  String labeled;
  Widget? suffixIcon;
  IconData? icon;
  bool? isObscured;
  bool?  isFilled;
  TextInputType? keyboardType;
  String? Function(String?)? validator;
  void Function()? onPressed ;
  TextEditingController controller;

  FormBox({super.key,this.onPressed,this.isFilled,required this.labeled,required this.icon,this.isObscured, this.validator,this.keyboardType,required this.controller,this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return   TextFormField(
      keyboardType: keyboardType??null,
      controller:controller ,
      maxLines: 1,
      obscureText: isObscured??false,
      decoration:  InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical:15),
        fillColor: AppColour.primaryColor,
        filled: isFilled??false,
        label:Text(labeled,style: Theme.of(context).textTheme.labelMedium?.copyWith(color: Colors.white)),
        suffixIcon:IconButton(color:Colors.white, onPressed:onPressed, icon:suffixIcon ??Icon(null) ),
        enabledBorder: const OutlineInputBorder(borderRadius:BorderRadius.all(Radius.circular(15)),borderSide:BorderSide.none),
        prefixIcon:  Icon(icon,color: Colors.white,),
      ),
      validator: validator??(value){

      },

    );
  }
}
