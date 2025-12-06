import 'package:flutter/material.dart';
import '../utils/app_localizations.dart';
import '../utils/theme_provider.dart';
import '../utils/mock_data_localizer.dart';
import '../mock/mock_data.dart';
import '../models/announcement.dart';
import '../widgets/urgent_badge.dart';
import 'announcements_page.dart';
import 'khutbah_page.dart';
import 'prayer_times_page.dart';
import 'reports_page.dart';
import 'community_page.dart';
import 'feedback_page.dart';
import 'settings_page.dart';
import '../main.dart';

class HomeContentPage extends StatelessWidget {
  final ThemeProvider themeProvider;

  const HomeContentPage({super.key, required this.themeProvider});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context) ?? AppLocalizations(const Locale('en'));
    final announcements = MockData.getAnnouncements().take(3).toList();
    final screenWidth = MediaQuery.of(context).size.width;
    final crossAxisCount = screenWidth > 600 ? 3 : 2;

    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.appTitle),
        actions: [
          PopupMenuButton<Locale>(
            icon: const Icon(Icons.language),
            onSelected: (locale) {
              MyApp.of(context)?.setLocale(locale);
            },
            itemBuilder: (context) => [
              const PopupMenuItem(value: Locale('en'), child: Text('English')),
              const PopupMenuItem(value: Locale('ar'), child: Text('العربية')),
              const PopupMenuItem(value: Locale('ur'), child: Text('اردو')),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Quick Access Cards
            Text(
              localizations.quickAccess,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: themeProvider.textColor,
                  ),
            ),
            const SizedBox(height: 16),
            GridView.count(
              crossAxisCount: crossAxisCount,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1.1,
              children: [
                _buildQuickAccessCard(
                  context,
                  localizations.announcements,
                  Icons.campaign,
                  themeProvider,
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const AnnouncementsPage()),
                  ),
                ),
                _buildQuickAccessCard(
                  context,
                  localizations.khutbah,
                  Icons.menu_book,
                  themeProvider,
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const KhutbahPage()),
                  ),
                ),
                _buildQuickAccessCard(
                  context,
                  localizations.reports,
                  Icons.assessment,
                  themeProvider,
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const ReportsPage()),
                  ),
                ),
                _buildQuickAccessCard(
                  context,
                  localizations.community,
                  Icons.people,
                  themeProvider,
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const CommunityPage()),
                  ),
                ),
                _buildQuickAccessCard(
                  context,
                  localizations.feedback,
                  Icons.feedback,
                  themeProvider,
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const FeedbackPage()),
                  ),
                ),
                _buildQuickAccessCard(
                  context,
                  localizations.prayerTimes,
                  Icons.access_time,
                  themeProvider,
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => PrayerTimesPage(themeProvider: themeProvider),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            // Recent Announcements
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  localizations.announcements,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: themeProvider.textColor,
                      ),
                ),
                TextButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const AnnouncementsPage()),
                  ),
                  child: Text(localizations.viewAll),
                ),
              ],
            ),
            const SizedBox(height: 12),
            ...announcements.map((announcement) => _buildAnnouncementCard(context, announcement, themeProvider)),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickAccessCard(
    BuildContext context,
    String title,
    IconData icon,
    ThemeProvider themeProvider,
    VoidCallback onTap,
  ) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: themeProvider.primaryColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  icon,
                  size: 28,
                  color: themeProvider.primaryColor,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                  color: themeProvider.textColor,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAnnouncementCard(
    BuildContext context,
    Announcement announcement,
    ThemeProvider themeProvider,
  ) {
    final localizations = AppLocalizations.of(context) ?? AppLocalizations(const Locale('en'));
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: announcement.isUrgent ? const UrgentBadge() : null,
        title: Text(
          MockDataLocalizer.localizeAnnouncementTitle(announcement.title, localizations),
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: themeProvider.textColor,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text(
              MockDataLocalizer.localizeAnnouncementDescription(announcement.description, localizations),
              style: TextStyle(
                color: themeProvider.textSecondaryColor,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              '${announcement.date.day}/${announcement.date.month}/${announcement.date.year}',
              style: TextStyle(
                fontSize: 12,
                color: themeProvider.textSecondaryColor,
              ),
            ),
          ],
        ),
        isThreeLine: true,
      ),
    );
  }
}

class MorePage extends StatelessWidget {
  final Function(Locale) setLocale;
  final ThemeProvider themeProvider;

  const MorePage({
    super.key,
    required this.setLocale,
    required this.themeProvider,
  });

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context) ?? AppLocalizations(const Locale('en'));

    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.more),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ListTile(
            leading: const Icon(Icons.campaign),
            title: Text(localizations.announcements),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const AnnouncementsPage()),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.menu_book),
            title: Text(localizations.khutbah),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const KhutbahPage()),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.assessment),
            title: Text(localizations.reports),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const ReportsPage()),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.people),
            title: Text(localizations.community),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const CommunityPage()),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.feedback),
            title: Text(localizations.feedback),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const FeedbackPage()),
            ),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.settings),
            title: Text(localizations.settings),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => SettingsPage(themeProvider: themeProvider),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.language),
            title: Text(localizations.language),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text(localizations.language),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        title: const Text('English'),
                        onTap: () {
                          setLocale(const Locale('en'));
                          Navigator.pop(context);
                        },
                      ),
                      ListTile(
                        title: const Text('العربية'),
                        onTap: () {
                          setLocale(const Locale('ar'));
                          Navigator.pop(context);
                        },
                      ),
                      ListTile(
                        title: const Text('اردو'),
                        onTap: () {
                          setLocale(const Locale('ur'));
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
