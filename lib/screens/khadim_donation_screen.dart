import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class KhadimDonationScreen extends StatelessWidget {
  const KhadimDonationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        title: Row(
          children: [
            Icon(Icons.volunteer_activism, color: Colors.green.shade700),
            const SizedBox(width: 10),
            Text('Donation Management', style: GoogleFonts.poppins(fontWeight: FontWeight.bold, color: Colors.green.shade900)),
          ],
        ),
      ),
      backgroundColor: const Color(0xFFF8FDF8),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
              elevation: 4,
              color: Colors.amber.shade100,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Total Donations', style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.green.shade900)),
                    const SizedBox(height: 8),
                    Text(' 3,200', style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 28, color: Colors.green.shade900)),
                    const SizedBox(height: 8),
                    Text('Fundraising Goal:  5,000', style: GoogleFonts.poppins(fontSize: 14, color: Colors.green.shade800)),
                    const SizedBox(height: 8),
                    LinearProgressIndicator(value: 0.64, color: Colors.amber, backgroundColor: Colors.amber.shade200),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 18),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green.shade700,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    icon: const Icon(Icons.add),
                    label: Text('Add Donation Update', style: GoogleFonts.poppins(color: Colors.white)),
                    onPressed: () {},
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: OutlinedButton.icon(
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.amber),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    icon: Icon(Icons.edit, color: Colors.amber),
                    label: Text('Edit Goal', style: GoogleFonts.poppins(color: Colors.amber)),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            const SizedBox(height: 18),
            Text('Donation Updates', style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.green.shade800)),
            const SizedBox(height: 8),
            Expanded(
              child: ListView(
                children: [
                  _donationUpdateCard('Eid Fundraiser', ' 2,000', '2025-12-01'),
                  _donationUpdateCard('Water Project', ' 1,200', '2025-11-20'),
                ],
              ),
            ),
            const SizedBox(height: 18),
            Text('Donors', style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.green.shade800)),
            const SizedBox(height: 8),
            SizedBox(
              height: 60,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _donorChip('Brother Ahmed'),
                  _donorChip('Sister Fatima'),
                  _donorChip('Anonymous'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _donationUpdateCard(String title, String amount, String date) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: ListTile(
        leading: Icon(Icons.volunteer_activism, color: Colors.amber, size: 28),
        title: Text(title, style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
        subtitle: Text('Amount: $amount\nDate: $date', style: GoogleFonts.poppins(fontSize: 12)),
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

  Widget _donorChip(String name) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 6),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.green.shade700.withOpacity(0.12),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.green.shade200),
      ),
      child: Row(
        children: [
          Icon(Icons.person, color: Colors.green.shade700, size: 18),
          const SizedBox(width: 6),
          Text(name, style: GoogleFonts.poppins(fontSize: 13, color: Colors.green.shade900)),
        ],
      ),
    );
  }
}
