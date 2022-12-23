import 'dart:ffi';

import 'package:flutter/cupertino.dart';

class ChatUsers {
  String name;
  String messageText;
  String imageURL;
  String time;
  bool isMessageRead = false;

  ChatUsers({
    required this.name,
    required this.messageText,
    required this.imageURL,
    required this.time,
    required this.isMessageRead
  });
}