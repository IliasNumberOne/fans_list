import 'dart:async';

import 'package:fans_list/services/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

const idType = "INTEGER PRIMARY KEY AUTOINCREMENT";
const uuidType = "TEXT PRIMARY KEY";
const boolType = "BOOLEAN DEFAULT FALSE";
const intType = "INTEGER NOT NULL";
const textType = "TEXT NOT NULL";
const blobType = "BLOB NOT NULL";
const timestampType = "DATETIME DEFAULT CURRENT_TIMESTAMP";
const doubleType = "REAL DEFAULT 0";

class SqlService {
  static final SqlService _instance = SqlService._();

  static Database? _database;

  SqlService._();

  factory SqlService() => _instance;

  Database get database => _database!;

  Future<void> init() async {
    final String dbPath = await getDatabasesPath();
    final String path = join(dbPath, 'quotex_count_spends.db');

    _database = await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  FutureOr<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $contactTable (
        id $idType,
        name $textType,
        birthday $textType,
        age $intType,
        phoneNumber $textType,
        bio $textType,
        image $textType,
        category $textType
      )
    ''');
    await db.execute('''
      CREATE TABLE $photoTable (
        id $idType,
        contactId $intType,
        photo $textType
      )
    ''');
  }


  Future<void> close() async {
    _database?.close();
  }
}