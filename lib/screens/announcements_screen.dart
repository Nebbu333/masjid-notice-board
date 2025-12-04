import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnnouncementsScreen extends StatelessWidget {
  const AnnouncementsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        title: Text(
          'Announcements',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            color: Color(0xFF1A3D2B),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              'Mark All as Read',
              style: GoogleFonts.poppins(color: Color(0xFF1A3D2B)),
            ),
          ),
        ],
      ),
      backgroundColor: const Color(0xFFF8FDF8),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF1A3D2B),
        onPressed: () {},
        tooltip: 'Mute Notifications',
        child: const Icon(Icons.notifications_off, color: Colors.amber),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search, color: Color(0xFF1A3D2B)),
                labelText: 'Search announcements…',
                labelStyle: GoogleFonts.poppins(color: Color(0xFF1A3D2B)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _filterTab('All', true),
                _filterTab('Urgent', false),
                _filterTab('Classes', false),
                _filterTab('Events', false),
                _filterTab('Charity', false),
              ],
            ),
            const SizedBox(height: 12),
            Expanded(
              child: ListView(
                children: [
                  _announcementItem(
                    context,
                    'URGENT: Masjid Closed Today',
                    '2h ago',
                    Icons.warning,
                    Colors.amber,
                    true,
                  ),
                  _announcementItem(
                    context,
                    'Friday Khutbah: Charity',
                    'Yesterday',
                    Icons.menu_book,
                    Colors.amber,
                    false,
                  ),
                  _announcementItem(
                    context,
                    'Youth Halaqa Series',
                    'Yesterday',
                    Icons.event,
                    Color(0xFF1A3D2B),
                    false,
                  ),
                  _announcementItem(
                    context,
                    'Eid Fundraiser',
                    '2 days ago',
                    Icons.volunteer_activism,
                    Colors.green,
                    false,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _filterTab(String label, bool selected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: selected ? Color(0xFF1A3D2B) : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.green.shade200),
      ),
      child: Text(
        label,
        style: GoogleFonts.poppins(
          color: selected ? Colors.white : Color(0xFF1A3D2B),
        ),
      ),
    );
  }

  Widget _announcementItem(
    BuildContext context,
    String title,
    String time,
    IconData icon,
    Color color,
    bool urgent,
  ) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 6),
      color: urgent ? Colors.amber.shade100 : Colors.white,
      child: ListTile(
        leading: Icon(icon, color: color, size: 28),
        title: Row(
          children: [
            Text(
              title,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                color: Color(0xFF1A3D2B),
              ),
            ),
            if (urgent) ...[
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'URGENT',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ],
        ),
        subtitle: Text(
          time,
          style: GoogleFonts.poppins(fontSize: 12, color: Color(0xFF1A3D2B)),
        ),
        trailing: urgent
            ? TextButton(
                onPressed: () {},
                child: Text(
                  'Dismiss',
                  style: GoogleFonts.poppins(color: Colors.amber.shade900),
                ),
              )
            : Icon(Icons.circle, color: Colors.green, size: 12),
        onTap: () {
          // Example navigation to details
          Navigator.pushNamed(context, '/announcement-details');
        },
      ),
    );
  }
}
