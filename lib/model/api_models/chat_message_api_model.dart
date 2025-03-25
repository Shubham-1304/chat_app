import 'package:chat_app/model/chat_message.dart';

class ChatMessageApiModel extends ChatMessage {
  const ChatMessageApiModel({
    required super.sender,
    required super.text,
  });

  factory ChatMessageApiModel.fromMap(Map<String, dynamic> map) {
    return ChatMessageApiModel(
      sender: map['sender'] as String,
      text: map['text'] as String,
    );
  }

  ChatMessage toEntityType() {
    return ChatMessage(
      sender: sender,
      text: text,
    );
  }
}
