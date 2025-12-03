import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FeedbackScreen extends StatelessWidget {
  const FeedbackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        title: Text('Feedback & Suggestions', style: GoogleFonts.poppins(fontWeight: FontWeight.bold, color: Color(0xFF1A3D2B))),
      ),
      backgroundColor: const Color(0xFFF8FDF8),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Submit Suggestion', style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xFF1A3D2B))),
            const SizedBox(height: 12),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'Subject',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                filled: true,
                fillColor: Colors.white,
              ),
              items: const [
                DropdownMenuItem(value: 'Khutbah Topics', child: Text('Khutbah Topics')),
                DropdownMenuItem(value: 'Prayer Timings', child: Text('Prayer Timings')),
                DropdownMenuItem(value: 'Facilities', child: Text('Facilities')),
              ],
              onChanged: (v) {},
            ),
            const SizedBox(height: 12),
            TextField(
              maxLines: 3,
              decoration: InputDecoration(
                labelText: 'Description',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.shade700,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: () {},
                child: Text('Send', style: GoogleFonts.poppins(fontWeight: FontWeight.w600, color: Colors.white)),
              ),
            ),
            const SizedBox(height: 24),
            Text('Active Polls', style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xFF1A3D2B))),
            const SizedBox(height: 8),
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
              elevation: 2,
              child: ListTile(
                title: Text('Which topic for next khutbah?', style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
                subtitle: Text('A) Gratitude  B) Patience  C) Charity', style: GoogleFonts.poppins(fontSize: 13)),
                trailing: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green.shade700),
                  onPressed: () {},
                  child: Text('Vote', style: GoogleFonts.poppins(color: Colors.white)),
                ),
              ),
            ),
            const SizedBox(height: 18),
            Text('Rate Your Experience', style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xFF1A3D2B))),
            Row(
              children: [
                Icon(Icons.star, color: Colors.amber),
                Icon(Icons.star, color: Colors.amber),
                Icon(Icons.star, color: Colors.amber),
                Icon(Icons.star_border, color: Colors.amber),
                Icon(Icons.star_border, color: Colors.amber),
                const SizedBox(width: 12),
                Text('3/5', style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 12),
            TextField(
              decoration: InputDecoration(
                labelText: 'Comment',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.shade700,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: () {},
                child: Text('Submit', style: GoogleFonts.poppins(fontWeight: FontWeight.w600, color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
