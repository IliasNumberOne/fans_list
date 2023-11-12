import 'package:fans_list/data/data.dart';
import 'package:fans_list/models/models.dart';
import 'package:fans_list/services/services.dart';
import 'package:flutter/cupertino.dart';

class ContactProvider extends ChangeNotifier {
  final ContactService _contactService;

  ContactProvider({
    required ContactService contactService,
  }) : _contactService = contactService;

  List<Contact> _contactList = [];
  String contactCategory = '';
  late Contact _contactInfo;
  int _selected = 0;

  List<Contact> get contactList => _contactList;
  Contact get contactInfo => _contactInfo;

  int get selected => _selected;

  void initState() async {
    _contactList = await _contactService.getAllContacts();
    notifyListeners();
  }

  void getContactInfo(index) async {
    _contactInfo = await _contactService.getOneContact(contactList[index]);
    notifyListeners();
  }

  void createContact (
    String image,
    String name,
    String birthday,
    String phoneNumber,
    String bio,
    int age,
  ) async {
    Contact newContact = Contact(
      id: 0,
      name: name,
      birthday: birthday,
      age: age,
      phoneNumber: phoneNumber,
      bio: bio,
      image: image,
      category: contactCategory,
    );
    await _contactService.createContactList(newContact);
    _contactList = await _contactService.getAllContacts();
    notifyListeners();
  }

  void changeCategory(index) async {
    _selected = index;
    if(selected == 0) {
      _contactList = await _contactService.getAllContacts();
    } else{
      List<Contact> list = await _contactService.getAllContacts();
      _contactList = list.where((element) => element.category == categories[selected].name).toList();
    }
    notifyListeners();
  }

}
