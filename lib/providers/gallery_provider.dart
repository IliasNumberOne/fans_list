import 'package:fans_list/data/data.dart';
import 'package:fans_list/models/models.dart';
import 'package:fans_list/services/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class GalleryProvider extends ChangeNotifier {
  final ContactService _contactService;
  final PhotoService _photoService;

  GalleryProvider(
      {required ContactService contactService,
      required PhotoService photoService})
      : _contactService = contactService,
        _photoService = photoService;

  List<Contact> _contactList = [];
  List<Contact> sortedList = [];
  int _selected = 0;
  String searchQuery = '';
  List<Photo> _photoList = [];
  late int contactId;
  String _contactName = '';

  List<Contact> get contactList => _contactList;
  int get selected => _selected;
  List<Photo> get photoList => _photoList;
  String get contactName => _contactName;

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
    if (selected == 0) {
      _contactList = await _contactService.getAllContacts();
      sortedList = await _contactService.getAllContacts();
    } else {
      List<Contact> list = await _contactService.getAllContacts();
      _contactList = list
          .where((element) => element.category == categories[selected].name)
          .toList();
      sortedList = list
          .where((element) => element.category == categories[selected].name)
          .toList();
    }
    onSearch(searchQuery);
    notifyListeners();
  }

  void addImage() async {
    final XFile? image =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    String imagePath = image!.path;
    Photo newPhoto = Photo(
      id: 0,
      contactId: contactId,
      photo: imagePath,
    );
    await _photoService.createPhotoList(newPhoto);
    getPhotos(contactId);
    notifyListeners();
  }

  void getPhotos(int id) async {
    print('=+++get photos worked=======');
    contactId = id;
    _contactName = _contactList[id].name;
    List<Photo> allPhotos = await _photoService.getAllPhotos();
    _photoList = allPhotos.where((element) => element.contactId == contactId).toList();
    notifyListeners();
  }
}
