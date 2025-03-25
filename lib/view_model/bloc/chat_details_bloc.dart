import 'package:bloc/bloc.dart';
import 'package:chat_app/model/chat_details.dart';
import 'package:chat_app/model/repositories/chat_repository.dart';

part 'chat_details_event.dart';
part 'chat_details_state.dart';

class ChatDetailsBloc extends Bloc<ChatDetailsEvent, ChatDetailsState> {
  ChatDetailsBloc({
    required ChatRepository chatRepository,
  })  : _chatRepository = chatRepository,
        super(const ChatDetailsInitial()) {
    on<FetchChatDetailsEvent>(_getChatDetails);
  }

  final ChatRepository _chatRepository;

  Future<void> _getChatDetails(
    FetchChatDetailsEvent event,
    Emitter<ChatDetailsState> emit,
  ) async {
    emit(const LoadingChatDetails());
    final result = await _chatRepository.fetchChatDetails();

    result.fold((failure) => emit(ChatDetailsError(failure.message,failure.statusCode)),
        (chatDetails) => emit(ChatDetailsLoaded(chatDetails)));
  }
}
