import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../utils/app_localizations.dart';
import '../utils/mock_data_localizer.dart';
import '../mock/mock_data.dart';
import '../models/masjid_report.dart';
import '../models/donation.dart';

class ReportsPage extends StatelessWidget {
  const ReportsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context) ?? AppLocalizations(const Locale('en'));
    final reports = MockData.getMasjidReports();
    final donations = MockData.getDonationHistory();

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(localizations.reports),
          bottom: TabBar(
            tabs: [
              Tab(text: localizations.financial),
              Tab(text: localizations.projects),
              Tab(text: localizations.donations),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildFinancialTab(context, reports, localizations),
            _buildProjectsTab(context, reports, localizations),
            _buildDonationsTab(context, donations, localizations),
          ],
        ),
      ),
    );
  }

  Widget _buildFinancialTab(
    BuildContext context,
    List<MasjidReport> reports,
    AppLocalizations localizations,
  ) {
    final financialReports = reports.where((r) => r.type == 'financial').toList();
    final dateFormat = DateFormat('MMM dd, yyyy');

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: financialReports.length,
      itemBuilder: (context, index) {
        final report = financialReports[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 16),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        MockDataLocalizer.localizeReportTitle(report.title, localizations),
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                    if (report.amount != null)
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: const Color(0xFF2D5016),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          '\$${report.amount!.toStringAsFixed(2)}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  report.description,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.calendar_today, size: 16, color: Colors.grey[600]),
                    const SizedBox(width: 4),
                    Text(
                      dateFormat.format(report.date),
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    ),
                    if (report.category != null) ...[
                      const SizedBox(width: 16),
                      Chip(
                        label: Text(MockDataLocalizer.localizeCategory(report.category, localizations)),
                        labelStyle: const TextStyle(fontSize: 12),
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildProjectsTab(
    BuildContext context,
    List<MasjidReport> reports,
    AppLocalizations localizations,
  ) {
    final projectReports = reports.where((r) => r.type == 'project').toList();
    final dateFormat = DateFormat('MMM dd, yyyy');

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: projectReports.length,
      itemBuilder: (context, index) {
        final report = projectReports[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 16),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  MockDataLocalizer.localizeReportTitle(report.title, localizations),
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 8),
                Text(
                  MockDataLocalizer.localizeReportDescription(report.description, localizations),
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.calendar_today, size: 16, color: Colors.grey[600]),
                    const SizedBox(width: 4),
                    Text(
                      dateFormat.format(report.date),
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildDonationsTab(
    BuildContext context,
    List<Donation> donations,
    AppLocalizations localizations,
  ) {
    final dateFormat = DateFormat('MMM dd, yyyy');
    double totalDonations = 0;
    for (var donation in donations) {
      totalDonations += donation.amount;
    }

    return Column(
      children: [
        Card(
          margin: const EdgeInsets.all(16),
          color: const Color(0xFF2D5016),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                Text(
                  localizations.totalDonations,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '\$${totalDonations.toStringAsFixed(2)}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: donations.length,
            itemBuilder: (context, index) {
              final donation = donations[index];
              return Card(
                margin: const EdgeInsets.only(bottom: 12),
                child: ListTile(
                  title: Text(MockDataLocalizer.localizeDonationCategory(donation.category, localizations)),
                  subtitle: Text(dateFormat.format(donation.date)),
                  trailing: Text(
                    '\$${donation.amount.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

