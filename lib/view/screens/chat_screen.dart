import 'package:chat_app/view/widgets/chat_header.dart';
import 'package:chat_app/view/widgets/message_list.dart';
import 'package:chat_app/view/widgets/retry_message.dart';
import 'package:chat_app/view_model/bloc/chat_details_bloc.dart';
import 'package:chat_app/view_model/bloc/message_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late ChatDetailsBloc _chatDetailsBloc;
  late MessageBloc _messageBloc;

  @override
  void initState() {
    super.initState();
    _chatDetailsBloc = context.read<ChatDetailsBloc>();
    _messageBloc = context.read<MessageBloc>();

    _chatDetailsBloc.add(FetchChatDetailsEvent());
    _messageBloc.add(FetchMessageEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow.shade100,
      body: Column(
        children: [
          BlocBuilder<ChatDetailsBloc, ChatDetailsState>(
            builder: (context, state) {
              if (state is ChatDetailsLoaded) {
                return ChatHeader(
                  name: state.chatDetails.name,
                  description: state.chatDetails.description,
                  failure: false,
                  loading: false,
                );
              } else if (state is ChatDetailsError) {
                return ChatHeader(
                  name: "Error",
                  description: state.error,
                  failure: true,
                  loading: false,
                );
              }
              return const ChatHeader(
                name: "",
                description: "",
                failure: false,
                loading: true,
              );
            },
          ),
          Expanded(
            child: BlocBuilder<MessageBloc, MessageState>(
              builder: (context, state) {
                if (state is MessagesLoaded) {
                  return MessageList(messages: state.chatmessages);
                } else if (state is MessagesError) {
                  return RetryMessage(
                    message: state.error,
                    retryFunction: () => _messageBloc.add(FetchMessageEvent()),
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
