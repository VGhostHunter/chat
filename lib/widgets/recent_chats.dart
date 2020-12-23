import 'package:chat/constants.dart';
import 'package:chat/models/message_model.dart';
import 'package:chat/screens/chat_screen.dart';
import 'package:chat/utils/colors_util.dart';
import 'package:flutter/material.dart';

class RecentChats extends StatelessWidget {

  bool isCollapsed;

  RecentChats({this.isCollapsed});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0)
          ),
        ),
        child: ListView.builder(
          //因为没有设置appBar 此时listView无法置顶 所以需要设置padding
          padding: EdgeInsets.only(top: 0.0),
          itemCount: chats.length,
          itemBuilder: (BuildContext context, index) {
            final Message chat = chats[index];
            return GestureDetector(
              onTap: () => Navigator.push(context, MaterialPageRoute(
                //真实聊天情况应该传递 id
                builder: (_) => ChatScreen(user: chat.sender,),
              )),
              child: Column(
                children: <Widget>[
                  new Padding(
                      padding: EdgeInsets.zero,
                      child: new Divider(
                        height: 1.0,
                        endIndent: 28,
                        color: Colors.black,
                      )
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
//                margin: EdgeInsets.only(bottom: 1.0),
                    decoration: BoxDecoration(
                        color: backGroundColor2,
                        borderRadius: BorderRadius.only(
//                          topRight: Radius.circular(30.0),
                          bottomRight: Radius.circular(30.0),
                        )
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Container(
                              child: Stack(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Container(
                                      width: 54.0,
                                      height: 54.0,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5.0),
                                        image: DecorationImage(
                                          image: AssetImage(chat.sender.imageUrl)
                                        )
                                      ),
                                    ),
                                  ),
                                  chat.unread ?
                                  Positioned(
                                    top: 0.0,
                                    right: 0.0,
                                    child: Container(
                                      width: 16.0,
                                      height: 16.0,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: Colors.redAccent,
                                          borderRadius: BorderRadius.circular(8.0)
                                      ),
                                      child: Text(
                                        "1",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 12
                                        ),
                                      ),
                                    ),
                                  ) :
                                  SizedBox.shrink()
                                ],
                              ),
                            ),
                            SizedBox(width: 10.0,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  chat.sender.name,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.normal
                                  ),
                                ),
                                SizedBox(height: 15.0,),
                                Container(
                                  width: isCollapsed ? size.width * 0.1 : size.width * 0.1,
                                  child: Text(
                                    chat.text,
                                    maxLines: 1,
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Text(
                              chat.time,
                              style: TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.w200,
                                color: Colors.white60
                              ),
                            ),
                            SizedBox(height: 15.0,),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
        ),
      ),
    );
  }
}