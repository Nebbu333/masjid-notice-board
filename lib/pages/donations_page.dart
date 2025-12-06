import 'package:flutter/material.dart';
import '../utils/app_localizations.dart';
import '../utils/theme_provider.dart';
import '../utils/mock_data_localizer.dart';
import '../mock/mock_data.dart';
import '../models/donation.dart';
import 'donation_history_page.dart';
import 'donation_receipt_page.dart';

class DonationsPage extends StatefulWidget {
  final ThemeProvider? themeProvider;
  
  const DonationsPage({super.key, this.themeProvider});

  @override
  State<DonationsPage> createState() => _DonationsPageState();
}

class _DonationsPageState extends State<DonationsPage> {
  final _formKey = GlobalKey<FormState>();
  final _amountController = TextEditingController();
  final _noteController = TextEditingController();
  String? _selectedCategory;

  @override
  void dispose() {
    _amountController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context) ?? AppLocalizations(const Locale('en'));
    final categories = MockData.getDonationCategories();

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(localizations.donations),
          bottom: TabBar(
            tabs: [
              Tab(text: localizations.donateTab),
              Tab(text: localizations.historyTab),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildDonateTab(context, categories, localizations),
            DonationHistoryPage(),
          ],
        ),
      ),
    );
  }

  Widget _buildDonateTab(
    BuildContext context,
    List<DonationCategory> categories,
    AppLocalizations localizations,
  ) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              localizations.selectCategory,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 12),
            ...categories.map((category) {
              return Card(
                margin: const EdgeInsets.only(bottom: 12),
                child: RadioListTile<String>(
                  title: Text(MockDataLocalizer.localizeDonationCategory(category.name, localizations)),
                  subtitle: Text(MockDataLocalizer.localizeDonationCategoryDescription(category.description, localizations)),
                  value: category.id,
                  groupValue: _selectedCategory,
                  onChanged: (value) {
                    setState(() {
                      _selectedCategory = value;
                    });
                  },
                ),
              );
            }),
            const SizedBox(height: 24),
            Text(
              localizations.amount,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: localizations.enterAmount,
                prefixText: '\$ ',
                border: const OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return localizations.pleaseEnterAmount;
                }
                if (double.tryParse(value) == null || double.parse(value) <= 0) {
                  return localizations.pleaseEnterValidAmount;
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            Text(
              localizations.noteOptional,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _noteController,
              maxLines: 3,
              decoration: InputDecoration(
                labelText: localizations.addNote,
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),
            // Payment Method Selection (Dummy)
            Text(
              localizations.paymentMethod,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 12),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.credit_card),
                      title: Text(localizations.creditDebitCard),
                      trailing: Radio<String>(
                        value: 'card',
                        groupValue: 'card',
                        onChanged: (_) {},
                      ),
                    ),
                    const Divider(),
                    ListTile(
                      leading: const Icon(Icons.account_balance),
                      title: Text(localizations.bankTransfer),
                      trailing: Radio<String>(
                        value: 'bank',
                        groupValue: 'card',
                        onChanged: (_) {},
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            // Card Form (Dummy)
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: localizations.cardNumber,
                        hintText: localizations.cardNumberHint,
                        border: const OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: localizations.expiry,
                              hintText: localizations.expiryHint,
                              border: const OutlineInputBorder(),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: localizations.cvv,
                              hintText: localizations.cvvHint,
                              border: const OutlineInputBorder(),
                            ),
                            obscureText: true,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate() && _selectedCategory != null) {
                    // Show receipt
                    final donation = Donation(
                      id: DateTime.now().millisecondsSinceEpoch.toString(),
                      category: categories.firstWhere((c) => c.id == _selectedCategory).name,
                      amount: double.parse(_amountController.text),
                      date: DateTime.now(),
                      note: _noteController.text.isEmpty ? null : _noteController.text,
                      receiptNumber: 'REC-${DateTime.now().year}-${DateTime.now().millisecondsSinceEpoch.toString().substring(7)}',
                    );
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => DonationReceiptPage(donation: donation),
                      ),
                    );
                  } else if (_selectedCategory == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(localizations.pleaseSelectCategory)),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: Text(localizations.donate),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

