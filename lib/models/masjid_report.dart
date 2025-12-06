class MasjidReport {
  final String id;
  final String type; // 'financial' or 'project'
  final String title;
  final String description;
  final DateTime date;
  final double? amount;
  final String? category;

  MasjidReport({
    required this.id,
    required this.type,
    required this.title,
    required this.description,
    required this.date,
    this.amount,
    this.category,
  });
}

class DonationRecord {
  final String id;
  final String category;
  final double amount;
  final DateTime date;
  final String? note;

  DonationRecord({
    required this.id,
    required this.category,
    required this.amount,
    required this.date,
    this.note,
  });
}

