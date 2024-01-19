import 'dart:io';

import "package:complaint_management/screens/Chats/chatmodel.dart";

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ChatService {
  static final auth = FirebaseAuth.instance;
  static sendMessage(String chatRoomId, ChatModel chat) async {
    final data = await FirebaseFirestore.instance
        .collection("Chats")
        .doc(chatRoomId)
        .get();
    List chats = data.exists ? data["chats"] : [];
    chats.add(chat.toJson());

    await FirebaseFirestore.instance.collection("Chats").doc(chatRoomId).update({
      "chats": chats,
    });
  }

  static pickFiles(String chatRoomId) async {
    final data = await FirebaseFirestore.instance
        .collection("Chats")
        .doc(chatRoomId)
        .get();
    List chats = data.exists ? data["chats"] : [];

    final pickedFiles = await FilePicker.platform.pickFiles();
    if (pickedFiles!.files.isNotEmpty) {
      final filePath = pickedFiles!.files[0].path;

      final ref = FirebaseStorage.instance.ref("Attachments");
      final uploadTask = await ref
          .child(chatRoomId)
          .child("uid${chats.length}")
          .putFile(File(filePath!));
      final imgUrl = await uploadTask.ref.getDownloadURL();
      print("Image Url = ${imgUrl.toString()}");

      chats.add({
        "img": imgUrl.toString(),
      });

      await FirebaseFirestore.instance.collection("Chats").doc(chatRoomId).set({
        "customer": auth.currentUser!.uid,
        "chats": chats,
      });
    }
  }
}
