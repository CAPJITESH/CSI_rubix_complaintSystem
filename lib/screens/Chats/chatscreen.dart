import 'package:complaint_management/constants.dart';
import "package:complaint_management/screens/Chats/chatmodel.dart";
import "package:complaint_management/screens/Chats/chatservices.dart";
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:complaint_management/screens/RoleSelection/employeeAppoint.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:complaint_management/screens/Chats/message_bubble.dart';

class ChatScreen extends StatefulWidget {
  final String complaintId, status;

  ChatScreen({super.key, required this.complaintId, required this.status});

  static final auth = FirebaseAuth.instance;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final messageController = TextEditingController();

  ChatModel chat = ChatModel();

  List<String> statusList = ['Pending', "In Review", "Resolved"];

  TextEditingController _status = TextEditingController();
  String eid = "shshg";

  bool showTextfield = true;
  @override
  void initState() {
    if (widget.status == 'Resolved') {
      setState(() {
        showTextfield = false;
      });
    }
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final auth = FirebaseAuth.instance;

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 120),
        child: AppBar(
          title: const Text(
            "ChatScreen",
            style: TextStyle(
              fontSize: 17,
            ),
          ),
          actions: [
            // Container(
            //   margin: const EdgeInsets.fromLTRB(10, 10, 30, 0),
            //   child: DropdownMenu<String>(
            //     width: 140,

            //     initialSelection: widget.status,
            //     textStyle: const TextStyle(fontSize: 14),
            //     label: Text(
            //       "Update Status",
            //       style: TextStyle(color: color1),
            //     ),
            //     trailingIcon: Icon(
            //       CupertinoIcons.chevron_down,
            //       color: color3,
            //     ),
            //     selectedTrailingIcon: Icon(
            //       CupertinoIcons.chevron_up,
            //       color: color1,
            //     ),
            //     menuStyle: MenuStyle(
            //         backgroundColor: MaterialStatePropertyAll(Colors.white)),
            //     inputDecorationTheme: InputDecorationTheme(
            //       constraints: const BoxConstraints(maxHeight: 47),
            //       border: OutlineInputBorder(
            //         borderSide: BorderSide(color: color1),
            //         borderRadius: BorderRadius.circular(
            //           10,
            //         ),
            //       ),
            //       enabledBorder: OutlineInputBorder(
            //         borderSide: BorderSide(color: color1, width: 1.9),
            //         borderRadius: BorderRadius.circular(
            //           10,
            //         ),
            //       ),
            //       focusedBorder: OutlineInputBorder(
            //         borderSide: BorderSide(color: green, width: 1.9),
            //         borderRadius: BorderRadius.circular(
            //           10,
            //         ),
            //       ),
            //     ),
            //     onSelected: (String? value) async {
            //       _status.text = value!;

            //       CollectionReference complaintsCollection =
            //           FirebaseFirestore.instance.collection('complaints');

            //       QuerySnapshot querySnapshot = await complaintsCollection
            //           .where('complaintId', isEqualTo: widget.complaintId)
            //           .get();

            //       if (querySnapshot.docs.isNotEmpty) {
            //         DocumentReference complaintRef =
            //             await querySnapshot.docs.first.reference;

            //         await complaintRef.update({'status': value});

            //         EmployeeAppoint emp = EmployeeAppoint();
            //         await emp.updateInfo(eid, "Mechanic");
            //       }

            //       setState(() {});
            //     },
            //     controller: _status,
            //     // underline: SizedBox.shrink(),
            //     dropdownMenuEntries:
            //         statusList.map<DropdownMenuEntry<String>>((String value) {
            //       return DropdownMenuEntry<String>(
            //         value: value,
            //         label: value,
            //       );
            //     }).toList(),
            //   ),
            // ),
          ],
        ),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("Chats")
            .doc(widget.complaintId)
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
          //String customer = snapshot.data!.data()!["customer"];
          eid = snapshot.data!.data()!["eid"];

          return ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: snapshot.data!.data()!["chats"].length,
              itemBuilder: (context, index) {
                String customer = snapshot.data!.data()!["chats"][index]["by"];
                print(customer);
                print("Customeeeeeeeeeeeeee");
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
      floatingActionButton: showTextfield
          ? Container(
              height: size.height * 0.1,
              width: size.width * 0.9,
              color: Colors.white,
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
                      setState(() {
                        messageController.text = "";
                      });
                    },
                  ),
                  border: const OutlineInputBorder(),
                  enabledBorder: const OutlineInputBorder(),
                  focusedBorder: const OutlineInputBorder(),
                ),
              ),
            )
          : const SizedBox.shrink(),
    );
  }

  String chatRoomId() {
    return widget.complaintId;
  }
}
