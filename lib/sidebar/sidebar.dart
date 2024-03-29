import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_portal/bloc.navigation_bloc/navigation_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:meal_portal/sidebar/menu_item.dart';

class SideBar extends StatefulWidget 
{
  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> with SingleTickerProviderStateMixin<SideBar> 
{
  late AnimationController _animationController;
  late StreamController<bool> isSidebarOpenedStreamController;
  late Stream<bool> isSidebarOpenedStream;
  late StreamSink<bool> isSidebarOpenedSink;
  final _animationDuration = const Duration(milliseconds: 500);


  @override
  void initState() 
  {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: _animationDuration);
    isSidebarOpenedStreamController = PublishSubject<bool>();
    isSidebarOpenedStream = isSidebarOpenedStreamController.stream;
    isSidebarOpenedSink = isSidebarOpenedStreamController.sink;
  }


  @override
  void dispose() 
  {
    _animationController.dispose();
    isSidebarOpenedStreamController.close();
    isSidebarOpenedSink.close();
    super.dispose();
  }


  void onIconPressed() 
  {
    final animationStatus = _animationController.status;
    final isAnimationCompleted = animationStatus == AnimationStatus.completed;


    if (isAnimationCompleted) 
    {
      isSidebarOpenedSink.add(false);
      _animationController.reverse();
    } else {
      isSidebarOpenedSink.add(true);
      _animationController.forward();
    }
  }


  @override
  Widget build(BuildContext context) 
  {
    final screenWidth = MediaQuery.of(context).size.width;

    return StreamBuilder<bool>(
      initialData: false,
      stream: isSidebarOpenedStream,
      builder: (context, isSideBarOpenedAsync) 
      {
        return AnimatedPositioned(
          duration: _animationDuration,
          top: 0,
          bottom: 0,
          left: isSideBarOpenedAsync.data! ? 0 : -screenWidth,
          right: isSideBarOpenedAsync.data! ? 0 : screenWidth - 45,
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  color: Color(0xFF262AAA),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 50),
                      ListTile(
                        title: Text(
                          "Welcome Admin",
                          style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w800),
                        ),
                        subtitle: Text(
                          "info@faabsystems.com",
                          style: TextStyle(color: Color(0xFF1BB5FD), fontSize: 20),
                        ),
                        leading: CircleAvatar(
                          child: Icon(
                            Icons.perm_identity,
                            color: Colors.white,
                          ),
                          radius: 40,
                        ),
                      ),
                      Divider(
                        height: 50,
                        thickness: 0.5,
                        color: Colors.white.withOpacity(0.3),
                        indent: 30,
                        endIndent: 30,
                      ),
                      MenuItem(
                        icon: Icons.home,
                        title: "Home",
                        onTap: () {
                          onIconPressed();
                          var NavigationEvents;
                          BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.HomePageClickEvent);
                        },
                      ),
                      MenuItem(
                        icon: Icons.school_rounded,
                        title: "Schools",
                        onTap: () 
                        {
                          onIconPressed();
                          var NavigationEvents;
                          BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.SchoolsClickedEvent);
                        },
                      ),
                      MenuItem(
                        icon: Icons.restaurant_menu_rounded,
                        title: "Vendors",
                        onTap: () 
                        {
                          onIconPressed();
                          var NavigationEvents;
                          BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.VendorsClickedEvent);
                        },
                      ),
                      MenuItem(
                        icon: Icons.addchart_sharp,
                        title: "Add Schools",
                        onTap: () {},
                      ),
                      MenuItem(
                        icon: Icons.add_shopping_cart_rounded,
                        title: "Add Vendors",
                        onTap: () {},
                      ),
                      Divider(
                        height: 50,
                        thickness: 0.5,
                        color: Colors.white.withOpacity(0.3),
                        indent: 30,
                        endIndent: 30,
                      ),
                      MenuItem(
                        icon: Icons.settings,
                        title: "Settings",
                        onTap: () {},
                      ),
                      MenuItem(
                        icon: Icons.power_off_outlined,
                        title: "Log Out",
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment(0, -0.9),
                child: GestureDetector(
                  onTap: () 
                  {
                    onIconPressed();
                  },
                  child: ClipPath(
                    clipper: CustomMenuClipper(),
                    child: Container(
                      width: 35,
                      height: 110,
                      color: Color(0xFF262AAA),
                      alignment: Alignment.centerLeft,
                      child: AnimatedIcon(
                        progress: _animationController.view,
                        icon: AnimatedIcons.menu_close,
                        color: Color(0xFF1BB5FD),
                        size: 25,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}


class CustomMenuClipper extends CustomClipper<Path> 
{
  @override
  Path getClip(Size size) 
  {
    Paint paint = Paint();
    paint.color = Colors.white;

    final width = size.width;
    final height = size.height;

    Path path = Path();
    path.moveTo(0, 0);
    path.quadraticBezierTo(0, 8, 10, 16);
    path.quadraticBezierTo(width - 1, height / 2 - 20, width, height / 2);
    path.quadraticBezierTo(width + 1, height / 2 + 20, 10, height - 16);
    path.quadraticBezierTo(0, height - 8, 0, height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) 
  {
    return true;
  }
}
