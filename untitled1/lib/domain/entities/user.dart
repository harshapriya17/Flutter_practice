class User {
  final String id;
  final String name;
  final String email;
  final String? profileImage;
  final List<String> skills;

  User({
    required this.id,
    required this.name,
    required this.email,
    this.profileImage,
    this.skills = const [],
  });
}
