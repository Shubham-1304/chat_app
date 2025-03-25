import 'package:chat_app/model/repositories/chat_repository.dart';
import 'package:chat_app/model/services/chat_api_service.dart';
import 'package:chat_app/view_model/bloc/chat_details_bloc.dart';
import 'package:chat_app/view_model/bloc/message_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;


final sl = GetIt.instance;

Future<void> init() async {

  // Bloc
  sl.registerFactory(() => ChatDetailsBloc(
        chatRepository: sl(),
      ));
  sl.registerFactory(() => MessageBloc(
        chatRepository: sl(),
      ));


  // Repositories
  sl.registerLazySingleton<ChatRepository>(
      () => ChatRepository(sl()));


  // Api Service
  sl.registerLazySingleton<ChatApiService>(
      () => ChatApiService(sl()));

  // http
  sl.registerLazySingleton(http.Client.new);
}

void disposeDependency() {

  //Bloc dispose
  sl<ChatDetailsBloc>().close();
  sl<MessageBloc>().close();
}
