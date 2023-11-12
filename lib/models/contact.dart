class Contact {
  final int id;
  final String name;
  final String birthday;
  final int age;
  final String phoneNumber;
  final String bio;
  final String image;
  final String category;

  const Contact({
    required this.id,
    required this.name,
    required this.birthday,
    required this.age,
    required this.phoneNumber,
    required this.bio,
    required this.image,
    required this.category,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'birthday': birthday,
      'age': age,
      'phoneNumber': phoneNumber,
      'bio': bio,
      'image': image,
      'category': category,
    };
  }

  factory Contact.fromMap(Map<String, dynamic> map) {
    return Contact(
      id: map['id'] ?? 0,
      name: map['name'] ?? '',
      birthday: map['birthday'] ?? '',
      age: map['age'] ?? 0,
      phoneNumber: map['phoneNumber'] ?? '',
      bio: map['bio'] ?? '',
      image: map['image'] ?? '',
      category: map['category'] ?? ''
    );
  }

  Contact copyWith({required int id}) {
    return Contact(
      id: id,
      name: name,
      birthday: birthday,
      age: age,
      phoneNumber: phoneNumber,
      bio: bio,
      image: image,
      category: category,
    );
  }
}
