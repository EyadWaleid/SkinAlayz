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

      style:Theme.of(context).textTheme.titleSmall!.copyWith(color:AppColour.primaryBlack,fontSize:16),
      decoration:  InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        //the style of label in the floating or in the form
        labelText:labeled,
        labelStyle: Theme.of(context).textTheme.labelMedium?.copyWith(color: Colors.white),
        floatingLabelAlignment: FloatingLabelAlignment.start,
        floatingLabelStyle:  TextStyle(color:AppColour.primaryBlack,fontSize: 20),
        //the colour of the formBox
        fillColor: AppColour.primaryColor,
        filled: isFilled??false,
        //the status of the form box in the enable focus and error
        focusedBorder:UnderlineInputBorder(borderSide: BorderSide.none,borderRadius: BorderRadius.circular(15)),
        enabledBorder: const OutlineInputBorder(borderRadius:BorderRadius.all(Radius.circular(15)),borderSide:BorderSide.none),
        errorBorder: const OutlineInputBorder(borderRadius:BorderRadius.all(Radius.circular(15)),borderSide: BorderSide(color: Colors.red) ),
        //the icons of the form box
        prefixIcon:  Icon(icon,color: Colors.white,),
        suffixIcon:IconButton(color:Colors.white, onPressed:onPressed, icon:suffixIcon ??Icon(null) ),
      ),
      cursorColor: Colors.white,

      validator: validator??(value){

      },

    );
  }
}
