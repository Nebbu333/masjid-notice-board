import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../utils/app_localizations.dart';
import '../utils/mock_data_localizer.dart';
import '../mock/mock_data.dart';
import 'donation_receipt_page.dart';

class DonationHistoryPage extends StatelessWidget {
  const DonationHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context) ?? AppLocalizations(const Locale('en'));
    final donations = MockData.getDonationHistory();
    final dateFormat = DateFormat('MMM dd, yyyy');

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: donations.length,
      itemBuilder: (context, index) {
        final donation = donations[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          child: ListTile(
            leading: const Icon(Icons.favorite, color: Color(0xFF2D5016)),
            title: Text(MockDataLocalizer.localizeDonationCategory(donation.category, localizations)),
            subtitle: Text(dateFormat.format(donation.date)),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '\$${donation.amount.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                if (donation.receiptNumber != null)
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => DonationReceiptPage(donation: donation),
                        ),
                      );
                    },
                    child: Text(
                      localizations.receipt,
                      style: const TextStyle(fontSize: 12),
                    ),
                  ),
              ],
            ),
            isThreeLine: false,
          ),
        );
      },
    );
  }
}

