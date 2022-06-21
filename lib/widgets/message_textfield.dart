import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../core/models/payload_model.dart';
import '../core/services/init_services/local_notification_service.dart';
import '../core/utils/routes.dart';

class MessageTextField extends StatefulWidget {
  final String currentId;
  final String friendId;

  const MessageTextField(this.currentId, this.friendId, {Key? key})
      : super(key: key);

  @override
  _MessageTextFieldState createState() => _MessageTextFieldState();
}

class _MessageTextFieldState extends State<MessageTextField> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsetsDirectional.only(
        top: 8.0,
        start: 8.0,
        end: 8.0,
        bottom: 8.0,
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: "Ecriver votre message",
                fillColor: Colors.grey[100],
                filled: true,
                border: OutlineInputBorder(
                  borderSide: const BorderSide(
                    width: 0,
                  ),
                  gapPadding: 10,
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          GestureDetector(
            onTap: () async {
              const _payloadModel = PayloadModel(
                route: RoutePaths.home,
                data: {'orderId': null},
              );
              String message = _controller.text;
              _controller.clear();
              await FirebaseFirestore.instance
                  .collection('users')
                  .doc(widget.currentId)
                  .collection('messages')
                  .doc(widget.friendId)
                  .collection('chats')
                  .add({
                "senderId": widget.currentId,
                "receiverId": widget.friendId,
                "message": message,
                "type": "text",
                "date": DateTime.now(),
              }).then((value) {
                FirebaseFirestore.instance
                    .collection('users')
                    .doc(widget.currentId)
                    .collection('messages')
                    .doc(widget.friendId)
                    .set({
                  'last_msg': message,
                });
              });

              await FirebaseFirestore.instance
                  .collection('users')
                  .doc(widget.friendId)
                  .collection('messages')
                  .doc(widget.currentId)
                  .collection("chats")
                  .add({
                "senderId": widget.currentId,
                "receiverId": widget.friendId,
                "message": message,
                "type": "text",
                "date": DateTime.now(),
              }).then((value) {
                FirebaseFirestore.instance
                    .collection('users')
                    .doc(widget.friendId)
                    .collection('messages')
                    .doc(widget.currentId)
                    .set({"last_msg": message});

                LocalNotificationService.instance.showInstantNotification(
                  title: 'test',
                  body: message,
                  payload: _payloadModel.toJsonString(),
                );
              });
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.teal,
              ),
              child: const Icon(
                Icons.send,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
