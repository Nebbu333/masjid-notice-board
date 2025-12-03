import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UmmahDashboardScreen extends StatelessWidget {
  const UmmahDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FDF8),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        title: Row(
          children: [
            Icon(Icons.mosque, color: Color(0xFF1A3D2B)),
            const SizedBox(width: 10),
            Text('Masjid Notice Board', style: GoogleFonts.poppins(fontWeight: FontWeight.bold, color: Color(0xFF1A3D2B))),
            const Spacer(),
            IconButton(
              icon: Stack(children: [
                Icon(Icons.notifications, color: Color(0xFF1A3D2B)),
                Positioned(
                  right: 0,
                  child: CircleAvatar(radius: 6, backgroundColor: Colors.amber, child: Text('!', style: TextStyle(fontSize: 10, color: Colors.white))),
                ),
              ]),
              onPressed: () {},
            ),
            CircleAvatar(
              backgroundColor: Color(0xFF1A3D2B),
              child: Icon(Icons.person, color: Colors.white),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color(0xFF1A3D2B),
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.access_time), label: 'Prayer'),
          BottomNavigationBarItem(icon: Icon(Icons.event), label: 'Events'),
          BottomNavigationBarItem(icon: Icon(Icons.groups), label: 'Community'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Prayer Time Widget
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
              color: Color(0xFF1A3D2B),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  children: [
                    Icon(Icons.access_time, color: Colors.amber, size: 32),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Next: Dhuhr in 1h 23m', style: GoogleFonts.poppins(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold)),
                          Text('Tap to see full schedule', style: GoogleFonts.poppins(fontSize: 13, color: Colors.amber)),
                        ],
                      ),
                    ),
                    Icon(Icons.arrow_forward_ios, color: Colors.white, size: 18),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 18),
            // Quick Actions
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _quickAction(context, Icons.campaign, 'Announcements', Color(0xFF1A3D2B), '/announcements'),
                _quickAction(context, Icons.menu_book, 'Khutbahs', Color(0xFF1A3D2B), '/khutbahs'),
                _quickAction(context, Icons.event, 'Events', Color(0xFF1A3D2B), '/events'),
                _quickAction(context, Icons.volunteer_activism, 'Donate', Colors.amber, '/donate'),
                _quickAction(context, Icons.groups, 'Community', Color(0xFF1A3D2B), '/community'),
              ],
            ),
            const SizedBox(height: 18),
            // Featured Section
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              elevation: 3,
              color: Colors.white,
              child: ListTile(
                leading: Icon(Icons.menu_book, color: Color(0xFF1A3D2B), size: 32),
                title: Text('This Week’s Khutbah', style: GoogleFonts.poppins(fontWeight: FontWeight.bold, color: Color(0xFF1A3D2B))),
                subtitle: Text('Imam Zaid Shakir • Friday, Dec 5', style: GoogleFonts.poppins(color: Color(0xFF1A3D2B))),
                trailing: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF1A3D2B)),
                  onPressed: () {},
                  child: Text('Listen Now', style: GoogleFonts.poppins(color: Colors.white)),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              elevation: 2,
              color: Colors.amber.shade100,
              child: ListTile(
                leading: Icon(Icons.warning, color: Colors.amber, size: 32),
                title: Text('URGENT: Masjid Closed Today', style: GoogleFonts.poppins(fontWeight: FontWeight.bold, color: Colors.amber.shade900)),
                trailing: TextButton(
                  onPressed: () {},
                  child: Text('Dismiss', style: GoogleFonts.poppins(color: Colors.amber.shade900)),
                ),
              ),
            ),
            const SizedBox(height: 18),
            Text('Recent Announcements', style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600, color: Color(0xFF1A3D2B))),
            const SizedBox(height: 8),
            _announcementCard('Friday Khutbah: Charity', '2h ago', Icons.menu_book, Colors.amber),
            _announcementCard('Youth Halaqa Series', 'Yesterday', Icons.event, Color(0xFF1A3D2B)),
            _announcementCard('Lost & Found: Keys', 'Yesterday', Icons.groups, Colors.redAccent),
            _announcementCard('Eid Fundraiser', '2 days ago', Icons.volunteer_activism, Colors.green),
          ],
        ),
      ),
    );
  }

  Widget _quickAction(BuildContext context, IconData icon, String label, Color color, String route) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: color.withOpacity(0.12),
            child: Icon(icon, color: color, size: 28),
          ),
          const SizedBox(height: 6),
          Text(label, style: GoogleFonts.poppins(fontSize: 12, color: color, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }

  Widget _announcementCard(String title, String time, IconData icon, Color color) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: ListTile(
        leading: Icon(icon, color: color, size: 28),
        title: Text(title, style: GoogleFonts.poppins(fontWeight: FontWeight.w500, color: Color(0xFF1A3D2B))),
        subtitle: Text(time, style: GoogleFonts.poppins(fontSize: 12, color: Color(0xFF1A3D2B))),
        trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.green.shade300),
      ),
    );
  }
}
