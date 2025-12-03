import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CommunityBoardScreen extends StatelessWidget {
  const CommunityBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        title: Text('Community Board', style: GoogleFonts.poppins(fontWeight: FontWeight.bold, color: Color(0xFF1A3D2B))),
        actions: [
          IconButton(icon: Icon(Icons.add, color: Colors.green.shade700), onPressed: () {}),
        ],
      ),
      backgroundColor: const Color(0xFFF8FDF8),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _categoryTab('Lost & Found', true),
                _categoryTab('Volunteering', false),
                _categoryTab('Requests', false),
                _categoryTab('General', false),
              ],
            ),
            const SizedBox(height: 12),
            Expanded(
              child: ListView(
                children: [
                  _communityPost('Brother Ahmed', 'Lost & Found', 'Lost keys near masjid entrance', '2h ago', true),
                  _communityPost('Sister Fatima', 'Volunteering', 'Help needed for Friday setup', 'Yesterday', false),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _categoryTab(String label, bool selected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: selected ? Colors.green.shade700 : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.green.shade200),
      ),
      child: Text(label, style: GoogleFonts.poppins(color: selected ? Colors.white : Colors.green.shade700)),
    );
  }

  Widget _communityPost(String author, String category, String title, String time, bool pending) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: ListTile(
        leading: Icon(Icons.groups, color: Colors.green.shade700, size: 28),
        title: Text(title, style: GoogleFonts.poppins(fontWeight: FontWeight.w500)),
        subtitle: Text('$author • $category • $time', style: GoogleFonts.poppins(fontSize: 12)),
        trailing: pending
            ? Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text('Pending Approval', style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)),
              )
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.thumb_up, color: Colors.green.shade700, size: 18),
                  const SizedBox(width: 4),
                  Text('12', style: GoogleFonts.poppins(fontSize: 12)),
                ],
              ),
      ),
    );
  }
}
