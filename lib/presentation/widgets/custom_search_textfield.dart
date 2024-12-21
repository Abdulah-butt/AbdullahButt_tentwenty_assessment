import 'package:flutter/material.dart';
import 'package:tentwenty_assessment/core/utils/assets.dart';
import 'package:tentwenty_assessment/presentation/widgets/custom_textfield.dart';

class CustomSearchTextField extends StatefulWidget {
  final TextEditingController controller;
  final String? hint;
 final Function(String)? onChange;
 final Function(String)? onSubmit;

  const CustomSearchTextField({super.key,required this.controller,this.hint,this.onChange,this.onSubmit});

  @override
  State<CustomSearchTextField> createState() => _CustomSearchTextFieldState();
}

class _CustomSearchTextFieldState extends State<CustomSearchTextField> {
  bool showClearButton=false;
  @override
  Widget build(BuildContext context) {
    return  CustomTextField(
      controller:widget.controller,
      hint: widget.hint,
      textFieldMode: TextFieldMode.search,
      bottomPadding: 0,
      suffixPath: showClearButton?Assets.cross:null,
      onSubmit: (va){
        widget.onSubmit?.call(va);
      },
      suffixAction: (){
        setState(() {
          showClearButton=false;
          widget.controller.text="";
        });
      },
      onChange: (va){
        if(va.trim().isNotEmpty){
          widget.onChange?.call(va);
        }
        setState(() {
          showClearButton=va.trim().isNotEmpty;
        });
      },
    );
  }
}
