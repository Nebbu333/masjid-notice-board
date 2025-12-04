import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'create_announcement.dart';

class KhadimDashboardScreen extends StatelessWidget {
  const KhadimDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FDF8),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        title: Row(
          children: [
            Icon(Icons.mosque, color: Colors.green.shade700),
            const SizedBox(width: 10),
            Text(
              'Khadim Dashboard',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                color: Colors.green.shade900,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green.shade700,
        child: const Icon(Icons.add, color: Colors.white),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const CreateAnnouncementScreen()),
          );
        },
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome, Khadim/Admin',
              style: GoogleFonts.poppins(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: Colors.green.shade900,
              ),
            ),
            const SizedBox(height: 18),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _statCard(
                  'Pending Approvals',
                  '3',
                  Icons.verified_user,
                  Colors.orange,
                ),
                _statCard(
                  'Donations',
                  '3,200',
                  Icons.volunteer_activism,
                  Colors.green,
                ),
                _statCard('Maintenance', '2', Icons.build, Colors.redAccent),
              ],
            ),
            const SizedBox(height: 18),
            Text(
              'Quick Actions',
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.green.shade800,
              ),
            ),
            const SizedBox(height: 10),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              childAspectRatio: 1.2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              children: [
                _actionCard(
                  context,
                  'Post Maintenance',
                  Icons.build,
                  Colors.green.shade100,
                  '/maintenance',
                ),
                _actionCard(
                  context,
                  'Manage Donations',
                  Icons.volunteer_activism,
                  Colors.yellow.shade100,
                  '/donations',
                ),
                _actionCard(
                  context,
                  'Pin Announcements',
                  Icons.push_pin,
                  Colors.orange.shade100,
                  '/pin',
                ),
                _actionCard(
                  context,
                  'Approve Accounts',
                  Icons.verified_user,
                  Colors.blue.shade100,
                  '/approvals',
                ),
                _actionCard(
                  context,
                  'Edit/Delete Posts',
                  Icons.edit,
                  Colors.red.shade100,
                  '/editposts',
                ),
                _actionCard(
                  context,
                  'Masjid Profile',
                  Icons.account_balance,
                  Colors.teal.shade100,
                  '/masjidprofile',
                ),
              ],
            ),
            const SizedBox(height: 18),
            Text(
              'Recent Activity',
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.green.shade800,
              ),
            ),
            const SizedBox(height: 8),
            _activityCard('Water issue resolved', 'Maintenance', 'Today'),
            _activityCard(
              'Eid Fundraiser reached 80%',
              'Donation',
              'Yesterday',
            ),
            _activityCard('Imam account approved', 'Approval', '2 days ago'),
            _activityCard(
              'Pinned: Friday Khutbah',
              'Announcement',
              '2 days ago',
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _statCard(String title, String value, IconData icon, Color color) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 3,
      // ignore: deprecated_member_use
      color: color.withOpacity(0.15),
      child: Container(
        width: 100,
        height: 90,
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color, size: 28),
            const SizedBox(height: 8),
            Text(
              value,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.green.shade900,
              ),
            ),
            Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 12,
                color: Colors.green.shade800,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _actionCard(
    BuildContext context,
    String title,
    IconData icon,
    Color color,
    String route,
  ) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 2,
        color: color,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: Colors.green.shade700, size: 30),
              const SizedBox(height: 10),
              Text(
                title,
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  color: Colors.green.shade900,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _activityCard(String title, String type, String time) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: ListTile(
        leading: Icon(Icons.check_circle, color: Colors.green.shade700),
        title: Text(
          title,
          style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
        ),
        subtitle: Text(
          '$type • $time',
          style: GoogleFonts.poppins(fontSize: 12),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          size: 16,
          color: Colors.green.shade300,
        ),
      ),
    );
  }
}
