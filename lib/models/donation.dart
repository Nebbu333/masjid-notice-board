class Donation {
  final String id;
  final String category;
  final double amount;
  final DateTime date;
  final String? note;
  final String? receiptNumber;

  Donation({
    required this.id,
    required this.category,
    required this.amount,
    required this.date,
    this.note,
    this.receiptNumber,
  });
}

class DonationCategory {
  final String id;
  final String name;
  final String description;

  DonationCategory({
    required this.id,
    required this.name,
    required this.description,
  });
}

