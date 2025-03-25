import 'package:chat_app/core/injection_container.dart';
import 'package:chat_app/view/screens/chat_screen.dart';
import 'package:chat_app/view_model/bloc/chat_details_bloc.dart';
import 'package:chat_app/view_model/bloc/message_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      useInheritedMediaQuery: true,
      builder: (_, Widget? child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => sl<ChatDetailsBloc>(),
            ),
            BlocProvider(
              create: (context) => sl<MessageBloc>(),
            ),
          ],
          child: MaterialApp(
            title: 'Chat App',
            theme: ThemeData(
              useMaterial3: true,
              brightness: Brightness.light,
              visualDensity: VisualDensity.adaptivePlatformDensity,
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
            ),
            debugShowCheckedModeBanner: false,
            home: const ChatScreen(),
          ),
        );
      },
    );
  }
}
