import 'dart:convert';
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
    http.Response response = await client.post(
      Uri.parse("$url$resposta"),
      headers: {'Content-Type': 'application/json'},
      body: chatGptJson,
    );

    if (response.statusCode != 200) {
      // Onde trata os erros
      verificaExcecao(json.decode(response.body));
    }

    return response.body;
  }

  void verificaExcecao(String error){
   throw Exception();
  }
}
