import 'package:flutter/material.dart';

class SendUrgentAlertScreen extends StatefulWidget {
  const SendUrgentAlertScreen({super.key});

  @override
  State<SendUrgentAlertScreen> createState() => _SendUrgentAlertScreenState();
}

class _SendUrgentAlertScreenState extends State<SendUrgentAlertScreen> {
  final TextEditingController _messageCtrl = TextEditingController();

  @override
  void dispose() {
    _messageCtrl.dispose();
    super.dispose();
  }

  void _sendAlert() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (c) => AlertDialog(
        title: const Text('Confirm Alert'),
        content: const Text('Are you sure you want to send this urgent alert to the community?'),
        actions: [
          TextButton(onPressed: () => Navigator.of(c).pop(false), child: const Text('Cancel')),
          ElevatedButton(onPressed: () => Navigator.of(c).pop(true), child: const Text('Confirm & Send')),
        ],
      ),
    );

    if (!mounted) return;
    if (confirmed == true) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Urgent alert sent (demo)')));
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    final Color bg = isDark ? const Color(0xFF181818) : const Color(0xFFF8F8F8);
    final Color primary = const Color(0xFFD70000);

    return Scaffold(
      backgroundColor: bg,
      appBar: AppBar(
        backgroundColor: bg,
        elevation: 0,
        centerTitle: true,
        title: Text('Send Urgent Alert', style: TextStyle(color: isDark ? Colors.white : Colors.black)),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 4),
                    Text('Alert Message', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: isDark ? Colors.white : Colors.black)),
                    const SizedBox(height: 8),
                    Expanded(
                      child: TextField(
                        controller: _messageCtrl,
                        maxLines: null,
                        expands: true,
                        decoration: InputDecoration(
                          hintText: 'e.g., Janazah prayer for [Name] will be after Dhuhr prayer today.',
                          filled: true,
                          fillColor: isDark ? const Color(0xFF181818) : const Color(0xFFF8F8F8),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: isDark ? const Color(0xFF3A3A3A) : const Color(0xFFE0E0E0))),
                          contentPadding: const EdgeInsets.all(16),
                        ),
                        style: TextStyle(color: isDark ? Colors.white : Colors.black, fontSize: 16),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Text('${_messageCtrl.text.length}/300', style: TextStyle(color: isDark ? Colors.grey[400] : Colors.grey[600])),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
        child: SizedBox(
          height: 56,
          child: ElevatedButton.icon(
            onPressed: _sendAlert,
            icon: Icon(Icons.campaign, color: Colors.white),
            label: const Text('Send Alert', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            style: ElevatedButton.styleFrom(backgroundColor: primary, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
          ),
        ),
      ),
    );
  }
}
