import 'package:inteligence_artificial_app/data/database.dart';
import 'package:sqflite/sqflite.dart';

class MensagensDao {
  static const String mensagensTable = 'CREATE TABLE mensagens('
      'id INTEGER PRIMARY KEY,'
      'nome TEXT)';

  static const String mensagensChatTable = 'CREATE TABLE mensagens_chat('
      'texto TEXT,'
      'receveid BOOLEAN,'
      'loading BOOLEAN NULL,'
      'mensagens_id INTEGER,'
      'FOREIGN KEY (mensagens_id) REFERENCES mensagens(id))';

  addMsg(Map<String, dynamic> mensagem) async {
    final Database db = await getDatabase();

    var idMsg = await db.insert('mensagens', {'nome': 'Nova mensagem'});

    await db.insert('mensagens_chat', {
      'texto': mensagem["text"],
      'receveid': mensagem["receveid"],
      'loading': mensagem["loading"],
      'mensagens_id': idMsg
    });
  }

  Future<List<Map>> procurar() async {
    final Database db = await getDatabase();

    final query = 'SELECT * FROM mensagens_chat '
        'JOIN mensagens ON mensagens_chat.mensagens_id = mensagens.id';

    final resultado = await db.rawQuery(query);

    return resultado;
  }
}
