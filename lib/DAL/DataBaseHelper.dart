import 'dart:async';
import 'dart:io';

import 'package:menu_flutter/Models/CustomerInformation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
class DataBaseHelper{


  //***********************tables app *******************************************

  static final String CUSTOMER_INFORMATION = "CUSTOMER_INFORMATION";
  static final String CUSTOMER_NAME = "CUSTOMER_NAME";
  static final String PHONE_NO = "PHONE_NO";
  static final String EMAIL = "EMAIL";
  static final String POINT_CUSTOMER = "POINT_CUSTOMER";
  //******************************************************************
  static final String USERS_TABLE = "USERS";
  static final String USER_NAME = "USER_NAME";
  static final String PASSWORD = "PASSWORD";
  //******************************************************************
  static final String ITEMS_TABLE = "ITEMS";
  static final String CATEGORY_NAME = "CATEGORY_NAME";
  static final String ITEM_NAME = "ITEM_NAME";
  static final String PRICE = "PRICE";
  static final String ITEM_BARCODE = "ITEM_BARCODE";
  static final String DESCRIPTION = "DESCRIPTION";
  static final String ITEM_PICTURE = "ITEM_PICTURE";
  static final String POINT ="POINT";
  static final String QTY_ITEM ="QTY_ITEM";
  static final String TAX ="TAX";
//******************************************************************
  static final String CATEGORY_TABLE = "CATEGORY_TABLE";
  static final String CATEGORY_NAME1 = "CATEGORY_NAME";
  static final String CATEGORY_PIC1 = "CATEGORY_PIC";
  //******************************************************************
  static final String ORDER_PAY = "ORDER_PAY";
  static final String CUSTOMER_NAME1 = "CUSTOMER_NAME";
  static final String CustomerNo1 = "CustomerNo";
  static final String POINT_CUSTOMER1 = "POINT_CUSTOMER";
  static final String TOTAL1 = "TOTAL";
  static final String DATE_FOR_PAY = "DATE_FOR_PAY";
  static final String QTY = "QTY";
  static final String VOUCH_NO = "VOUCH_NO";
  static final String TOTAL_BEFORE_TAX = "TOTAL_BEFORE_TAX";
  static final String TOTAL_AFTER_TAX = "TOTAL_AFTER_TAX";
  static final String TAX_VALUE = "TAX_VALUE";
  static final String ITEM_NAME1 = "ITEM_NAME";
  static final String ITEM_BARCODE1 = "ITEM_BARCODE";
  static final String PRICE1 = "PRICE";
  //******************************************************************
  static final String NOTIFICATION = "NOTIFICATION";
  static final String DESCRIPTION2 = "DESCRIPTION";
  static final String DATE_FOR_NOTIFICATION2 = "DATE_FOR_NOTIFICATION";
  static final String NOTIFICATION_NAME2 = "NOTIFICATION_NAME";
  static final String TIME_FOR_NOTIFICATION = "TIME_FOR_NOTIFICATION";
  static final String POINT_FOR_NOTIFICATION = "POINT_FOR_NOTIFICATION";
  //******************************************************************
//  static Database _db;
  static Database _database;
  static DataBaseHelper _dataBaseHelper;//create singletone

  DataBaseHelper._createInstance();// named constructer to create instance of databasehelper
  factory DataBaseHelper(){
    if(_dataBaseHelper==null)
      {
        _dataBaseHelper=DataBaseHelper._createInstance();
      }
    return _dataBaseHelper;
  }



  static void _firstCreat(Database db, int version) async {
    var createCustomerTable="CREATE TABLE " + CUSTOMER_INFORMATION + "("
        + CUSTOMER_NAME + " TEXT,"
        + PHONE_NO + " TEXT,"
        + EMAIL + " TEXT,"
        +  POINT_CUSTOMER+ " REAL"

        + ")";
    await db.execute(createCustomerTable);
    print("CREATE CUSTOMER_INFORMATION");
    // *******************************************************************************

    String CREATE_TABLE_ITEMS = "CREATE TABLE " + ITEMS_TABLE + "("
        + CATEGORY_NAME + " TEXT,"
        + ITEM_NAME + " TEXT,"
        + ITEM_BARCODE + " TEXT,"
        + PRICE + " INTEGER,"
        + DESCRIPTION + " TEXT,"
        + ITEM_PICTURE + " BLOB,"
        + POINT + " REAL,"
        + QTY_ITEM + " REAL,"
        + TAX + " REAL" +
        ")";
    db.execute(CREATE_TABLE_ITEMS);
    print("CREATE ITEMS_TABLE");
    // *******************************************************************************

    String CREATE_TABLE_USERS = "CREATE TABLE " + USERS_TABLE + "("
        + USER_NAME + " TEXT,"
        + PASSWORD + " TEXT" + ")";

    db.execute(CREATE_TABLE_USERS);
    print("CREATE USERS_TABLE");
    // *******************************************************************************
    String CREATE_CATEGORY_TABLE = "CREATE TABLE " + CATEGORY_TABLE + "("
        + CATEGORY_NAME1 + " TEXT,"
        + CATEGORY_PIC1 + " TEXT"
        + ")";
    db.execute(CREATE_CATEGORY_TABLE);
    // *******************************************************************************
    String CREATE_NOTIFICATION_TABLE = "CREATE TABLE " + NOTIFICATION + "("
        + DESCRIPTION2 + " TEXT,"
        + DATE_FOR_NOTIFICATION2 + " TEXT,"
        + NOTIFICATION_NAME2 + " TEXT,"
        + POINT_FOR_NOTIFICATION + " TEXT,"
        +  TIME_FOR_NOTIFICATION+ " TEXT"

        + ")";
    db.execute(CREATE_NOTIFICATION_TABLE);
    // *******************************************************************************

    String CREATE_ORDER_TABLE = "CREATE TABLE " + ORDER_PAY + "("
        + CUSTOMER_NAME1 + " TEXT,"
        + CustomerNo1 + " TEXT,"
        + POINT_CUSTOMER1 + " REAL,"
        + TOTAL1 + " REAL,"
        +  DATE_FOR_PAY+ " TEXT,"
        +  QTY+ " REAL,"
        +  VOUCH_NO+ " TEXT ,"
        +  TOTAL_BEFORE_TAX+ " REAL,"
        +  TOTAL_AFTER_TAX+ " REAL,"
        +  TAX_VALUE+ " REAL ,"
        +  ITEM_NAME1+ " TEXT ,"
        +  ITEM_BARCODE1+ " TEXT ,"
        +  PRICE1+ " REAL"
        + ")";
    db.execute(CREATE_ORDER_TABLE);
    // *******************************************************************************

  }


