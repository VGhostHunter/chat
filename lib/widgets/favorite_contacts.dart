import 'package:chat/models/message_model.dart';
import 'package:chat/screens/chat_screen.dart';
import 'package:flutter/material.dart';

class FavoriteContacts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.0),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Favorite contacts',
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 18.0,
                    letterSpacing: 0.7,
                    fontWeight: FontWeight.bold
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.more_horiz),
                  color: Colors.black54,
                  iconSize: 30.0,
                ),
              ],
            ),
          ),
          Container(
            height: 90,
            child: ListView.builder(
              padding: EdgeInsets.only(left: 10.0),
              scrollDirection: Axis.horizontal,
              itemCount: favorites.length,
              itemBuilder: (BuildContext context, index) {
                return GestureDetector(
                  onTap: () => Navigator.push(context, MaterialPageRoute(
                    builder: (_) => ChatScreen(user: favorites[index],),
                  )),
                  child: Padding(
                    padding: EdgeInsets.only(left: 5.0, right: 10.0),
                    child: Column(
                      children: <Widget>[
                        CircleAvatar(
                          radius: 28.0,
                          backgroundImage: AssetImage(favorites[index].imageUrl),
                        ),
                        SizedBox(height: 6.0,),
                        Text(
                          favorites[index].name,
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 15.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}