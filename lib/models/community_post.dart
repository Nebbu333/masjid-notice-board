class CommunityPost {
  final String id;
  final String title;
  final String content;
  final String author;
  final DateTime date;
  final String category; // 'lost_found', 'volunteering', 'general'
  final bool isModerated;

  CommunityPost({
    required this.id,
    required this.title,
    required this.content,
    required this.author,
    required this.date,
    required this.category,
    this.isModerated = false,
  });
}

