import 'package:flutter/material.dart';

import '../category_data.dart';
import '../models/chat_message.dart';

class FamilyChatDetailPage extends StatefulWidget {
  FamilyChatDetailPage({Key? key}) : super(key: key);
  static const routeName = '/chat-screen';

  @override
  _FamilyChatDetailPageState createState() => _FamilyChatDetailPageState();
}

class _FamilyChatDetailPageState extends State<FamilyChatDetailPage> {
  final _controller = TextEditingController();
  var _enteredMessage = "";

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final String? familyTitle = routeArgs['title'];
    final selectedFamily =
        FAMILY_CATEGORIES.firstWhere((family) => family.name == familyTitle);

    return Scaffold(
        appBar: AppBar(
          // title: Text(projectTitle),
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
                          // selectedProject.messages.length.toString(),
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
              itemCount: selectedFamily.messages.length,
              shrinkWrap: true,
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.only(
                      left: 14, right: 14, top: 10, bottom: 10),
                  child: Align(
                    alignment: (selectedFamily.messages[index].messageType ==
                            "receiver"
                        ? Alignment.topLeft
                        : Alignment.topRight),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: (selectedFamily.messages[index].messageType ==
                                "receiver"
                            ? Colors.grey.shade200
                            : Colors.blue[200]),
                      ),
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        selectedFamily.messages[index].messageContent,
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
                                  selectedFamily.messages.add(
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
