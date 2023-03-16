class ChatGpt {
  String mensagem;

  ChatGpt({required this.mensagem});

  ChatGpt.fromMap(Map<String, dynamic> map) : mensagem = map["mensagem"];

  ChatGpt.empty() : mensagem = "";

  Map<String, dynamic> toMap() {
    return {"mensagem": mensagem};
  }
}
