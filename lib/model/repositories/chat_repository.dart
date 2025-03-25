import 'package:chat_app/core/failure.dart';
import 'package:chat_app/model/api_models/chat_details_api_model.dart';
import 'package:chat_app/model/api_models/chat_message_api_model.dart';
import 'package:chat_app/model/chat_details.dart';
import 'package:chat_app/model/chat_message.dart';
import 'package:chat_app/model/services/chat_api_service.dart';
import 'package:dartz/dartz.dart';

class ChatRepository {
  const ChatRepository(this.apiService);

  final ChatApiService apiService;

  Future<Either<Failure, ChatDetails>> fetchChatDetails() async {
    try {
      ChatDetailsApiModel response = await apiService.fetchChatDetails();
      return Right(response.toEntityType());
    } catch (e) {
      return Left(Failure(message: e.toString(), statusCode: 500));
    }
  }

  Future<Either<Failure, List<ChatMessage>>> fetchMessages() async {
    try {
      List<ChatMessageApiModel> response = await apiService.fetchMessages();
      return Right(
          (response).map((message) => message.toEntityType()).toList());
    } catch (e) {
      return Left(Failure(message: e.toString(), statusCode: 500));
    }
  }
}
