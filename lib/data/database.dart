import 'package:inteligence_artificial_app/data/mensagens_dao.dart';
import "package:sqflite/sqflite.dart";
import "package:path/path.dart";

Future<Database> getDatabase() async{
 final String path = join(await getDatabasesPath(), "mensagem.db");
  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute(MensagensDao.mensagensTable);
      db.execute(MensagensDao.mensagensChatTable);
    },
    version: 1,
  );
}