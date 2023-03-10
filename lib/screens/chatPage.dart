import 'package:basic_messaging_app/models/chatUsersModel.dart';
import 'package:basic_messaging_app/widgets/conversationList.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<ChatUsers> chatUsers = [
    ChatUsers(name: "Jane Russel", messageText: "Awesome Setup", imageURL: "assets/images/userImage1.jpg", time: "Now", isMessageRead: false),
    ChatUsers(name: "Glady's Murphy", messageText: "That's Great", imageURL: "images/userImage2.jpg", time: "Yesterday", isMessageRead: false),
    ChatUsers(name: "Jorge Henry", messageText: "Where are you?", imageURL: "images/userImage3.jpg", time: "2 Days Ago", isMessageRead: true),
    ChatUsers(name: "Philip Fox", messageText: "I'm Busy", imageURL: "images/userImage4.jpg", time: "Last Week", isMessageRead: true),
    ChatUsers(name: "Debra Hawkins", messageText: "Thank you", imageURL: "images/userImage5.jpg", time: "2 Weeks Ago", isMessageRead: true),
    ChatUsers(name: "Jacob Pena", messageText: "Will update you", imageURL: "images/userImage6.jpg", time: "2 Weeks Ago", isMessageRead: true),
    ChatUsers(name: "Andrey Jones", messageText: "Hello", imageURL: "images/userImage7.jpg", time: "Last Month", isMessageRead: true),
    ChatUsers(name: "John Wick", messageText: "How are you?", imageURL: "images/userImage8.jpg", time: "Last Year", isMessageRead: true),
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const Text(
                      "Conversations",
                      style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 8, right: 8, top: 2, bottom: 2),
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.pink[50],
                      ),
                      child: Row(
                        children: const <Widget>[
                          Icon(Icons.add, color: Colors.pink, size: 20,),
                          SizedBox(width: 2,),
                          Text(
                            "Add New",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search...",
                  hintStyle: TextStyle(color: Colors.grey.shade600),
                  prefixIcon: Icon(Icons.search, color: Colors.grey.shade600, size: 20,),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  contentPadding: const EdgeInsets.all(8),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      color: Colors.grey.shade100
                    )
                  )
                ),
              ),
            ),
            ListView.builder(
              itemCount: chatUsers.length,
              shrinkWrap: true,
              padding: const EdgeInsets.only(top: 16),
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return ConversationList(
                    name: chatUsers[index].name,
                    messageText: chatUsers[index].messageText,
                    imageURL: chatUsers[index].imageURL,
                    time: chatUsers[index].time,
                    isMessageRead: chatUsers[index].isMessageRead,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}