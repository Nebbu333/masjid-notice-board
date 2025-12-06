class Khutbah {
  final String id;
  final String title;
  final DateTime date;
  final String content;
  final String? audioUrl;
  final String? videoUrl;

  Khutbah({
    required this.id,
    required this.title,
    required this.date,
    required this.content,
    this.audioUrl,
    this.videoUrl,
  });
}

