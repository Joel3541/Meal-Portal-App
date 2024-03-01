// navigation_bloc.dart

import 'package:bloc/bloc.dart';
import 'package:meal_portal/pages/homepage.dart';
import 'package:meal_portal/pages/schools.dart';
import 'package:meal_portal/pages/vendors.dart';

// Step 1: Define an abstract base class for navigation states
abstract class NavigationStates {}

// Step 2: Create concrete state classes for each page
class HomePageState extends NavigationStates {}

class SchoolsPageState extends NavigationStates{}

class VendorsPageState extends NavigationStates {}

// Step 3: Define navigation events
abstract class NavigationEvent {}

class GoToHomePageEvent extends NavigationEvent {}

class GoToSchoolsPageEvent extends NavigationEvent {}

class GoToVendorsPageEvent extends NavigationEvent {}

// Step 4: Define the NavigationBloc
class NavigationBloc extends Bloc<NavigationEvent, NavigationStates> 
{
  NavigationBloc(homePage) : super(HomePageState());

  @override
  Stream<NavigationStates> mapEventToState(NavigationEvent event) async* 
  {
    if (event is GoToHomePageEvent) 
    {
      yield HomePageState();
    } else if (event is GoToSchoolsPageEvent) 
    {
      yield SchoolsPageState();
    } else if (event is GoToVendorsPageEvent) 
    {
      yield VendorsPageState();
    }
  }
}
