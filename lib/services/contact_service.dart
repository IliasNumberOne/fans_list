import 'package:fans_list/models/models.dart';
import 'package:sqflite/sqlite_api.dart';

const contactTable = 'contact_table';

class ContactService {
  final Database database;

  ContactService(this.database);

  Future<Contact> createContactList(Contact contact) async {
    final map = contact.toMap();
    map['id'] = null;
    final id = await database.insert(
      contactTable,
      map,
      conflictAlgorithm: ConflictAlgorithm.ignore,
    );
    return contact.copyWith(id: id);
  }

  Future<List<Contact>> getAllContacts() async {
    final map = await database.query(contactTable);
    if (map.isEmpty) return [];
    final data = map.map(Contact.fromMap).toList();
    return data;
  }

  Future<Contact> getOneContact(Contact contact) async {
    final item = await database.query(
      contactTable,
      where: 'id = ?',
      whereArgs: [contact.id],
      limit: 1,
    );
    final data = item.map(Contact.fromMap).toList().first;
    return data;
  }

  Future<void> deleteContact(Contact contact) async {
    await database.delete(
      contactTable,
      where: 'id = ?',
      whereArgs: [contact.id],
    );
  }
}
