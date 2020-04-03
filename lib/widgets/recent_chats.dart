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
//          color: ColorsUtil.hexColor(0xbacac6),
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
                    padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 11.0),
//                margin: EdgeInsets.only(bottom: 1.0),
                    decoration: BoxDecoration(
                        color: chat.unread ? Theme.of(context).primaryColor : ColorsUtil.hexColor(0x424c50),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30.0),
                          bottomRight: Radius.circular(30.0),
                        )
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            CircleAvatar(
                              radius: 30.0,
                              backgroundImage: AssetImage(chat.sender.imageUrl),
                            ),
                            SizedBox(width: 10.0,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  chat.sender.name,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                                SizedBox(height: 15.0,),
                                Container(
                                  width: isCollapsed ? size.width * 0.1 : size.width * 0.1,
                                  child: Text(
                                    chat.text,
                                    maxLines: 1,
                                    style: TextStyle(
                                      color: Colors.blueGrey,
                                      fontSize: 13.0,
                                      fontWeight: FontWeight.w600,
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
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            SizedBox(height: 5.0,),
                            chat.unread ?
                            Container(
                              width: 43.0,
                              height: 22.0,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor,
                                  borderRadius: BorderRadius.circular(30.0)
                              ),
                              child: Text(
                                'new',
                                style: TextStyle(
                                    color: ColorsUtil.hexColor(0xbacac6),
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ) :
                            SizedBox.shrink(),
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