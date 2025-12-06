import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../utils/app_localizations.dart';
import '../utils/mock_data_localizer.dart';
import '../mock/mock_data.dart';
import '../models/announcement.dart';
import '../widgets/urgent_badge.dart';

class AnnouncementsPage extends StatelessWidget {
  const AnnouncementsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context) ?? AppLocalizations(const Locale('en'));
    final announcements = MockData.getAnnouncements();

    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.announcements),
      ),
      body: announcements.isEmpty
          ? Center(
              child: Text(
                localizations.noAnnouncements,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: announcements.length,
              itemBuilder: (context, index) {
                final announcement = announcements[index];
                return _buildAnnouncementCard(context, announcement);
              },
            ),
    );
  }

  Widget _buildAnnouncementCard(BuildContext context, Announcement announcement) {
    final localizations = AppLocalizations.of(context) ?? AppLocalizations(const Locale('en'));
    final dateFormat = DateFormat('MMM dd, yyyy');
    
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                if (announcement.isUrgent) ...[
                  const UrgentBadge(),
                  const SizedBox(width: 8),
                ],
                Expanded(
                  child: Text(
                    MockDataLocalizer.localizeAnnouncementTitle(announcement.title, localizations),
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              MockDataLocalizer.localizeAnnouncementDescription(announcement.description, localizations),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Icon(Icons.calendar_today, size: 16, color: Colors.grey[600]),
                const SizedBox(width: 4),
                Text(
                  dateFormat.format(announcement.date),
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

