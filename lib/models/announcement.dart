class Announcement {
  final String id;
  final String title;
  final String body;
  final String category;
  final DateTime date;
  final bool isImportant;

  const Announcement({
    required this.id,
    required this.title,
    required this.body,
    required this.category,
    required this.date,
    this.isImportant = false,
  });
}
