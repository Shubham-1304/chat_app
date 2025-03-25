part of 'chat_details_bloc.dart';

class ChatDetailsState {
  const ChatDetailsState();
}

final class ChatDetailsInitial extends ChatDetailsState {
  const ChatDetailsInitial();
}

class LoadingChatDetails extends ChatDetailsState{
  const LoadingChatDetails();
}

class ChatDetailsLoaded extends ChatDetailsState{
  const ChatDetailsLoaded(this.chatDetails);
  final ChatDetails chatDetails;
}

class ChatDetailsError extends ChatDetailsState{
  const ChatDetailsError(this.error, this.errorCode);
  final String error;
  final int errorCode;
}