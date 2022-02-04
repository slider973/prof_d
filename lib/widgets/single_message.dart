import 'package:flutter/material.dart';

class SingleMessage extends StatelessWidget {
  final String message;
  final bool isMe;

  const SingleMessage({required this.message, required this.isMe, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.all(16),
          constraints: const BoxConstraints(
            maxWidth: 200,
          ),
          decoration: BoxDecoration(
            color: isMe ? Colors.blueGrey : Colors.teal,
            borderRadius: const BorderRadius.all(
              Radius.circular(12),
            ),
          ),
          child: Text(
            message,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
