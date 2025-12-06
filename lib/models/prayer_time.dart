class PrayerTime {
  final String name;
  final String time;
  final bool reminderEnabled;
  final int adjustmentMinutes;

  PrayerTime({
    required this.name,
    required this.time,
    this.reminderEnabled = true,
    this.adjustmentMinutes = 0,
  });

  PrayerTime copyWith({
    String? name,
    String? time,
    bool? reminderEnabled,
    int? adjustmentMinutes,
  }) {
    return PrayerTime(
      name: name ?? this.name,
      time: time ?? this.time,
      reminderEnabled: reminderEnabled ?? this.reminderEnabled,
      adjustmentMinutes: adjustmentMinutes ?? this.adjustmentMinutes,
    );
  }
}

