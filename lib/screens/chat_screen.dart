import 'package:cached_network_image/cached_network_image.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../widgets/message_textfield.dart';
import '../widgets/single_message.dart';

class ChatScreen extends StatelessWidget {
  final User? currentUser;
  final String friendId;
  final String friendName;
  final String friendImage;

  const ChatScreen({
    Key? key,
    required this.currentUser,
    required this.friendId,
    required this.friendName,
    required this.friendImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Row(
          children: [
            SizedBox(
              width: 40.0,
              height: 40.0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(80),
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: friendImage,
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(
                    Icons.error,
                  ),
                  height: 40,
                ),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              friendName,
              style: const TextStyle(
                fontSize: 20,
              ),
            )
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection("users")
                    .doc(currentUser!.uid)
                    .collection('messages')
                    .doc(friendId)
                    .collection('chats')
                    .orderBy(
                      "date",
                      descending: true,
                    )
                    .snapshots(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data.docs.length < 1) {
                      return const Center(
                        child: Text(
                          "Envoyer le premier message",
                        ),
                      );
                    }
                    return ListView.builder(
                      itemCount: snapshot.data.docs.length,
                      reverse: true,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        bool isMe = snapshot.data.docs[index]['senderId'] ==
                            currentUser!.uid;
                        return SingleMessage(
                          message: snapshot.data.docs[index]['message'],
                          isMe: isMe,
                        );
                      },
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
          ),
          MessageTextField(
            currentUser!.uid,
            friendId,
          ),
        ],
      ),
    );
  }
}
