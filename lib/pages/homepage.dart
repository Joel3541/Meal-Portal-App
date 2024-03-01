import 'package:flutter/material.dart';
import 'package:meal_portal/bloc.navigation_bloc/navigation_bloc.dart';

class HomePage extends StatelessWidget 
{
  final Function() onHomePageClicked; // Callback for homepage click

  const HomePage({required this.onHomePageClicked});

  @override
  Widget build(BuildContext context) 
  {
    return GestureDetector(
      onTap: onHomePageClicked,
      child: Center(
        child: Text(
          "Homepage",
          style: TextStyle(fontWeight: FontWeight.w900, fontSize: 28),
        ),
      ),
    );
  }
}
