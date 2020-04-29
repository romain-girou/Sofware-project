import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heavent/shares/sidebar/bloc_navigation/bloc_navigation.dart';
import 'package:heavent/shares/sidebar/menu_item.dart';
import 'package:flutter/material.dart';
import 'menu_item.dart';
import 'package:rxdart/rxdart.dart';

class SideBar extends StatefulWidget {
  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar>
    with SingleTickerProviderStateMixin<SideBar> {
  //Colors primary and secondary
  final secondary_color = Color(0xFF53C999);
  final primary_color = Color(0xFF063B6D);

  //menu variable and for animation
  AnimationController _animationController;
  StreamController<bool> isSidebarOpenedStreamController;
  Stream<bool> isSidebarOpenedStream;
  StreamSink<bool> isSidebarOpenedSink;
  final _animationDuration = const Duration(milliseconds: 500);

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: _animationDuration);
    isSidebarOpenedStreamController = PublishSubject<bool>();
    isSidebarOpenedStream = isSidebarOpenedStreamController.stream;
    isSidebarOpenedSink = isSidebarOpenedStreamController.sink;
  }

  //* Different method to control the animation of the menu
  @override
  void dispose() {
    _animationController.dispose();
    isSidebarOpenedStreamController.close();
    isSidebarOpenedSink.close();
    super.dispose();
  }

  //* Different method to control the animation of the menu
  void onIconPressed() {
    final animationStatus = _animationController.status;
    final isAnimationCompleted = animationStatus == AnimationStatus.completed;

    if (isAnimationCompleted) {
      isSidebarOpenedSink.add(false);
      _animationController.reverse();
    } else {
      isSidebarOpenedSink.add(true);
      _animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return StreamBuilder<bool>(
        initialData: false,
        stream: isSidebarOpenedStream,
        builder: (context, isSideBarOpenedAsync) {
          return AnimatedPositioned(
            duration: _animationDuration,
            top: 0,
            bottom: 0,
            left: isSideBarOpenedAsync.data ? 0 : -screenWidth,
            right: isSideBarOpenedAsync.data ? 0 : screenWidth - 35,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    color: primary_color,
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 100,
                        ),
                        //info about the person connected
                        ListTile(
                          title: Text(
                            "Mickaël",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.w800),
                          ),
                          subtitle: Text(
                            "mickaelbenasse@gmail.com",
                            style: TextStyle(
                              color: secondary_color,
                              fontSize: 16,
                            ),
                          ),
                          leading: CircleAvatar(
                            radius: 30,
                            backgroundImage: ExactAssetImage("assets/images/portrait_1.png"),
                            
                              
                            ),
                          ),
                        
                        Divider(
                          height: 64,
                          thickness: 0.5,
                          color: secondary_color.withOpacity(0.5),
                          indent: 32,
                          endIndent: 32,
                        ),
                        //Here strart the icon to press for the navigation
                        MenuItem(
                          icon: Icons.home,
                          title: "Home",
                          onTap: () {
                            onIconPressed();
                            BlocProvider.of<NavigationBloc>(context)
                                .add(NavigationEvents.HomePageClickedEvent);
                          },
                        ),

                        MenuItem(
                          icon: Icons.person,
                          title: "Profile",
                          onTap: () {
                            onIconPressed();
                            BlocProvider.of<NavigationBloc>(context)
                                .add(NavigationEvents.ProfilePageClickedEvent);
                          },
                        ),
                        Divider(
                          height: 64,
                          thickness: 0.5,
                          color: secondary_color.withOpacity(0.5),
                          indent: 32,
                          endIndent: 32,
                        ),
                        MenuItem(
                          icon: Icons.settings,
                          title: "Settings",
                          onTap: () {
                            onIconPressed();
                            BlocProvider.of<NavigationBloc>(context)
                                .add(NavigationEvents.SettingPageClickedEvent);
                          },
                        ),
                        MenuItem(
                          icon: Icons.exit_to_app,
                          title: "Logout",
                        ),
                      ],
                    ),
                  ),
                ),
                //Alignment in order to be on top right of the side bar to have the icon dipslay
                Align(
                  alignment: Alignment(0, -0.9),
                  //Icon inside this
                  child: GestureDetector(
                    onTap: () {
                      onIconPressed();
                    },
                    child: ClipPath(
                      //here we call the function for the shape of the menu clipper
                      clipper: CustomMenuClipper(),
                      child: Container(
                        width: 35,
                        height: 110,
                        color: primary_color,
                        alignment: Alignment.centerLeft,
                        //animate as well the icon
                        child: AnimatedIcon(
                          progress: _animationController.view,
                          icon: AnimatedIcons.menu_close,
                          color: secondary_color,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}

//function to the shape of the menu clipper
class CustomMenuClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
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
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
