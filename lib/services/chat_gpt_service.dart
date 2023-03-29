import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http_interceptor/http/intercepted_client.dart';
import 'package:inteligence_artificial_app/models/chat_gpt.dart';
import 'logging_interceptors_service.dart';

class ChatGptService {
  static const String url = "https://vangeanceapp.azurewebsites.net/";
  static const String resposta = "gpt/resposta";

  http.Client client = InterceptedClient.build(
    interceptors: [LoggingInterceptor()],
  );

  Future<String> buscarResposta(ChatGpt chatGptRequest) async {
    var chatGptMap = chatGptRequest.toMap();
    var chatGptJson = json.encode(chatGptMap);
    // TENTANDO FAZER A CONEXÃO COM A API
    try {
      http.Response response = await client.post(
        Uri.parse("$url$resposta"),
        headers: {'Content-Type': 'application/json'},
        body: chatGptJson,
      );

      if (response.statusCode != 200) {
        // ONDE SE TRATA OS ERROS DE REQUEST
        verificaExcecao(json.decode(response.body));
      }

      return response.body;
    } on SocketException catch (e) {
      return "erro ao se comunicar com o servidor";
    }
  }

  void verificaExcecao(String error) {
    throw Exception();
  }
}
