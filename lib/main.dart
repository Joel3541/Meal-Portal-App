// main.dart

import 'package:flutter/material.dart';
import 'package:meal_portal/bloc.navigation_bloc/navigation_bloc.dart';
import 'package:meal_portal/pages/homepage.dart';
import 'package:meal_portal/pages/schools.dart';
import 'package:meal_portal/pages/vendors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_portal/sidebar/sidebar.dart'; // Import BlockProvider

void main() 
{
  runApp(SideBarLayout());
}

class SideBarLayout extends StatelessWidget 
{
  @override
  Widget build(BuildContext context) 
  {
    return MaterialApp(
      home: BlocProvider<NavigationBloc>(
        create: (context) => NavigationBloc(HomePage),
        child: SideBarNavigation(),
      ),
    );
  }
}

class SideBarNavigation extends StatelessWidget 
{
  @override
  Widget build(BuildContext context) 
  {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          BlocBuilder<NavigationBloc, NavigationStates>(
            builder: (context, state) 
            {
              if (state is HomePageState) 
              {
                return HomePage(onHomePageClicked: () 
                {
                  BlocProvider.of<NavigationBloc>(context)
                      .add(GoToHomePageEvent());
                });
              } else if (state is SchoolsPageState) 
              {
                return Schools(onSchoolsClicked: () 
                {
                  BlocProvider.of<NavigationBloc>(context)
                      .add(GoToSchoolsPageEvent());
                });
              } else if (state is VendorsPageState) 
              {
                return Vendors(onVendorsClicked: () 
                {
                  BlocProvider.of<NavigationBloc>(context)
                      .add(GoToVendorsPageEvent());
                });
              }
              return Container(); // Placeholder, handle other states as needed
            },
          ),
          SideBar(),
        ],
      ),
    );
  }
}
