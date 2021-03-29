import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:teste/components/ResultadoJogo.dart';

class PlacarRepository {
  static final PlacarRepository _singleton = new PlacarRepository();

  factory PlacarRepository() {
    return _singleton;
  }

  static _dataBaseManager() async {
    final int versiondb = 1;

    final pathDatabase = await getDatabasesPath();
    final localDatabase = join(pathDatabase, "jogos.db");
    var bd = await openDatabase(localDatabase, version: 1,
        onCreate: (db, versiondb) {
      String sql =
          "create table jogos(id integer primary key, adversario1 varchar, adversario2 varchar, resultado1 varchar, resultado2 varchar)";
      db.execute(sql);
    });
    return bd;
  }

  static save(ResultadoJogo resultado) async {
    Database db = await _dataBaseManager();

    Map<String, dynamic> dadosResultado = {
      "adversario1": resultado.adversario1,
      "adversario2": resultado.adversario2,
      "resultado1": resultado.resultado1,
      "resultado2": resultado.resultado2
    };

    int id = await db.insert("jogos", dadosResultado);
    print("salvou $id");
  }

  static Future list() async {
    Database bd = await _dataBaseManager();
    List listaResultados = await bd.rawQuery("select * from jogos");

    var _jogos = new List();
    for (var item in listaResultados) {
      _jogos.add(new ResultadoJogo(item['adversario1'], item['adversario2'],
          item['resultado1'], item['resultado2'], item['id']));
    }

    return _jogos;
  }

  static update(ResultadoJogo resultado) async {
    Database bd = await _dataBaseManager();

    Map<String, dynamic> dadosResultado = {
      "adversario1": resultado.adversario1,
      "adversario2": resultado.adversario2,
      "resultado1": resultado.resultado1,
      "resultado2": resultado.resultado2
    };

    bd.update("jogos", dadosResultado,
        where: "id = ?", whereArgs: [resultado.id]);
  }

  static delete(int resultadoId) async {
    Database db = await _dataBaseManager();
    return await db.delete('jogos', where: 'id = ?', whereArgs: [resultadoId]);
  }
}
