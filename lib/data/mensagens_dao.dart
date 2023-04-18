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

  Future<Map<String, dynamic>> criarMensagens() async {
    final Database db = await getDatabase();

    var idMsg = await db.insert('mensagens', {'nome': 'Nova mensagem'});

    print(idMsg);
    var resultado = await db.query('mensagens',
        where: 'id = ?', whereArgs: [idMsg], limit: 1);

    print(resultado.first);
    print(resultado.first["id"]);

    if (resultado.isNotEmpty) {
      return resultado.first;
    } else {
      throw Exception;
    }
  }

  addMsg(Map<String, dynamic> mensagem, int id) async {
    final Database db = await getDatabase();

    await db.insert('mensagens_chat', {
      'texto': mensagem["text"],
      'receveid': mensagem["receveid"],
      'loading': mensagem["loading"],
      'mensagens_id': id
    });
  }

  procurarMensagemTitle() async {
    final Database db = await getDatabase();

    final query = 'SELECT nome FROM mensagens';

    final nomes = await db.rawQuery(query);

    return nomes;
  }

  Future<List<Map>> procurarMensagem() async {
    final Database db = await getDatabase();

    final query = 'SELECT mensagens_chat.texto, mensagens_chat.receveid, mensagens_chat.loading FROM mensagens_chat '
        'JOIN mensagens ON mensagens_chat.mensagens_id = mensagens.id';

    final resultado = await db.rawQuery(query);

    return resultado;
  }
}
