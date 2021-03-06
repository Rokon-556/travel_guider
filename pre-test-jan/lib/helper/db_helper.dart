
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:travel_guider/models/geolocation_model.dart';
import 'package:travel_guider/models/selected_place_model.dart';
import 'package:travel_guider/models/user_model.dart';
import 'package:travel_guider/models/visit_plan_model.dart';


class DBHelper {
  static final String CREATE_TABLE_USER = ''' create table $TABLE_USER(
  $COL_USER_ID integer primary key autoincrement,
  $COL_USER_NAME text not null,
  $COL_USER_PHONE text not null,
  $COL_USER_EMAIL text not null,
  $COL_USER_PASSWORD text not null,
  $COL_USER_ROLE text not null
  )''';

  static final String CREATE_TABLE_VISIT_PLAN = ''' create table $TABLE_PLACE(
  $COL_PLACE_ID integer primary key autoincrement,
  $COL_START_PLACE_NAME text not null,
  $COL_START_PLACE_LATITUDE real not null,
  $COL_START_PLACE_LONGITUDE real not null,
  $COL_DEST_PLACE_LATITUDE real not null,
  $COL_DEST_PLACE_LONGITUDE real not null,
  $COL_END_PLACE_NAME text not null
  )''';

  static final String CREATE_TABLE_GEOLOCATION='''create table $TABLE_GEOLOCATION(
  $COL_POSITION_ID integer primary key autoincrement,
  $COL_IMAGE_ID blob,
  $COL_VIDEO_ID blob,
  $COL_POSITION_LAT real not null,
  $COL_POSITION_LONG real not null,
  $COL_SELECTED_PLC_ID integer not null,
  FOREIGN KEY ($COL_SELECTED_PLC_ID) REFERENCES $TABLE_SELECTED_PLACE($COL_SELECTED_ID)
  
  ) ''';


  static final String CREATE_TABLE_SELECTED_PLAN='''create table $TABLE_SELECTED_PLACE(
  $COL_SELECTED_ID integer primary key autoincrement,
  $COL_VISITOR_SELECTED_ID integer not null,
  $COL_VISITOR_PLAN_ID integer not null,
  FOREIGN KEY ($COL_VISITOR_SELECTED_ID) REFERENCES $TABLE_USER($COL_USER_ID),
  FOREIGN KEY ($COL_VISITOR_PLAN_ID) REFERENCES $TABLE_PLACE($COL_PLACE_ID)
  
  ) ''';

  static void _onCreate(Database db, int version) {
    db.execute(CREATE_TABLE_USER);
    db.execute(CREATE_TABLE_VISIT_PLAN);
    db.execute(CREATE_TABLE_GEOLOCATION);
    db.execute(CREATE_TABLE_SELECTED_PLAN);
  }

  static Future<Database> createDBUser() async {
    final dbpath = await getDatabasesPath();
    final path = join(dbpath, 'user.db');
    Database db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  static Future<Database> createImage() async {
     final dbpath = await getDatabasesPath();
     final path = join(dbpath, 'img.db');
     Database db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
   }


  static Future<int> insertUser(String tableName,UserModel user) async {
    print('its ok');
    final db = await createDBUser();
    print('its ok2');
    return db.insert(tableName, user.toMap());

  }

  static Future<UserModel?> getUserInfo(String email, String password) async {
    print('final');
    final db = await createDBUser();
    print('final2');
    var users = await db.rawQuery("SELECT * FROM $TABLE_USER WHERE "
        "$COL_USER_EMAIL = '$email' AND "
        "$COL_USER_PASSWORD = '$password'");
    print('final3');
    if (users.length > 0) {
      return UserModel.fromMap(users.first);
    }
    return null;
  }

  static Future<Database> createDBPlace() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'place.db');
    Database db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  static Future<int> insertPlace(
      String tableName, Map<String, dynamic> data) async {
    final db = await createDBPlace();
    return db.insert(tableName, data,
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<List<VisitPlanModel>> getPlace() async {
    final db = await createDBPlace();
    final List<Map<String, dynamic>> placeMap =
        await db.query(TABLE_PLACE, orderBy: COL_START_PLACE_NAME);
    return List.generate(
        placeMap.length, (index) => VisitPlanModel.fromMap(placeMap[index]),);
  }

  static Future<void> deletePlace(int id) async {
    final db = await createDBPlace();
    await db.delete(TABLE_PLACE, where: '$COL_PLACE_ID = ?', whereArgs: [id]);
  }



  static Future<VisitPlanModel?> getPlacesByID(int id) async {
    final db = await createDBPlace();
    final List<Map<String, dynamic>> places = await db
        .query(TABLE_PLACE, where: '$COL_PLACE_ID = ?',whereArgs: [id]);
    if (places.length > 0) {
       return VisitPlanModel.fromMap(places.first);
    }
    return null;
  }

  static Future<int> updatePlace(VisitPlanModel visitModel) async {
    final db = await createDBPlace();
    return await db.update(TABLE_PLACE, visitModel.toMap(),
        where: '$COL_PLACE_ID = ?', whereArgs: [visitModel.id]);
  }
}
