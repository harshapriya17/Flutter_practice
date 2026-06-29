import 'package:hive/hive.dart';

part 'item_model.g.dart';

@HiveType(typeId: 0)
enum ItemType {
  @HiveField(0)
  lost,
  @HiveField(1)
  found,
}

@HiveType(typeId: 1)
enum ItemStatus {
  @HiveField(0)
  lost,
  @HiveField(1)
  matched,
  @HiveField(2)
  found,
  @HiveField(3)
  claimed,
  @HiveField(4)
  returned,
}

@HiveType(typeId: 2)
class ItemModel extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String name;

  @HiveField(2)
  String category;

  @HiveField(3)
  String description;

  @HiveField(4)
  DateTime date;

  @HiveField(5)
  String location;

  @HiveField(6)
  String contactNumber;

  @HiveField(7)
  String? imagePath;

  @HiveField(8)
  ItemType type;

  @HiveField(9)
  ItemStatus status;

  ItemModel({
    required this.id,
    required this.name,
    required this.category,
    required this.description,
    required this.date,
    required this.location,
    required this.contactNumber,
    this.imagePath,
    required this.type,
    required this.status,
  });
}
