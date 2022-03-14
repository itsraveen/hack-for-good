import 'package:flutter/material.dart';

import '../models/chat_message.dart';

class ChatDetailPage extends StatefulWidget {
  @override
  _ChatDetailPageState createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage> {
  final _controller = TextEditingController();
  var _enteredMessage = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // title: Text("Chat Detail"),
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          flexibleSpace: SafeArea(
            child: Container(
              padding: EdgeInsets.only(right: 16),
              child: Row(
                children: <Widget>[
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    width: 2,
                  ),
                  const CircleAvatar(
                    // backgroundImage: NetworkImage("<rav.jpg>"),
                    backgroundImage: AssetImage("assets/images/rav.jpg"),
                    maxRadius: 20,
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          "Kriss Benwat",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Text(
                          "Online",
                          style: TextStyle(
                              color: Colors.grey.shade600, fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                  const Icon(
                    Icons.settings,
                    color: Colors.black54,
                  ),
                ],
              ),
            ),
          ),
        ),
        // body: Container());
        body: Stack(
          children: <Widget>[
            ListView.builder(
              itemCount: messages.length,
              shrinkWrap: true,
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.only(
                      left: 14, right: 14, top: 10, bottom: 10),
                  child: Align(
                    alignment: (messages[index].messageType == "receiver"
                        ? Alignment.topLeft
                        : Alignment.topRight),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: (messages[index].messageType == "receiver"
                            ? Colors.grey.shade200
                            : Colors.blue[200]),
                      ),
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        messages[index].messageContent,
                        style: const TextStyle(fontSize: 15),
                      ),
                    ),
                  ),
                );
              },
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                padding: EdgeInsets.only(left: 10, bottom: 10, top: 10),
                height: 60,
                width: double.infinity,
                color: Colors.white,
                child: Row(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          color: Colors.lightBlue,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: TextField(
                        controller: _controller,
                        decoration: const InputDecoration(
                            hintText: "Write message...",
                            hintStyle: TextStyle(color: Colors.black54),
                            border: InputBorder.none),
                        onChanged: (value) {
                          setState(() {
                            _enteredMessage = value;
                          });
                        },
                      ),
                    ),
                    IconButton(
                      color: Theme.of(context).primaryColor,
                      icon: const Icon(
                        Icons.send,
                      ),
                      onPressed: _enteredMessage.trim().isEmpty
                          ? null
                          : () {
                              setState(
                                () {
                                  messages.add(
                                    ChatMessage(
                                        messageContent: _enteredMessage,
                                        messageType: "sender"),
                                  );
                                },
                              );
                            },
                    ),
                    // const Expanded(
                    //   child: TextField(
                    //     // controller: _controller,
                    //   decoration: InputDecoration(
                    //       hintText: "Write message...",
                    //       hintStyle: TextStyle(color: Colors.black54),
                    //       border: InputBorder.none),
                    // ),
                    // ),
                    // const SizedBox(
                    //   width: 15,
                    // ),
                    // FloatingActionButton(
                    //   onPressed: () {
                    //     setState(() {
                    //       messages.add(
                    //         ChatMessage(
                    //             messageContent: "hello", messageType: "sender"),
                    //       );
                    //     });
                    //   },
                    //   child: const Icon(
                    //     Icons.send,
                    //     color: Colors.white,
                    //     size: 18,
                    //   ),
                    //   backgroundColor: Colors.blue,
                    //   elevation: 0,
                    // ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}

List<ChatMessage> messages = [
  ChatMessage(messageContent: "Hello, Will", messageType: "receiver"),
  ChatMessage(
      messageContent:
          "What kind of donations do you need? We're happy to help!",
      messageType: "receiver"),
  ChatMessage(
      messageContent:
          "Hey Kriss, we have encountered some issues with pumbling, do you know any contacts?",
      messageType: "sender"),
  ChatMessage(
      messageContent: "Yep, I can send you over the number",
      messageType: "receiver"),
  ChatMessage(
      messageContent: "That's great, that will go a long way for us :)!",
      messageType: "sender"),
];
