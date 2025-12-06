import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../utils/app_localizations.dart';
import '../mock/mock_data.dart';
import '../models/khutbah.dart';
import 'khutbah_detail_page.dart';

class KhutbahPage extends StatelessWidget {
  const KhutbahPage({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context) ?? AppLocalizations(const Locale('en'));
    final khutbahs = MockData.getKhutbahs();

    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.khutbah),
      ),
      body: khutbahs.isEmpty
          ? Center(
              child: Text(
                localizations.noKhutbahs,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: khutbahs.length,
              itemBuilder: (context, index) {
                final khutbah = khutbahs[index];
                return _buildKhutbahCard(context, khutbah);
              },
            ),
    );
  }

  Widget _buildKhutbahCard(BuildContext context, Khutbah khutbah) {
    final localizations = AppLocalizations.of(context) ?? AppLocalizations(const Locale('en'));
    final dateFormat = DateFormat('MMM dd, yyyy');
    
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => KhutbahDetailPage(khutbah: khutbah),
            ),
          );
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                khutbah.title,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Icon(Icons.calendar_today, size: 16, color: Colors.grey[600]),
                  const SizedBox(width: 4),
                  Text(
                    dateFormat.format(khutbah.date),
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  if (khutbah.audioUrl != null)
                    Chip(
                      avatar: const Icon(Icons.audiotrack, size: 16),
                      label: Text(localizations.audio),
                    ),
                  if (khutbah.videoUrl != null) ...[
                    const SizedBox(width: 8),
                    Chip(
                      avatar: const Icon(Icons.videocam, size: 16),
                      label: Text(localizations.video),
                    ),
                  ],
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

