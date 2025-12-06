import 'package:flutter/material.dart';
import '../utils/app_localizations.dart';
import '../models/khutbah.dart';

class KhutbahDetailPage extends StatefulWidget {
  final Khutbah khutbah;

  const KhutbahDetailPage({super.key, required this.khutbah});

  @override
  State<KhutbahDetailPage> createState() => _KhutbahDetailPageState();
}

class _KhutbahDetailPageState extends State<KhutbahDetailPage> {
  bool _isPlaying = false;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context) ?? AppLocalizations(const Locale('en'));

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.khutbah.title),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Audio Player
            if (widget.khutbah.audioUrl != null) ...[
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(_isPlaying ? Icons.pause : Icons.play_arrow),
                            iconSize: 40,
                            onPressed: () {
                              setState(() {
                                _isPlaying = !_isPlaying;
                              });
                            },
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _isPlaying ? localizations.pause : localizations.play,
                                  style: const TextStyle(fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 4),
                                const LinearProgressIndicator(value: 0.3),
                                const SizedBox(height: 4),
                                const Text(
                                  '00:45 / 15:30',
                                  style: TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
            // Video Container
            if (widget.khutbah.videoUrl != null) ...[
              Card(
                child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.black87,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.play_circle_outline,
                          size: 64,
                          color: Colors.white,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          localizations.videoPlayerPlaceholder,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
            // Khutbah Content
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.khutbah.title,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      widget.khutbah.content,
                      style: Theme.of(context).textTheme.bodyLarge,
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Download Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(localizations.downloadStarted)),
                  );
                },
                icon: const Icon(Icons.download),
                label: Text(localizations.download),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

