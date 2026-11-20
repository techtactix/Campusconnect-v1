class Club {
  final String id;
  final String name;
  final String description;
  final String category;
  final String lead;
  int memberCount;
  final String iconEmoji;
  bool isJoined;

  Club({
    required this.id,
    required this.name,
    required this.description,
    required this.category,
    required this.lead,
    required this.memberCount,
    required this.iconEmoji,
    this.isJoined = false,
  });
}
