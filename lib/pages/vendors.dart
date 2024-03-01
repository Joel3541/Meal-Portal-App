import 'package:flutter/material.dart';
import 'package:meal_portal/bloc.navigation_bloc/navigation_bloc.dart';

class Vendors extends StatelessWidget 
{
  final Function() onVendorsClicked; // Callback for vendors page click

  const Vendors({required this.onVendorsClicked});

  @override
  Widget build(BuildContext context) 
  {
    return GestureDetector(
      onTap: onVendorsClicked,
      child: Center(
        child: Text(
          "Vendors",
          style: TextStyle(fontWeight: FontWeight.w900, fontSize: 28),
        ),
      ),
    );
  }
}
