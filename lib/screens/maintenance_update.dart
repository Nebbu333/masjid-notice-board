import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MaintenanceUpdateScreen extends StatelessWidget {
  const MaintenanceUpdateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        title: Row(
          children: [
            Icon(Icons.build, color: Colors.green.shade700),
            const SizedBox(width: 10),
            Text('Maintenance Updates', style: GoogleFonts.poppins(fontWeight: FontWeight.bold, color: Colors.green.shade900)),
          ],
        ),
      ),
      backgroundColor: const Color(0xFFF8FDF8),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Post Maintenance Update', style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.green.shade800)),
            const SizedBox(height: 12),
            TextField(
              decoration: InputDecoration(
                labelText: 'Issue Title',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                filled: true,
                fillColor: Colors.white,
              ),
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
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      labelText: 'Priority',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    items: const [
                      DropdownMenuItem(value: 'High', child: Text('High')),
                      DropdownMenuItem(value: 'Medium', child: Text('Medium')),
                      DropdownMenuItem(value: 'Low', child: Text('Low')),
                    ],
                    onChanged: (v) {},
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Date',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 18),
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
            const SizedBox(height: 24),
            Text('Existing Updates', style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.green.shade800)),
            const SizedBox(height: 8),
            Expanded(
              child: ListView(
                children: [
                  _updateCard('Water Issue', 'Low pressure in wudu area', 'High', '2025-12-04'),
                  _updateCard('Electricity', 'Lights flickering in main hall', 'Medium', '2025-12-03'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _updateCard(String title, String desc, String priority, String date) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: ListTile(
        title: Text(title, style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
        subtitle: Text('$desc\nPriority: $priority\nDate: $date', style: GoogleFonts.poppins(fontSize: 12)),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(icon: Icon(Icons.edit, color: Colors.green.shade700), onPressed: () {}),
            IconButton(icon: Icon(Icons.delete, color: Colors.red.shade400), onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
