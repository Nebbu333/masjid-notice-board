import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EventsScreen extends StatelessWidget {
  const EventsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        title: Text('Events', style: GoogleFonts.poppins(fontWeight: FontWeight.bold, color: Color(0xFF1A3D2B))),
        actions: [
          IconButton(icon: Icon(Icons.filter_list, color: Colors.green.shade700), onPressed: () {}),
        ],
      ),
      backgroundColor: const Color(0xFFF8FDF8),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              elevation: 2,
              child: ListTile(
                leading: Icon(Icons.calendar_today, color: Colors.green.shade700),
                title: Text('Monthly Calendar', style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
                subtitle: Text('Tap a date to see events', style: GoogleFonts.poppins(fontSize: 12)),
                trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.green.shade300),
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: ListView(
                children: [
                  _eventCard('Youth Halaqa Series', 'Main Hall', '2025-12-10 18:00'),
                  _eventCard('Eid Fundraiser', 'Community Room', '2025-12-15 19:30'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _eventCard(String title, String location, String dateTime) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: ListTile(
        leading: Icon(Icons.event, color: Colors.green.shade700, size: 28),
        title: Text(title, style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
        subtitle: Text('$location • $dateTime', style: GoogleFonts.poppins(fontSize: 13)),
        trailing: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.green.shade700),
          onPressed: () {},
          child: Text('RSVP', style: GoogleFonts.poppins(color: Colors.white)),
        ),
      ),
    );
  }
}
