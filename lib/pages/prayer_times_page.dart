import 'package:flutter/material.dart';
import '../utils/app_localizations.dart';
import '../utils/theme_provider.dart';
import '../mock/mock_data.dart';
import '../models/prayer_time.dart';

class PrayerTimesPage extends StatefulWidget {
  final ThemeProvider? themeProvider;
  
  const PrayerTimesPage({super.key, this.themeProvider});

  @override
  State<PrayerTimesPage> createState() => _PrayerTimesPageState();
}

class _PrayerTimesPageState extends State<PrayerTimesPage> {
  List<PrayerTime> _prayerTimes = [];
  String? _selectedLocation;
  List<String> _locations = [];

  @override
  void initState() {
    super.initState();
    _prayerTimes = MockData.getPrayerTimes();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final localizations = AppLocalizations.of(context) ?? AppLocalizations(const Locale('en'));
    final newLocations = [
      localizations.currentLocation,
      localizations.downtownMasjid,
      localizations.northBranch,
      localizations.southBranch,
    ];
    if (_locations.isEmpty || _locations != newLocations) {
      setState(() {
        final currentIndex = _locations.isEmpty ? 0 : _locations.indexOf(_selectedLocation ?? '');
        _locations = newLocations;
        _selectedLocation = currentIndex >= 0 && currentIndex < newLocations.length
            ? newLocations[currentIndex]
            : newLocations[0];
      });
    }
  }

  void _toggleReminder(int index) {
    setState(() {
      _prayerTimes[index] = _prayerTimes[index].copyWith(
        reminderEnabled: !_prayerTimes[index].reminderEnabled,
      );
    });
  }

  void _adjustTime(int index, int minutes) {
    setState(() {
      final currentAdjustment = _prayerTimes[index].adjustmentMinutes;
      _prayerTimes[index] = _prayerTimes[index].copyWith(
        adjustmentMinutes: currentAdjustment + minutes,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context) ?? AppLocalizations(const Locale('en'));

    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.prayerTimes),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Location Selector
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      localizations.location,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 8),
                    DropdownButton<String>(
                      value: _selectedLocation,
                      isExpanded: true,
                      items: _locations.map((location) {
                        return DropdownMenuItem(
                          value: location,
                          child: Text(location),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedLocation = value!;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Prayer Times List
            ...List.generate(_prayerTimes.length, (index) {
              final prayer = _prayerTimes[index];
              return _buildPrayerTimeCard(context, prayer, index, localizations);
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildPrayerTimeCard(
    BuildContext context,
    PrayerTime prayer,
    int index,
    AppLocalizations localizations,
  ) {
    // Calculate adjusted time (simplified)
    final timeParts = prayer.time.split(':');
    final hours = int.parse(timeParts[0]);
    final minutes = int.parse(timeParts[1]);
    final adjustedMinutes = minutes + prayer.adjustmentMinutes;
    final displayHours = (hours + (adjustedMinutes ~/ 60)) % 24;
    final displayMinutes = adjustedMinutes % 60;
    final displayTime = '${displayHours.toString().padLeft(2, '0')}:${displayMinutes.toString().padLeft(2, '0')}';

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _getPrayerName(prayer.name, localizations),
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      displayTime,
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                            color: const Color(0xFF2D5016),
                          ),
                    ),
                    if (prayer.adjustmentMinutes != 0)
                      Text(
                        '${localizations.adjustedBy} ${prayer.adjustmentMinutes > 0 ? '+' : ''}${prayer.adjustmentMinutes} ${localizations.min}',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[600],
                        ),
                      ),
                  ],
                ),
                Switch(
                  value: prayer.reminderEnabled,
                  onChanged: (_) => _toggleReminder(index),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton.icon(
                  onPressed: () => _adjustTime(index, -5),
                  icon: const Icon(Icons.remove),
                  label: Text('-5 ${localizations.min}'),
                ),
                Text(
                  localizations.adjustTime,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                TextButton.icon(
                  onPressed: () => _adjustTime(index, 5),
                  icon: const Icon(Icons.add),
                  label: Text('+5 ${localizations.min}'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _getPrayerName(String name, AppLocalizations localizations) {
    switch (name.toLowerCase()) {
      case 'fajr':
        return localizations.fajr;
      case 'dhuhr':
        return localizations.dhuhr;
      case 'asr':
        return localizations.asr;
      case 'maghrib':
        return localizations.maghrib;
      case 'isha':
        return localizations.isha;
      default:
        return name;
    }
  }
}

