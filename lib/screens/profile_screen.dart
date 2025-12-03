import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        title: Text('Profile & Settings', style: GoogleFonts.poppins(fontWeight: FontWeight.bold, color: Color(0xFF1A3D2B))),
      ),
      backgroundColor: const Color(0xFFF8FDF8),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: ListView(
          children: [
            Center(
              child: CircleAvatar(
                radius: 40,
                backgroundColor: Colors.green.shade700,
                child: Icon(Icons.person, color: Colors.white, size: 40),
              ),
            ),
            const SizedBox(height: 12),
            Center(child: Text('User Name', style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 18))),
            Center(child: Text('user@email.com', style: GoogleFonts.poppins(color: Colors.green.shade700))),
            const SizedBox(height: 18),
            ListTile(
              leading: Icon(Icons.edit, color: Colors.green.shade700),
              title: Text('Edit Profile', style: GoogleFonts.poppins()),
              trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.green.shade300),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.account_balance, color: Colors.green.shade700),
              title: Text('Followed Masjids', style: GoogleFonts.poppins()),
              trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.green.shade300),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.notifications, color: Colors.green.shade700),
              title: Text('Notification Settings', style: GoogleFonts.poppins()),
              trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.green.shade300),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.language, color: Colors.green.shade700),
              title: Text('Language', style: GoogleFonts.poppins()),
              trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.green.shade300),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.lock, color: Colors.green.shade700),
              title: Text('Privacy & Security', style: GoogleFonts.poppins()),
              trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.green.shade300),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.help, color: Colors.green.shade700),
              title: Text('About & Help', style: GoogleFonts.poppins()),
              trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.green.shade300),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
