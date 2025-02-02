import 'package:flutter/material.dart';
import 'package:instagram_clone/constants/screen_size.dart';
import 'package:instagram_clone/widgets/profile_body.dart';
import 'package:instagram_clone/widgets/profile_side_menu.dart';

const duration = Duration(milliseconds: 1000);

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final duration = Duration(milliseconds: 300);
  final menuWidth = size.width / 3 * 2;

  MenuStatus _menuStatus = MenuStatus.closed;
  double bodyXPos = 0;
  double menuXPos = size.width;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Stack(
        children: [
          AnimatedContainer(
            duration: duration,
            curve: Curves.fastOutSlowIn,
            child: ProfileBody(
              onMenuChanged: () {
                setState(() {
                  _menuStatus = (_menuStatus == MenuStatus.closed)
                      ? MenuStatus.opened
                      : MenuStatus.closed;
                  switch (_menuStatus) {
                    case MenuStatus.opened:
                      bodyXPos = -menuWidth;
                      menuXPos = size.width - menuWidth;
                      break;
                    case MenuStatus.closed:
                      bodyXPos = 0;
                      menuXPos = size.width;
                      break;
                  }
                });
              },
            ),
            transform: Matrix4.translationValues(bodyXPos, 0, 0),
          ),
          AnimatedContainer(
            duration: duration,
            transform: Matrix4.translationValues(menuXPos, 0, 0),
            child: ProfileSideMenu(menuWidth),
          ),
        ],
      ),
    );
  }
}

enum MenuStatus { opened, closed }
