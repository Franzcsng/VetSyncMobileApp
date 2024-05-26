import "package:sqflite/sqflite.dart" as sql;


class SQLHelper{
  static Future<void> createTables(sql.Database database)  async {
    await database.execute("""CREATE TABLE pets(
      pet_id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
      pet_name TEXT,
      pet_birthdate DATE,
      date_created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
      date_updated DATE
    )""");
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'database.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);

      },
    );
  }

  static Future<int> createPet(String petName, String petBirthdate) async {

    final db = await SQLHelper.db();  

    final data =  {'pet_name': petName, 'pet_birthdate': petBirthdate};
    final id = await db.insert('pets', data, conflictAlgorithm: sql.ConflictAlgorithm.replace);

    return id;
  }

  static Future<List<Map<String, dynamic>>> getPets() async{
    final db = await SQLHelper.db();
    return db.query('pets', orderBy: "id");
  }

}

