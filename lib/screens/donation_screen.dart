import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DonationScreen extends StatelessWidget {
  const DonationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        title: Text(
          'Donate',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            color: Color(0xFF1A3D2B),
          ),
        ),
        actions: [Icon(Icons.receipt, color: Colors.green.shade700)],
      ),
      backgroundColor: const Color(0xFFF8FDF8),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              color: Colors.amber.shade100,
              child: ListTile(
                leading: Icon(
                  Icons.volunteer_activism,
                  color: Colors.amber,
                  size: 32,
                ),
                title: Text(
                  'Eid Charity Drive: \$2,500/\$5,000 Raised',
                  style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                ),
                subtitle: LinearProgressIndicator(
                  value: 0.5,
                  color: Colors.amber,
                  backgroundColor: Colors.amber.shade200,
                ),
              ),
            ),
            const SizedBox(height: 18),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _donateButton('Zakat', 25),
                _donateButton('Sadaqah', 10),
                _donateButton('Masjid Fund', 50),
                _donateButton('Custom', null),
              ],
            ),
            const SizedBox(height: 18),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              elevation: 2,
              child: ListTile(
                leading: Icon(Icons.payment, color: Colors.green.shade700),
                title: Text(
                  'Payment Method',
                  style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
                ),
                subtitle: Text(
                  'Credit Card, PayPal, Apple Pay, Google Pay',
                  style: GoogleFonts.poppins(fontSize: 12),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: Colors.green.shade300,
                ),
              ),
            ),
            const SizedBox(height: 18),
            Text(
              'Donation History',
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1A3D2B),
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView(
                children: [
                  _donationHistoryItem('Zakat', 25, '2025-12-01'),
                  _donationHistoryItem('Sadaqah', 10, '2025-11-20'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _donateButton(String label, int? amount) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green.shade700,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      onPressed: () {},
      child: Text(
        amount != null ? '$label\n$amount' : label,
        textAlign: TextAlign.center,
        style: GoogleFonts.poppins(color: Colors.white),
      ),
    );
  }

  Widget _donationHistoryItem(String type, int amount, String date) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: ListTile(
        leading: Icon(Icons.volunteer_activism, color: Colors.amber, size: 28),
        title: Text(
          '$type Donation',
          style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
        ),
        subtitle: Text(
          'Amount: $amount\nDate: $date',
          style: GoogleFonts.poppins(fontSize: 12),
        ),
        trailing: Icon(Icons.receipt, color: Colors.green.shade700),
      ),
    );
  }
}
