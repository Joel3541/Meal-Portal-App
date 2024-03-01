import 'package:flutter/material.dart';
import 'package:meal_portal/bloc.navigation_bloc/navigation_bloc.dart';
import 'package:meal_portal/pages/homepage.dart';
import 'package:meal_portal/sidebar/sidebar.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; 
import 'sidebar.dart'; // Import BlockProvider

void main() {
  runApp(SideBarLayout());
}

class SideBarLayout extends StatelessWidget 
{
  @override
  Widget build(BuildContext context) 
  {
    return MaterialApp(
      home: Scaffold(
        body: BlocProvider<NavigationBloc>(
          create: (context) => NavigationBloc(HomePage(onHomePageClicked: () {  },)), // Pass the initial page here
          child: Stack(
            children: <Widget>[
              BlocBuilder<NavigationBloc, NavigationStates>(
                builder: (context, navigationState) 
                {
                  return navigationState as Widget;
                },
              ),
              SideBar(),
            ],
          ),
        ),
      ),
    );
  }
}
