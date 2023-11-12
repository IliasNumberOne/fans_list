class Category {
  final int id;
  final String name;
  final String icon;
  final String subText;
  final String additionalName;

  const Category({
    required this.id,
    required this.name,
    required this.icon,
    required this.subText,
    this.additionalName = '',
  });
}
