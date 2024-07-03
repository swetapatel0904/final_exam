import 'dart:io';

import 'package:final_exam/screen/home/model/home_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static DBHelper helper = DBHelper._();

  DBHelper._();

  Database? database;

  Future<Database>? checkDb() async {
    if (database != null) {
      return database!;
    } else {
      return await initDb();
    }
  }

  Future<Database> initDb() async {
    Directory dir = await getApplicationSupportDirectory();
    String path = join(dir.path, "user.db");
    return openDatabase(
      version: 1,
      path,
      onCreate: (db, version) {
        String userQuery =
            "CREATE TABLE user(id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT,email TEXT, password TEXT)";

        db.execute(userQuery);
      },
    );
  }

  void insertUser(String name, String password) async {
    var db = await checkDb();
    db!.insert("user", {"name": name, "password": password});
  }

  Future<List<HomeModel>> readUser() async {
    var db = (await checkDb())!;
    String query = "SELECT * FROM user";
    List<Map> l1 = await db.rawQuery(query);
    List<HomeModel> cList = l1.map((e) => HomeModel.mapToModel(e)).toList();
    return cList;
  }

  void deleteUser(int id) async {
    var db = (await checkDb())!;
    db.delete("user", where: "id=?", whereArgs: [id]);
  }

  void updateUser(String name, int id) async {
    var db = (await checkDb())!;
    db.update("user", {"name": "$name"}, where: "id=?", whereArgs: [id]);
  }
}
