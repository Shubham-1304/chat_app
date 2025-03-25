import 'package:chat_app/model/chat_message.dart';
import 'package:flutter/material.dart';

class MessageList extends StatelessWidget {
  const MessageList({required this.messages, super.key});

  final List<ChatMessage> messages;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: messages.length,
      itemBuilder: (context, index) {
        final message = messages[index];
        return Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              border:
                  Border.all(color: Colors.black.withOpacity(0.3), width: 3),
              borderRadius: BorderRadius.circular(5)),
          child: ListTile(
            tileColor: Colors.white,
            title: Text(message.sender,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text(
              message.text,
              style: const TextStyle(fontWeight: FontWeight.w400,fontSize: 20),
              softWrap: true,
            ),
          ),
        );
      },
    );
  }
}
