import 'dart:convert';

import 'package:chat_app/core/urls.dart';
import 'package:chat_app/model/api_models/chat_details_api_model.dart';
import 'package:chat_app/model/api_models/chat_message_api_model.dart';
import 'package:http/http.dart' as http;

class ChatApiService {
  const ChatApiService(this._client);
  final http.Client _client;

  Future<ChatDetailsApiModel> fetchChatDetails() async {
    final response = await _client.get(
        Uri.https(
          Urls.baseURL,
          Urls.getChatDetails,
        ),
      );
    // await Future.delayed(const Duration(milliseconds: 500));
    if (response.statusCode != 200){
      throw Exception("Something Went Wrong");
    }
    final details=json.decode(response.body);
    print("details $details");
    return ChatDetailsApiModel.fromMap(details);
  }

  Future<List<ChatMessageApiModel>> fetchMessages() async {
    final response = await _client.get(
        Uri.https(
          Urls.baseURL,
          Urls.getChatMessages,
        ),
      );
    if (response.statusCode != 200){
      throw Exception("Messages are unavailable");
    }
    final messages=(json.decode(response.body) as List);
    print("details $messages");
    return messages.map((message) => ChatMessageApiModel.fromMap(message))
          .toList();
  }
}
