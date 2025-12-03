import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PrayerTimesScreen extends StatelessWidget {
  const PrayerTimesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        title: Text('Prayer Times', style: GoogleFonts.poppins(fontWeight: FontWeight.bold, color: Color(0xFF1A3D2B))),
        actions: [
          IconButton(icon: Icon(Icons.location_on, color: Colors.green.shade700), onPressed: () {}),
        ],
      ),
      backgroundColor: const Color(0xFFF8FDF8),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              color: Colors.green.shade700,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Thursday, December 4, 2025', style: GoogleFonts.poppins(color: Colors.white)),
                    const SizedBox(height: 8),
                    Text('Next: Dhuhr in 1h 23m', style: GoogleFonts.poppins(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 18),
            _prayerRow('Fajr', '05:12 AM', true),
            _prayerRow('Dhuhr', '12:45 PM', false),
            _prayerRow('Asr', '04:15 PM', false),
            _prayerRow('Maghrib', '06:30 PM', false),
            _prayerRow('Isha', '08:00 PM', false),
            const SizedBox(height: 18),
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
              elevation: 2,
              child: ListTile(
                leading: Icon(Icons.settings, color: Colors.green.shade700),
                title: Text('Prayer Settings', style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
                subtitle: Text('Auto-adjust for DST, notification sound, reminders', style: GoogleFonts.poppins(fontSize: 12)),
                trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.green.shade300),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _prayerRow(String name, String time, bool next) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        children: [
          Icon(Icons.access_time, color: next ? Colors.amber : Colors.green.shade700),
          const SizedBox(width: 12),
          Text(name, style: GoogleFonts.poppins(fontWeight: FontWeight.w600, color: Colors.green.shade900)),
          const Spacer(),
          Text(time, style: GoogleFonts.poppins(fontWeight: FontWeight.w500)),
          const SizedBox(width: 12),
          Checkbox(value: next, onChanged: (v) {}),
        ],
      ),
    );
  }
}
