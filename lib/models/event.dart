class Event {
  final String id;
  final String title;
  final String description;
  final DateTime date;
  final DateTime? endDate;
  final String location;
  final String category;
  final bool requiresRSVP;

  Event({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    this.endDate,
    required this.location,
    required this.category,
    this.requiresRSVP = false,
  });
}

