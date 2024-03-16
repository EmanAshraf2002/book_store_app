import 'package:bookly_app/Core/Utlis/styles.dart';
import 'package:flutter/material.dart';

class CustomError extends StatelessWidget{
  final String errorMessage;
  const CustomError({super.key, required this.errorMessage});
  @override
  Widget build(BuildContext context) {
    return Center(child: Text(errorMessage , style: Styles.textStyle18,));
  }

}