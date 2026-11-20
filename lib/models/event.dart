class Event {
  final String id;
  final String title;
  final String description;
  final String location;
  final DateTime dateTime;
  final String organizer;
  final String category;
  final String imageAsset;
  bool isRegistered;

  Event({
    required this.id,
    required this.title,
    required this.description,
    required this.location,
    required this.dateTime,
    required this.organizer,
    required this.category,
    required this.imageAsset,
    this.isRegistered = false,
  });
}
