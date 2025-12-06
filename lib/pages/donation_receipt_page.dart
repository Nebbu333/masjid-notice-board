import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/donation.dart';

class DonationReceiptPage extends StatelessWidget {
  final Donation donation;

  const DonationReceiptPage({super.key, required this.donation});

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('MMMM dd, yyyy - hh:mm a');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Receipt'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Column(
                    children: [
                      const Icon(
                        Icons.check_circle,
                        color: Color(0xFF2D5016),
                        size: 64,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Thank You!',
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF2D5016),
                            ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Your donation has been received',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                ),
                const Divider(height: 32),
                _buildReceiptRow('Receipt Number', donation.receiptNumber ?? 'N/A'),
                _buildReceiptRow('Category', donation.category),
                _buildReceiptRow('Amount', '\$${donation.amount.toStringAsFixed(2)}'),
                _buildReceiptRow('Date', dateFormat.format(donation.date)),
                if (donation.note != null && donation.note!.isNotEmpty)
                  _buildReceiptRow('Note', donation.note!),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // Dummy print/share functionality
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Receipt saved (dummy)')),
                      );
                    },
                    icon: const Icon(Icons.print),
                    label: const Text('Print/Share Receipt'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildReceiptRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}

