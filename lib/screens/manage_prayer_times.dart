import 'package:flutter/material.dart';

class ManagePrayerTimesScreen extends StatefulWidget {
  const ManagePrayerTimesScreen({super.key});

  @override
  State<ManagePrayerTimesScreen> createState() => _ManagePrayerTimesScreenState();
}

class _ManagePrayerTimesScreenState extends State<ManagePrayerTimesScreen> {
  // Store times for each prayer
  Map<String, String> athanTimes = {
    'Suhoor': 'Ends 04:30 AM',
    'Fajr': '04:45 AM',
    'Dhuhr': '01:30 PM',
    'Asr': '04:30 PM',
    'Maghrib': '06:30 PM',
    'Isha': '08:00 PM',
  };

  Map<String, String> iqamahTimes = {
    'Suhoor': '',
    'Fajr': '05:00 AM',
    'Dhuhr': '01:45 PM',
    'Asr': '04:45 PM',
    'Maghrib': '06:35 PM',
    'Isha': '08:15 PM',
  };

  Future<void> _pickTime(String prayer, bool isAthan) async {
    TimeOfDay initialTime = TimeOfDay.now();
    String currentTime = isAthan ? athanTimes[prayer]! : iqamahTimes[prayer]!;

    // Convert current string time to TimeOfDay
    if (currentTime.isNotEmpty) {
      final parts = currentTime.split(RegExp(r'[:\s]')); // e.g., 04:45 AM => ['04','45','AM']
      int hour = int.parse(parts[0]);
      int minute = int.parse(parts[1]);
      if (parts[2] == 'PM' && hour != 12) hour += 12;
      if (parts[2] == 'AM' && hour == 12) hour = 0;
      initialTime = TimeOfDay(hour: hour, minute: minute);
    }

    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: initialTime,
    );

    if (picked != null) {
      // ignore: use_build_context_synchronously
      final formattedTime = picked.format(context);
      setState(() {
        if (isAthan) {
          athanTimes[prayer] = formattedTime;
        } else {
          iqamahTimes[prayer] = formattedTime;
        }
      });
    }
  }

  Widget _timeTile(String label) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12.0),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark ? Colors.grey[900] : Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: const Color.fromRGBO(0, 0, 0, 0.03),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Athan', style: TextStyle(fontSize: 12, color: Colors.grey)),
                    const SizedBox(height: 6),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
                        backgroundColor: Theme.of(context).brightness == Brightness.dark ? Colors.grey[800] : Colors.grey[100],
                        elevation: 0,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                      onPressed: () => _pickTime(label, true),
                      child: Align(alignment: Alignment.centerLeft, child: Text(athanTimes[label]!, style: TextStyle(color: Theme.of(context).textTheme.bodyMedium?.color))),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Iqamah', style: TextStyle(fontSize: 12, color: Colors.grey)),
                    const SizedBox(height: 6),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
                        backgroundColor: Theme.of(context).brightness == Brightness.dark ? Colors.grey[800] : Colors.grey[100],
                        elevation: 0,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                      onPressed: () => _pickTime(label, false),
                      child: Align(alignment: Alignment.centerLeft, child: Text(iqamahTimes[label]!, style: TextStyle(color: Theme.of(context).textTheme.bodyMedium?.color))),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final prayers = ['Suhoor', 'Fajr', 'Dhuhr', 'Asr', 'Maghrib', 'Isha'];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Prayer Times'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          for (var prayer in prayers) _timeTile(prayer),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Prayer times published')),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF11D452),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
            child: const Text('Publish Changes', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}
