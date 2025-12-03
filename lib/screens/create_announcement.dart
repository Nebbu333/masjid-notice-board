import 'package:flutter/material.dart';

class CreateAnnouncementScreen extends StatefulWidget {
  const CreateAnnouncementScreen({super.key});

  @override
  State<CreateAnnouncementScreen> createState() => _CreateAnnouncementScreenState();
}

class _CreateAnnouncementScreenState extends State<CreateAnnouncementScreen> {
  final TextEditingController _titleCtrl = TextEditingController();
  final TextEditingController _contentCtrl = TextEditingController();
  final TextEditingController _refCtrl = TextEditingController();
  final TextEditingController _textCtrl = TextEditingController();
  bool _schedule = false;
  String _reminderType = 'Ayah';
  String _category = 'General';

  @override
  void dispose() {
    _titleCtrl.dispose();
    _contentCtrl.dispose();
    _refCtrl.dispose();
    _textCtrl.dispose();
    super.dispose();
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
        leading: TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Cancel', style: TextStyle(color: isDark ? const Color(0xFF11D452) : const Color(0xFF11D452))),
        ),
        title: Text('New Announcement', style: TextStyle(color: isDark ? Colors.white : Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () => _postNow(),
            child: Text('Post', style: TextStyle(color: isDark ? const Color(0xFF11D452) : const Color(0xFF11D452), fontWeight: FontWeight.bold)),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _label('Title', isDark),
              const SizedBox(height: 6),
              _buildInput(controller: _titleCtrl, hint: 'e.g., Friday Khutbah Topic', isDark: isDark),
              const SizedBox(height: 12),

              _label('Content', isDark),
              const SizedBox(height: 6),
              _buildMultiline(controller: _contentCtrl, hint: 'Write your announcement details here...', isDark: isDark, minLines: 6),
              const SizedBox(height: 12),

              _sectionTitle('Add a Hadith or Ayah', isDark),
              const SizedBox(height: 8),
              _segmented([ 'Ayah', 'Hadith' ], _reminderType, (v) => setState(() => _reminderType = v), isDark),
              const SizedBox(height: 12),
              _label('Reference', isDark),
              const SizedBox(height: 6),
              _buildInput(controller: _refCtrl, hint: 'e.g., Quran 2:183', isDark: isDark, fillColor: isDark ? const Color(0xFF1A1A1A) : const Color(0xFFF9F9F9)),
              const SizedBox(height: 12),
              _label('Text', isDark),
              const SizedBox(height: 6),
              _buildMultiline(controller: _textCtrl, hint: 'Enter the text of the Ayah or Hadith...', isDark: isDark, minLines: 3, fillColor: isDark ? const Color(0xFF1A1A1A) : const Color(0xFFF9F9F9)),

              const SizedBox(height: 12),
              _sectionTitle('Category', isDark),
              const SizedBox(height: 8),
              _segmented([ 'General','Khutbah','Class' ], _category, (v) => setState(() => _category = v), isDark),

              const SizedBox(height: 12),
              _sectionTitle('Publishing Options', isDark),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Schedule for later', style: TextStyle(color: isDark ? Colors.white : Colors.black, fontWeight: FontWeight.w600)),
                  SwitchTheme(
                    data: SwitchThemeData(
                      thumbColor: WidgetStateProperty.all(primary),
                      trackColor: WidgetStateProperty.resolveWith((states) => const Color.fromRGBO(17, 212, 82, 0.4)),
                    ),
                    child: Switch(value: _schedule, onChanged: (v) => setState(() => _schedule = v)),
                  ),
                ],
              ),

              if (_schedule)
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Publish Date', style: TextStyle(color: isDark ? Colors.white70 : Colors.black54)),
                      TextButton(onPressed: () {}, child: const Text('Pick Date')),
                    ],
                  ),
                ),
              const SizedBox(height: 80),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.all(12),
        color: bg,
        child: SizedBox(
          width: double.infinity,
          height: 56,
          child: ElevatedButton(
            onPressed: () => _postNow(),
            style: ElevatedButton.styleFrom(backgroundColor: primary, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
            child: const Text('Post Now', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ),
      ),
    );
  }

  Widget _label(String text, bool isDark) => Text(text, style: TextStyle(color: isDark ? Colors.white : Colors.black, fontWeight: FontWeight.w600));

  Widget _sectionTitle(String text, bool isDark) => Padding(padding: const EdgeInsets.only(top: 8.0, bottom: 4.0), child: Text(text, style: TextStyle(color: isDark ? Colors.white : Colors.black, fontSize: 16, fontWeight: FontWeight.bold)));

  Widget _buildInput({required TextEditingController controller, required String hint, required bool isDark, Color? fillColor}) => TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hint,
          filled: true,
            fillColor: fillColor ?? (isDark ? const Color.fromRGBO(255, 255, 255, 0.02) : Colors.white),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: isDark ? Colors.white10 : Colors.grey.shade200)),
          contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        ),
      );

  Widget _buildMultiline({required TextEditingController controller, required String hint, required bool isDark, int minLines = 4, Color? fillColor}) => TextField(
        controller: controller,
        minLines: minLines,
        maxLines: null,
        decoration: InputDecoration(
          hintText: hint,
          filled: true,
            fillColor: fillColor ?? (isDark ? const Color.fromRGBO(255, 255, 255, 0.02) : Colors.white),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: isDark ? Colors.white10 : Colors.grey.shade200)),
          contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        ),
      );

  Widget _segmented(List<String> options, String value, ValueChanged<String> onChanged, bool isDark) {
    return Row(
      children: options.map((opt) {
        final bool sel = opt == value;
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: GestureDetector(
              onTap: () => onChanged(opt),
              child: Container(
                height: 44,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: sel ? (isDark ? const Color(0xFF1A1A1A) : const Color(0xFFFFFFFF)) : (isDark ? const Color(0xFF1A1A1A) : const Color(0xFFF9F9F9)),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: sel ? const Color(0xFF11D452) : (isDark ? Colors.white10 : Colors.grey.shade200)),
                ),
                child: Text(opt, style: TextStyle(color: isDark ? Colors.white : Colors.black)),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  void _postNow() {
    // Placeholder: implement save/publish logic
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Posted (demo)')));
    Navigator.pop(context);
  }
}
