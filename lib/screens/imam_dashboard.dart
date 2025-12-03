import 'package:flutter/material.dart';
import 'manage_prayer_times.dart';
import 'create_announcement.dart';
import 'create_event.dart';
import 'send_urgent_alert.dart';

// Dummy model for prayer times
class PrayerTime {
  final String name;
  final String time;
  PrayerTime(this.name, this.time);
}

class ImamDashboardScreen extends StatelessWidget {
  const ImamDashboardScreen({super.key});

  static const Color kPrimaryGreen = Color(0xFF11D452);

  // Example: Get next prayer dynamically
  PrayerTime getNextPrayer() {
    final now = TimeOfDay.now();
    final prayers = [
      PrayerTime('Fajr', '04:45 AM'),
      PrayerTime('Dhuhr', '01:30 PM'),
      PrayerTime('Asr', '04:30 PM'),
      PrayerTime('Maghrib', '06:30 PM'),
      PrayerTime('Isha', '08:00 PM'),
    ];

    for (var p in prayers) {
      final parts = p.time.split(RegExp(r'[:\s]'));
      int hour = int.parse(parts[0]);
      int minute = int.parse(parts[1]);
      if (parts[2] == 'PM' && hour != 12) hour += 12;
      if (parts[2] == 'AM' && hour == 12) hour = 0;

      if (hour > now.hour || (hour == now.hour && minute > now.minute)) {
        return p;
      }
    }
    return prayers[0];
  }

  String getTodayDate() {
    final now = DateTime.now();
    final formattedGregorian =
        "${now.day} ${_monthName(now.month)} ${now.year}";
    final formattedHijri = "14 Dhul Hijjah 1445"; // Placeholder
    return "$formattedHijri | $formattedGregorian";
  }

  String _monthName(int month) {
    const months = [
      '',
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    return months[month];
  }

  @override
  Widget build(BuildContext context) {
    final bg = Theme.of(context).scaffoldBackgroundColor;
    final nextPrayer = getNextPrayer();
    final imamName = 'Imam'; // Default name

    return Scaffold(
      backgroundColor: bg,
      appBar: AppBar(
        backgroundColor: bg,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Dashboard',
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: InkWell(
            borderRadius: BorderRadius.circular(999),
            onTap: () => _showProfileSheet(context, imamName),
            child: CircleAvatar(
              radius: 18,
              child: Text(
                imamName[0], // First letter
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => _showSettingsSheet(context),
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showQuickPost(context),
        icon: const Icon(Icons.campaign),
        label: const Text('Quick Post'),
        backgroundColor: kPrimaryGreen,
        foregroundColor: Colors.black,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Greeting
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Assalamu 'alaikum,",
                      style: TextStyle(fontSize: 22, color: Colors.black54),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      imamName,
                      style: const TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      getTodayDate(),
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 18),
              // Prayer times banner (clickable)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: InkWell(
                  borderRadius: BorderRadius.circular(20),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const ManagePrayerTimesScreen(),
                    ),
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: const LinearGradient(
                        colors: [Color(0xFF0FB55A), Color(0xFF11D452)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      boxShadow: [
                        BoxShadow(
                          // ignore: deprecated_member_use
                          color: Colors.black.withOpacity(0.08),
                          blurRadius: 16,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Next Prayer",
                                  style: TextStyle(
                                    // ignore: deprecated_member_use
                                    color: Colors.white.withOpacity(0.9),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  nextPrayer.name,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  nextPrayer.time,
                                  style: TextStyle(
                                    // ignore: deprecated_member_use
                                    color: Colors.white.withOpacity(0.9),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                // ignore: deprecated_member_use
                                color: Colors.white.withOpacity(0.12),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Row(
                                children: const [
                                  Icon(
                                    Icons.access_time,
                                    size: 16,
                                    color: Colors.white,
                                  ),
                                  SizedBox(width: 6),
                                  Text(
                                    'View & Edit Times',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 14),
                        Text(
                          "Tap to manage today's jamaat times",
                          style: TextStyle(
                            // ignore: deprecated_member_use
                            color: Colors.white.withOpacity(0.85),
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Main dashboard actions
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 1.2,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    _DashboardTile(
                      icon: Icons.campaign,
                      title: 'Announcements',
                      subtitle: 'Post messages',
                      color: Colors.orange.shade400,
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const CreateAnnouncementScreen(),
                        ),
                      ),
                    ),
                    _DashboardTile(
                      icon: Icons.event,
                      title: 'Events',
                      subtitle: 'Plan programs',
                      color: Colors.blue.shade400,
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const CreateEventScreen(),
                        ),
                      ),
                    ),
                    _DashboardTile(
                      icon: Icons.groups,
                      title: 'Community',
                      subtitle: 'Engage & reach out',
                      color: Colors.purple.shade400,
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const SendUrgentAlertScreen(),
                        ),
                      ),
                    ),
                    _DashboardTile(
                      icon: Icons.edit_calendar,
                      title: 'Prayer Times',
                      subtitle: 'Quick access',
                      color: Colors.teal.shade400,
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const ManagePrayerTimesScreen(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 80),
            ],
          ),
        ),
      ),
    );
  }

  void _showQuickPost(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 8),
              const ListTile(
                title: Text(
                  'Quick post',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.campaign),
                title: const Text('Post announcement'),
                subtitle: const Text('Share a message with the community'),
                onTap: () {
                  Navigator.pop(ctx);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const CreateAnnouncementScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.event),
                title: const Text('Create event'),
                subtitle: const Text('Add a new program or gathering'),
                onTap: () {
                  Navigator.pop(ctx);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const CreateEventScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.notifications_active),
                title: const Text('Urgent alert'),
                subtitle: const Text('Send an important notification'),
                onTap: () {
                  Navigator.pop(ctx);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const SendUrgentAlertScreen(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 6),
            ],
          ),
        );
      },
    );
  }

  void _showProfileSheet(BuildContext context, String imamName) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 22,
                      child: Text(
                        imamName[0],
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          imamName,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 2),
                        const Text(
                          'Imam account (demo)',
                          style: TextStyle(color: Colors.black54),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const Text(
                  'Profile options coming soon. In this demo you can already manage announcements, events and alerts.',
                  style: TextStyle(color: Colors.black87),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showSettingsSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              SizedBox(height: 8),
              ListTile(
                title: Text(
                  'Settings',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                ),
                subtitle: Text(
                  'Settings like theme and notification preferences can be added here later.',
                ),
              ),
              SizedBox(height: 12),
            ],
          ),
        );
      },
    );
  }
}

class _DashboardTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;
  final VoidCallback onTap;

  const _DashboardTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          // ignore: deprecated_member_use
          color: color.withOpacity(0.14),
          borderRadius: BorderRadius.circular(18),
          // ignore: deprecated_member_use
          border: Border.all(color: color.withOpacity(0.4)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: Colors.white, size: 22),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(color: Colors.grey[700], fontSize: 12),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
