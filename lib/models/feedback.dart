class FeedbackItem {
  final String id;
  final String title;
  final String content;
  final DateTime date;
  final String? category;

  FeedbackItem({
    required this.id,
    required this.title,
    required this.content,
    required this.date,
    this.category,
  });
}

class Poll {
  final String id;
  final String question;
  final List<String> options;
  final DateTime date;
  final Map<String, int> votes;

  Poll({
    required this.id,
    required this.question,
    required this.options,
    required this.date,
    Map<String, int>? votes,
  }) : votes = votes ?? {};
}

