import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  ChatMessage(this.data, this.isMine);

  final Map<String, dynamic> data;

  final bool isMine;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      child: Row(
        children: <Widget>[
          !isMine
              ? Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(data['senderPictureUrl']),
                  ),
                )
              : Container(),
          Expanded(
            child: Column(
              crossAxisAlignment:
                  isMine ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: <Widget>[
                data['imgUrl'] != null
                    ? Image.network(
                        data['imgUrl'],
                        width: 250.0,
                      )
                    : Text(
                        data['text'],
                        textAlign: isMine ? TextAlign.end : TextAlign.start,
                        style: TextStyle(fontSize: 16.0),
                      ),
                Text(
                  data['senderName'],
                  style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          isMine
              ? Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(data['senderPictureUrl']),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
