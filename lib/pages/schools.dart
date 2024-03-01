import 'package:flutter/material.dart';
import 'package:meal_portal/bloc.navigation_bloc/navigation_bloc.dart';

class Schools extends StatelessWidget 
{
  final Function() onSchoolsClicked; // Callback for schools page click

  const Schools({required this.onSchoolsClicked});

  @override
  Widget build(BuildContext context) 
  {
    return GestureDetector(
      onTap: onSchoolsClicked,
      child: Center(
        child: Text(
          "Schools",
          style: TextStyle(fontWeight: FontWeight.w900, fontSize: 28),
        ),
      ),
    );
  }
}
