import 'package:bloc/bloc.dart';
import 'package:chat_app/model/chat_message.dart';
import 'package:chat_app/model/repositories/chat_repository.dart';
import 'package:meta/meta.dart';

part 'message_event.dart';
part 'message_state.dart';

// class MessageBloc extends Bloc<MessageEvent, MessageState> {
//   MessageBloc() : super(MessageInitial()) {
//     on<MessageEvent>((event, emit) {
//       // TODO: implement event handler
//     });
//   }
// }

class MessageBloc extends Bloc<MessageEvent, MessageState> {
  MessageBloc({
    required ChatRepository chatRepository,
  })  : _chatRepository = chatRepository,
        super(const MessageInitial()) {
    on<FetchMessageEvent>(_getMessagesList);
  }

  final ChatRepository _chatRepository;

  Future<void> _getMessagesList(
    FetchMessageEvent event,
    Emitter<MessageState> emit,
  ) async {
    emit(const LoadingMessage());
    final result = await _chatRepository.fetchMessages();

    result.fold((failure) => emit(MessagesError(failure.message,failure.statusCode)),
        (chatDetails) => emit(MessagesLoaded(chatDetails)));
  }
}

