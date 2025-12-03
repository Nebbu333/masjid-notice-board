import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class KhutbahsScreen extends StatelessWidget {
  const KhutbahsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        title: Text('Khutbahs', style: GoogleFonts.poppins(fontWeight: FontWeight.bold, color: Color(0xFF1A3D2B))),
        actions: [
          IconButton(icon: Icon(Icons.search, color: Colors.green.shade700), onPressed: () {}),
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
                _sortTab('Most Recent', true),
                _sortTab('Most Popular', false),
                _sortTab('By Speaker', false),
              ],
            ),
            const SizedBox(height: 12),
            Expanded(
              child: ListView(
                children: [
                  _khutbahCard('Imam Zaid Shakir', 'Friday, Dec 5', 'Charity: The Heart of Islam'),
                  _khutbahCard('Imam Suhaib Webb', 'Friday, Nov 28', 'Patience in Difficult Times'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _sortTab(String label, bool selected) {
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

  Widget _khutbahCard(String speaker, String date, String title) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: ListTile(
        leading: Icon(Icons.menu_book, color: Colors.amber, size: 28),
        title: Text(title, style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
        subtitle: Text('$speaker • $date', style: GoogleFonts.poppins(fontSize: 13)),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(icon: Icon(Icons.article, color: Colors.green.shade700), onPressed: () {}),
            IconButton(icon: Icon(Icons.headphones, color: Colors.green.shade700), onPressed: () {}),
            IconButton(icon: Icon(Icons.play_circle, color: Colors.green.shade700), onPressed: () {}),
            IconButton(icon: Icon(Icons.download, color: Colors.amber), onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
