part of 'message_bloc.dart';

@immutable
sealed class MessageState {
  const MessageState();
}

final class MessageInitial extends MessageState {
  const MessageInitial();
}

class LoadingMessage extends MessageState{
  const LoadingMessage();
}

class MessagesLoaded extends MessageState{
  const MessagesLoaded(this.chatmessages);

  final List<ChatMessage> chatmessages;
}

class MessagesError extends MessageState{
  const MessagesError(this.error, this.errorCode);
  final String error;
  final int errorCode;
}