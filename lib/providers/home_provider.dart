import 'package:fans_list/data/data.dart';
import 'package:fans_list/models/models.dart';
import 'package:fans_list/services/services.dart';
import 'package:flutter/cupertino.dart';

class HomeProvider extends ChangeNotifier {
  final ContactService _contactService;

  HomeProvider({
    required ContactService contactService,
  }) : _contactService = contactService;

  List<Contact> _contactList = [];
  List<Contact> sortedList = [];
  int _selected = 0;
  String searchQuery = '';

  List<Contact> get contactList => _contactList;
  int get selected => _selected;

  void initState() async {
    _contactList = await _contactService.getAllContacts();
    notifyListeners();
  }

  void onSearch(String query) async {
    searchQuery = query;
    if (query.isEmpty) {
      _contactList = sortedList;
      notifyListeners();
      return;
    }
    _contactList = sortedList
        .where((element) =>
        element.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
    notifyListeners();
  }

  void changeCategory(index) async {
    _selected = index;
    if(selected == 0) {
      _contactList = await _contactService.getAllContacts();
      sortedList = await _contactService.getAllContacts();
    } else{
      List<Contact> list = await _contactService.getAllContacts();
      _contactList = list.where((element) => element.category == categories[selected].name).toList();
      sortedList = list.where((element) => element.category == categories[selected].name).toList();
    }
    onSearch(searchQuery);
    notifyListeners();
  }
}
