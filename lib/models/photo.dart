class Photo {
  int id;
  int contactId;
  String photo;

  Photo({
    required this.id,
    required this.contactId,
    required this.photo,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'contactId': contactId,
      'photo': photo,
    };
  }

  factory Photo.fromMap(Map<String, dynamic> map) {
    return Photo(
      id: map['id'] ?? 0,
      contactId: map['contactId'] ?? 0,
      photo: map['photo'] ?? '',
    );
  }

  Photo copyWith({required int id}) {
    return Photo(
      id: id,
      contactId: contactId,
      photo: photo,
    );
  }
}
