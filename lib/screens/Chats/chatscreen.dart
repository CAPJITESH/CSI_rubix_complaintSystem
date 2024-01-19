import "package:complaint_management/screens/Chats/chatmodel.dart";
import "package:complaint_management/screens/Chats/chatservices.dart";
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:complaint_management/screens/Chats/message_bubble.dart';

class ChatScreen extends StatelessWidget {
  final String complaintId;
  final messageController = TextEditingController();

  ChatScreen({super.key, required this.complaintId});

  ChatModel chat = ChatModel();

  static final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final auth = FirebaseAuth.instance;

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text("ChatScreen"),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("Chats")
            .doc(complaintId)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (!snapshot.hasData || snapshot.data == null) {
            return const Center(
              child: Text("No Chats Available"),
            );
          }
          

          
          try {
            final testVar = snapshot.data!.data()!["chats"];
          } catch (e) {
            print(e);

            return const Center(
              child: Text("No Chats Available"),
            );
          }
          
          //the below line is causing error
          String customer = snapshot.data!.data()!["customer"];

          return ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: snapshot.data!.data()!["chats"].length,
              itemBuilder: (context, index) {
                if (snapshot.data!.data()!["chats"][index].containsKey("img")) {
                  String imgUrl = snapshot.data!.data()!["chats"][index]["img"];

                  return Align(
                    alignment: auth.currentUser!.uid == customer
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: UnconstrainedBox(
                      child: Container(
                        margin: const EdgeInsets.all(5).copyWith(top: 0),
                        height: size.height * 0.25,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image.network(imgUrl),
                        ),
                      ),
                    ),
                  );
                } else {
                  chat = ChatModel.fromJson(
                      snapshot.data!.data()!["chats"][index]);

                  return Align(
                      alignment: auth.currentUser!.uid == customer
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: UnconstrainedBox(
                        child: MessageBubble(
                          text: chat.message.toString(),
                          color: auth.currentUser!.uid == customer
                              ? Colors.blueAccent
                              : Colors.grey.shade200,
                          textColor: auth.currentUser!.uid == customer
                              ? Colors.white
                              : Colors.black,
                        ),
                      ));
                  /*ListTile(
                    title: Text(chat.by.toString()),
                    subtitle: Text(chat.message.toString()),
                    trailing: Text(
                      chat.dateTime!.toString().substring(0, 10),
                    ),
                  );*/
                }
              });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SizedBox(
        height: size.height * 0.1,
        width: size.width * 0.9,
        child: TextField(
          controller: messageController,
          maxLines: null,
          decoration: InputDecoration(
            hintText: "Enter Message",
            prefixIcon: IconButton(
              onPressed: () {
                ChatService.pickFiles(chatRoomId());
              },
              icon: const Icon(Icons.attach_file),
            ),
            suffixIcon: IconButton(
              icon: const Icon(Icons.send),
              onPressed: () {
                if (messageController.text.isNotEmpty) {
                  ChatModel chat = ChatModel(
                      message: messageController.text,
                      dateTime: DateTime.now().toString(),
                      by: auth.currentUser?.uid,
                      to: "complaintId");
                  ChatService.sendMessage(chatRoomId(), chat);
                }
              },
            ),
            border: const OutlineInputBorder(),
            enabledBorder: const OutlineInputBorder(),
            focusedBorder: const OutlineInputBorder(),
          ),
        ),
      ),
    );
  }

  String chatRoomId() {
    return "complaintId";
  }
}
