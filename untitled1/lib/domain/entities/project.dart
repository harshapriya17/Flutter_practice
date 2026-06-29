class Project {
  final String id;
  final String title;
  final String description;
  final double progress;
  final List<String> tags;
  final String ownerId;

  Project({
    required this.id,
    required this.title,
    required this.description,
    required this.progress,
    required this.tags,
    required this.ownerId,
  });
}