  static Future<Database> initialDb() async {
    Directory documentsDir = await getApplicationDocumentsDirectory();
    String path = join(documentsDir.path, 'app.db');
    var userDb=await openDatabase(path, version: 4 , onCreate: _firstCreat, onUpgrade: _onUpgrade);
    print("userDb");
    return userDb;
  }
  static void _onUpgrade(Database db, int oldVersion, int newVersion)async {
    // In this case, oldVersion is 1, newVersion is 2
    if (oldVersion < newVersion) {
      String CREATE_TABLE_ITEMS = "CREATE TABLE " + ITEMS_TABLE + "("
          + CATEGORY_NAME + " TEXT,"
          + ITEM_NAME + " TEXT,"
          + ITEM_BARCODE + " TEXT,"
          + PRICE + " INTEGER,"
          + DESCRIPTION + " TEXT,"
          + ITEM_PICTURE + " BLOB,"
          + POINT + " REAL,"
          + QTY_ITEM + " REAL,"
          + TAX + " REAL" +
          ")";
      db.execute(CREATE_TABLE_ITEMS);
      print("CREATE ITEMS_TABLE");
      // *******************************************************************************

      String CREATE_TABLE_USERS = "CREATE TABLE " + USERS_TABLE + "("
          + USER_NAME + " TEXT,"
          + PASSWORD + " TEXT" + ")";

      db.execute(CREATE_TABLE_USERS);
      print("CREATE USERS_TABLE");
      // *******************************************************************************
      String CREATE_CATEGORY_TABLE = "CREATE TABLE " + CATEGORY_TABLE + "("
          + CATEGORY_NAME1 + " TEXT,"
          + CATEGORY_PIC1 + " TEXT"
          + ")";
      db.execute(CREATE_CATEGORY_TABLE);
      // *******************************************************************************
      String CREATE_NOTIFICATION_TABLE = "CREATE TABLE " + NOTIFICATION + "("
          + DESCRIPTION2 + " TEXT,"
          + DATE_FOR_NOTIFICATION2 + " TEXT,"
          + NOTIFICATION_NAME2 + " TEXT,"
          + POINT_FOR_NOTIFICATION + " TEXT,"
          +  TIME_FOR_NOTIFICATION+ " TEXT"

          + ")";
      db.execute(CREATE_NOTIFICATION_TABLE);
      // *******************************************************************************

      String CREATE_ORDER_TABLE = "CREATE TABLE " + ORDER_PAY + "("
          + CUSTOMER_NAME1 + " TEXT,"
          + CustomerNo1 + " TEXT,"
          + POINT_CUSTOMER1 + " REAL,"
          + TOTAL1 + " REAL,"
          +  DATE_FOR_PAY+ " TEXT,"
          +  QTY+ " REAL,"
          +  VOUCH_NO+ " TEXT ,"
          +  TOTAL_BEFORE_TAX+ " REAL,"
          +  TOTAL_AFTER_TAX+ " REAL,"
          +  TAX_VALUE+ " REAL ,"
          +  ITEM_NAME1+ " TEXT ,"
          +  ITEM_BARCODE1+ " TEXT ,"
          +  PRICE1+ " REAL"
          + ")";
      db.execute(CREATE_ORDER_TABLE);
      // *******************************************************************************

      // add new column to existing table.
    // create new Table
    }
  }


 static Future<Database> get database async {

    if (_database == null) {
      _database = await initialDb();
    }
    print("getDatabase");
    return _database;
  }


//  initDB() async {
//    // Get the location of our app directory. This is where files for our app,
//    // and only our app, are stored. Files in this directory are deleted
//    // when the app is deleted.
//    Directory documentsDir = await getApplicationDocumentsDirectory();
//    String path = join(documentsDir.path, 'app.db');
//
//    return await openDatabase(path, version: 1, onOpen: (db) async {
//    }, onCreate: (Database db, int version) async {
//      // Create the note table
//      await db.execute('''
//                CREATE TABLE note(
//                    id INTEGER PRIMARY KEY,
//                    contents TEXT DEFAULT ''
//                )
//            ''');
//    });
//  }



  static Future<void> closeDb() async{
    var db=await database;
    db.close();
    db=null;

  }
  static  Future<void> restart () async {
    Directory documentsDir = await getApplicationDocumentsDirectory();
    String path = join(documentsDir.path, 'app.db');
    File f= new File(path);
    if(! f.existsSync())
      {
        deleteDatabase(path);
        print("Dbase deleted");
      }
  }

}
