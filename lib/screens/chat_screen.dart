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
        color: isMe ? ColorsUtil.hexColor(0xc2ccd0) : ColorsUtil.hexColor(0xe9e7ef),
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
                color: Colors.black87,
                fontSize: 15.0,
                fontWeight: FontWeight.w300
              ),
            ),
            SizedBox(height: 8.0,),
            Text(
              message.text,
              style: TextStyle(
                color: Colors.black,
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
            CircleAvatar(
              radius: 25.0,
              backgroundImage: AssetImage(currentUser.imageUrl),
            ),
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
            CircleAvatar(
              radius: 25.0,
              backgroundImage: AssetImage(message.sender.imageUrl),
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
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      height: 60.0,
      color: ColorsUtil.hexColor(0xbacac6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          IconButton(
            color: Colors.black,
            iconSize: 23.0,
            icon: Icon(Icons.mic),
            onPressed: () {},
          ),
          Expanded(
            child: TextField(
              textCapitalization: TextCapitalization.sentences,
              onChanged: (value) {
                setState(() {
                });
              },
              decoration: InputDecoration.collapsed(
                hintText: '          send a message...',
              ),
            ),
          ),
          Row(
            children: <Widget>[
              IconButton(
                color: Colors.black,
                iconSize: 23.0,
                icon: Icon(Icons.face),
                onPressed: () {},
              ),
              IconButton(
                color: Colors.black,
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
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: CircleAvatar(
            backgroundColor: Theme.of(context).primaryColor,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 12.0,
              child: Text(
                '6',
                style: TextStyle(
                  color: Theme.of(context).primaryColor
                ),
              ),
            ),
          )
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
                  color: ColorsUtil.hexColor(0xf2fdff),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(35.0),
                    topLeft: Radius.circular(35.0),
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