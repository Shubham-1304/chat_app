import 'package:chat_app/model/chat_details.dart';

class ChatDetailsApiModel extends ChatDetails {
  const ChatDetailsApiModel({
    required super.name,
    required super.description,
  });

  factory ChatDetailsApiModel.fromMap(Map<String, dynamic> map) {
    return ChatDetailsApiModel(
      name: map['name'] as String,
      description: map['description'] as String,
    );
  }

  ChatDetails toEntityType() {
    return ChatDetails(
      name: name,
      description: description,
    );
  }
}
