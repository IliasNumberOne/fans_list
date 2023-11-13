import 'package:fans_list/models/models.dart';
import 'package:sqflite/sqlite_api.dart';

const photoTable = 'photo_table';

class PhotoService {
  final Database database;

  PhotoService(this.database);

  Future<Photo> createPhotoList(Photo photo) async {
    final map = photo.toMap();
    map['id'] = null;
    final id = await database.insert(
      photoTable,
      map,
      conflictAlgorithm: ConflictAlgorithm.ignore,
    );
    return photo.copyWith(id: id);
  }

  Future<List<Photo>> getAllPhotos() async {
    final map = await database.query(photoTable);
    if (map.isEmpty) return [];
    final data = map.map(Photo.fromMap).toList();
    return data;
  }

  Future<void> deletePhoto(Photo photo) async {
    await database.delete(
      photoTable,
      where: 'id = ?',
      whereArgs: [photo.id],
    );
  }
}
