import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../utils/app_localizations.dart';
import '../mock/mock_data.dart';
import '../models/feedback.dart' as feedback_models;

class FeedbackPage extends StatefulWidget {
  const FeedbackPage({super.key});

  @override
  State<FeedbackPage> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
  String? _selectedCategory;

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context) ?? AppLocalizations(const Locale('en'));
    final feedbackHistory = MockData.getFeedbackHistory();
    final polls = MockData.getPolls();

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(localizations.feedback),
          bottom: TabBar(
            tabs: [
              Tab(text: localizations.submitTab),
              Tab(text: localizations.historyTab),
              Tab(text: localizations.pollsTab),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildSubmitTab(context, localizations),
            _buildHistoryTab(context, feedbackHistory),
            _buildPollsTab(context, polls),
          ],
        ),
      ),
    );
  }

  Widget _buildSubmitTab(BuildContext context, AppLocalizations localizations) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              localizations.selectCategory,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              value: _selectedCategory,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
              hint: Text(localizations.selectCategoryHint),
              items: [
                DropdownMenuItem(value: 'Improvement', child: Text(localizations.improvement)),
                DropdownMenuItem(value: 'Infrastructure', child: Text(localizations.infrastructure)),
                DropdownMenuItem(value: 'Services', child: Text(localizations.services)),
                DropdownMenuItem(value: 'Other', child: Text(localizations.other)),
              ],
              onChanged: (value) {
                setState(() {
                  _selectedCategory = value;
                });
              },
            ),
            const SizedBox(height: 24),
            TextFormField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: localizations.titleLabel,
                border: const OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return localizations.pleaseEnterTitle;
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _contentController,
              maxLines: 6,
              decoration: InputDecoration(
                labelText: localizations.yourSuggestion,
                border: const OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return localizations.pleaseEnterFeedback;
                }
                return null;
              },
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate() && _selectedCategory != null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(localizations.feedbackSubmitted)),
                    );
                    _titleController.clear();
                    _contentController.clear();
                    setState(() {
                      _selectedCategory = null;
                    });
                  } else if (_selectedCategory == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(localizations.pleaseSelectCategory)),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: Text(localizations.submit),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHistoryTab(BuildContext context, List<feedback_models.FeedbackItem> feedbackHistory) {
    final dateFormat = DateFormat('MMM dd, yyyy');

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: feedbackHistory.length,
      itemBuilder: (context, index) {
        final feedback = feedbackHistory[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 16),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        feedback.title,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                    if (feedback.category != null)
                      Chip(
                        label: Text(feedback.category!),
                        labelStyle: const TextStyle(fontSize: 12),
                      ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  feedback.content,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 8),
                Text(
                  dateFormat.format(feedback.date),
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildPollsTab(BuildContext context, List<feedback_models.Poll> polls) {
    final localizations = AppLocalizations.of(context) ?? AppLocalizations(const Locale('en'));
    final dateFormat = DateFormat('MMM dd, yyyy');

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: polls.length,
      itemBuilder: (context, index) {
        final poll = polls[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 16),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  poll.question,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 8),
                Text(
                  dateFormat.format(poll.date),
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 16),
                ...poll.options.map((option) {
                  final voteCount = poll.votes[option] ?? 0;
                  final totalVotes = poll.votes.values.fold(0, (sum, count) => sum + count);
                  final percentage = totalVotes > 0 ? (voteCount / totalVotes * 100) : 0.0;

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(option),
                            ),
                            Text(
                              '$voteCount ${localizations.votes} (${percentage.toStringAsFixed(1)}%)',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        LinearProgressIndicator(
                          value: totalVotes > 0 ? voteCount / totalVotes : 0,
                          backgroundColor: Colors.grey[300],
                          valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF2D5016)),
                        ),
                      ],
                    ),
                  );
                }),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text(poll.question),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: poll.options.map((option) {
                              return RadioListTile<String>(
                                title: Text(option),
                                value: option,
                                groupValue: null,
                                onChanged: (value) {
                                  Navigator.pop(context);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('Vote submitted for: $option (dummy)')),
                                  );
                                },
                              );
                            }).toList(),
                          ),
                        ),
                      );
                    },
                    child: const Text('Vote'),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

