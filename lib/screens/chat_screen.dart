import 'package:chat/constants.dart';
import 'package:chat/models/message_model.dart';
import 'package:chat/models/user_model.dart';
import 'package:chat/utils/colors_util.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {

  final User user;
  
  ChatScreen({this.user});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  _buildMessage(Message message, isMe) {

    final Widget msg = Container(
      width: MediaQuery.of(context).size.width * 0.68,
      decoration: BoxDecoration(
        color: isMe ? Colors.green : backGroundColor,
        borderRadius: BorderRadius.circular(15.0)
      ),
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              message.time,
              style: TextStyle(
                color: isMe ? Colors.black: Colors.white70,
                fontSize: 12.0,
                fontWeight: FontWeight.w500
              ),
            ),
            SizedBox(height: 8.0,),
            Text(
              message.text,
              style: TextStyle(
                color: isMe ? Colors.black : Colors.white70,
                fontSize: 16.0,
                fontWeight: FontWeight.w400
              ),
            ),
          ],
        ),
      ),
    );
    
    if(isMe) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            msg,
            SizedBox(width: 10.0,),
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                image: DecorationImage(
                  image: AssetImage(currentUser.imageUrl)
                ),
              ),
            )
          ],
        ),
      );
    } else {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                image: DecorationImage(
                    image: AssetImage(message.sender.imageUrl)
                ),
              ),
            ),
            SizedBox(width: 10.0,),
            msg,
          ],
        ),
      );
    }
  }

  _buildMessageComposer() {
    return Container(
      padding: EdgeInsets.fromLTRB(0.0, 0.0, 5.0, 25.0),
      height: 80.0,
      color: backGroundColor2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          IconButton(
            color: Colors.white,
            iconSize: 23.0,
            icon: Icon(Icons.mic),
            onPressed: () {},
          ),
          Expanded(
            child: Container(
              height: 33,

              decoration: BoxDecoration(
                color: backGroundColor,
                borderRadius: BorderRadius.circular(5.0)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: TextField(
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17.0
                      ),
                      textCapitalization: TextCapitalization.sentences,
                      onChanged: (value) {
                        setState(() {
                        });
                      },
                      decoration: InputDecoration.collapsed(
//                      hintText: '   send a message...',
                      ),
                    ),
                  ),
                ],
              )
            ),
          ),
          Row(
            children: <Widget>[
              IconButton(
                color: Colors.white,
                iconSize: 23.0,
                icon: Icon(Icons.face),
                onPressed: () {},
              ),
              IconButton(
                color: Colors.white,
                iconSize: 25.0,
                icon: Icon(Icons.add),
                onPressed: () {},
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor2,
      appBar: AppBar(
        backgroundColor: backGroundColor2,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(
            Icons.arrow_back_ios,
            color: ColorsUtil.hexColor(0xbacac6),
            size: 22.0,
          ),
        ),
        title: Text(
          widget.user.name,
          style: TextStyle(
            fontSize: 19.0,
            fontWeight: FontWeight.bold
          ),
        ),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_horiz),
            iconSize: 23.0,
            color: Colors.white,
            onPressed: () {},
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: backGroundColor,
                  borderRadius: BorderRadius.only(
//                    topRight: Radius.circular(35.0),
//                    topLeft: Radius.circular(35.0),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35.0),
                    topRight: Radius.circular(35.0),
                  ),
                  child: ListView.builder(
                    reverse: true,
                    padding: EdgeInsets.only(top: 15.0),
                    itemCount: messages.length,
                    itemBuilder: (BuildContext context, index) {
                      final Message message =messages[index];
                      final bool isMe = message.sender.id == currentUser.id;
                      return _buildMessage(message, isMe);
                    }
                  ),
                ),
              ),
            ),
            _buildMessageComposer(),
          ],
        ),
      ),
    );
  }
}