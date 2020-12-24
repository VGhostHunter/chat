import 'package:chat/constants.dart';
import 'package:chat/models/message_model.dart';
import 'package:chat/utils/colors_util.dart';
import 'package:chat/widgets/category_selector.dart';
import 'package:chat/widgets/favorite_contacts.dart';
import 'package:chat/widgets/recent_chats.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {

  final Duration duration = const Duration(milliseconds: 300);
  double screenWidth, screenHeight;
  bool isCollapsed = true;

  AnimationController _controller;
  Animation<double> _scaleAnimation;
  Animation<double> _menuScaleAnimation;
  Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: duration);
    _scaleAnimation = Tween<double>(begin: 1, end: 0.8).animate(_controller);
    _menuScaleAnimation = Tween<double>(begin: 0.5, end: 1).animate(_controller);
    _slideAnimation = Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0)).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      body: Stack(
        children: <Widget>[
          menuWidget(context),
          chatWidget(context),
        ],
      )
    );
  }

  //TODO 重构
  Widget chatWidget(context) {
    Size size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;

    return AnimatedPositioned(
      duration: duration,
      top: 0,
      bottom: 0,
      left: isCollapsed ? 0 : 0.5 * screenWidth,
      right: isCollapsed ? 0 : -0.2 * screenWidth,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Material(
          elevation: 8.0,
          animationDuration: duration,
          borderRadius: BorderRadius.all(Radius.circular(40.0)),
          color: backGroundColor,
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 16, right: 16, top: 45, bottom: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    InkWell(
                      child: Icon(
                          Icons.menu, color: ColorsUtil.hexColor(0xbacac6)
                      ),
                      onTap: () {
                        setState(() {
                          if(isCollapsed) {
                            _controller.forward();
                          } else {
                            _controller.reverse();
                          }
                          isCollapsed = !isCollapsed;
                        });
                      },
                    ),
                    Text(
                      'Chats',
                      style: TextStyle(
                          fontSize: 21.0,
                          fontWeight: FontWeight.bold,
                          color: ColorsUtil.hexColor(0xbacac6)
                      ),
                    ),
                    Icon(Icons.search, color: ColorsUtil.hexColor(0xbacac6),),
                  ],
                ),
              ),
              CategorySelector(),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: backGroundColor2,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(45.0),
                      topRight: Radius.circular(45.0),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      FavoriteContacts(),
                      RecentChats(isCollapsed : isCollapsed),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget menuWidget(BuildContext context) {
    return SlideTransition(
      position: _slideAnimation,
      child: ScaleTransition(
        scale: _menuScaleAnimation,
        child: Padding(
          padding: EdgeInsets.only(left: 8.0, right: MediaQuery.of(context).size.width / 1.7),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 6.0),
                  child: UserAccountsDrawerHeader(
                    accountName: Text(
                      currentUser.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: ColorsUtil.hexColor(0xbacac6),
                      ),
                    ),
                    accountEmail: Text(
                      '275688678@qq.com',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: ColorsUtil.hexColor(0xbacac6),
                      ),
                    ),
                    currentAccountPicture: CircleAvatar(
                      backgroundColor: backGroundColor,
                      backgroundImage: AssetImage(currentUser.imageUrl),
                    ),
                    decoration: BoxDecoration(
  //                    image: DecorationImage(
  //                      image: AssetImage(currentUser.imageUrl),
  //                      fit: BoxFit.cover,
  //                      colorFilter: ColorFilter.mode(
  //                        Theme.of(context).primaryColor,
  //                        BlendMode.hardLight
  //                      ),
  //                    ),
                    ),
                  ),
                ),
                SizedBox(height: 35,),
                Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.home,
                            color: ColorsUtil.hexColor(0xbacac6),
                            size: 22.0,
                          ),
                          SizedBox(width: 15.0,),
                          Text(
                            'Home',
                            style: TextStyle(
                                color: ColorsUtil.hexColor(0xbacac6),
                                fontSize: 16,
                                fontWeight: FontWeight.bold
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 18,),
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.group_add,
                            color: ColorsUtil.hexColor(0xbacac6),
                            size: 22.0,
                          ),
                          SizedBox(width: 15.0,),
                          Text(
                            'Add',
                            style: TextStyle(
                                color: ColorsUtil.hexColor(0xbacac6),
                                fontSize: 16,
                                fontWeight: FontWeight.bold
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 18,),
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.settings,
                            color: ColorsUtil.hexColor(0xbacac6),
                            size: 22.0,
                          ),
                          SizedBox(width: 15.0,),
                          Text(
                            'Setting',
                            style: TextStyle(
                                color: ColorsUtil.hexColor(0xbacac6),
                                fontSize: 16,
                                fontWeight: FontWeight.bold
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 18,),
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.favorite,
                            color: ColorsUtil.hexColor(0xbacac6),
                            size: 22.0,
                          ),
                          SizedBox(width: 15.0,),
                          Text(
                            'Favorite',
                            style: TextStyle(
                                color: ColorsUtil.hexColor(0xbacac6),
                                fontSize: 16,
                                fontWeight: FontWeight.bold
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 18,),
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.accessibility,
                            color: ColorsUtil.hexColor(0xbacac6),
                            size: 22.0,
                          ),
                          SizedBox(width: 15.0,),
                          Text(
                            'Me',
                            style: TextStyle(
                                color: ColorsUtil.hexColor(0xbacac6),
                                fontSize: 16,
                                fontWeight: FontWeight.bold
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.32,),
                    ],
                  ),
                ),
                Row(
                  children: <Widget>[
                    SizedBox(width: 8.0,),
                    IconButton(
                      icon: Icon(
                        Icons.keyboard_tab,
                        color: ColorsUtil.hexColor(0xbacac6),
                      ),
                      onPressed: () {},
                    ),
                    SizedBox(width: 3.0,),
                    Text(
                      'Logout',
                      style: TextStyle(
                          color: ColorsUtil.hexColor(0xbacac6),
                          fontSize: 16,
                          fontWeight: FontWeight.bold
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}