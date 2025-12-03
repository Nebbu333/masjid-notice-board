import 'package:flutter/material.dart';

class CreateEventScreen extends StatefulWidget {
  const CreateEventScreen({super.key});

  @override
  State<CreateEventScreen> createState() => _CreateEventScreenState();
}

class _CreateEventScreenState extends State<CreateEventScreen> {
  final TextEditingController _nameCtrl = TextEditingController();
  final TextEditingController _dateCtrl = TextEditingController();
  final TextEditingController _startCtrl = TextEditingController();
  final TextEditingController _endCtrl = TextEditingController();
  final TextEditingController _locationCtrl = TextEditingController();
  final TextEditingController _descCtrl = TextEditingController();

  @override
  void dispose() {
    _nameCtrl.dispose();
    _dateCtrl.dispose();
    _startCtrl.dispose();
    _endCtrl.dispose();
    _locationCtrl.dispose();
    _descCtrl.dispose();
    super.dispose();
  }

  void _createEvent() {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Event created (demo)')));
    Navigator.of(context).pop();
  }

  InputDecoration _dec({required String hint, required bool isDark, Widget? suffix}) {
    return InputDecoration(
      hintText: hint,
      filled: true,
      fillColor: isDark ? const Color(0xFF1A3625) : const Color(0xFFF8FCF9),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: isDark ? const Color(0xFF2A4D36) : const Color(0xFFCFE7D7))),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      suffixIcon: suffix,
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    final Color bg = isDark ? const Color(0xFF102216) : const Color(0xFFF6F8F6);
    final Color primary = const Color(0xFF11D452);

    return Scaffold(
      backgroundColor: bg,
      appBar: AppBar(
        backgroundColor: bg,
        elevation: 0,
        title: Text('Create Event', style: TextStyle(color: isDark ? Colors.white : Colors.black)),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              Text('Event Name', style: TextStyle(fontWeight: FontWeight.w600, color: isDark ? Colors.white : Colors.black)),
              const SizedBox(height: 8),
              TextField(controller: _nameCtrl, decoration: _dec(hint: 'e.g., Eid al-Fitr Prayer', isDark: isDark)),
              const SizedBox(height: 16),

              Text('Date', style: TextStyle(fontWeight: FontWeight.w600, color: isDark ? Colors.white : Colors.black)),
              const SizedBox(height: 8),
              TextField(controller: _dateCtrl, decoration: _dec(hint: 'Select date', isDark: isDark), readOnly: true),
              const SizedBox(height: 16),

              Row(
                children: [
                  Expanded(
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Text('Start Time', style: TextStyle(fontWeight: FontWeight.w600, color: isDark ? Colors.white : Colors.black)),
                      const SizedBox(height: 8),
                      TextField(controller: _startCtrl, decoration: _dec(hint: 'Select time', isDark: isDark), readOnly: true),
                    ]),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Text('End Time', style: TextStyle(fontWeight: FontWeight.w600, color: isDark ? Colors.white : Colors.black)),
                      const SizedBox(height: 8),
                      TextField(controller: _endCtrl, decoration: _dec(hint: 'Select time', isDark: isDark), readOnly: true),
                    ]),
                  ),
                ],
              ),

              const SizedBox(height: 16),
              Text('Location', style: TextStyle(fontWeight: FontWeight.w600, color: isDark ? Colors.white : Colors.black)),
              const SizedBox(height: 8),
              TextField(controller: _locationCtrl, decoration: _dec(hint: 'e.g., Main Prayer Hall', isDark: isDark), readOnly: false),

              const SizedBox(height: 16),
              Text('Description', style: TextStyle(fontWeight: FontWeight.w600, color: isDark ? Colors.white : Colors.black)),
              const SizedBox(height: 8),
              TextField(controller: _descCtrl, decoration: _dec(hint: 'Add details about the event...', isDark: isDark), maxLines: 5),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
        child: SizedBox(
          height: 56,
          child: ElevatedButton(
            onPressed: _createEvent,
            style: ElevatedButton.styleFrom(backgroundColor: primary, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
            child: const Text('Create Event', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          ),
        ),
      ),
    );
  }
}
