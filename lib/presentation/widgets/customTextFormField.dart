import 'package:flutter/material.dart';
import 'package:support/presentation/utils/app_colors.dart';
import 'package:support/presentation/utils/values_manager.dart';

class CustomTextFormField extends StatelessWidget {
  final String text;

  final String? hint;



  final String? Function(String?)? validator;

  const CustomTextFormField({super.key,
  this.text="",
  this.hint,
  this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(

          validator: validator,
          style: const TextStyle(
            color: AppColors.deepBlue,
          ),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(
              color:AppColors.deepBlue,
            ),
            contentPadding: EdgeInsets.only(left:MediaQuery.of(context).size.width * 0.3),
            enabledBorder: OutlineInputBorder(
              borderSide:   BorderSide(color: AppColors.blue),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.deepBlue),
              borderRadius: BorderRadius.circular(10),
            ),

          ),

        )
      ],
    );
  }
}
