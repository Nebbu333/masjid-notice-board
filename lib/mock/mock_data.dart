import '../models/announcement.dart';
import '../models/khutbah.dart';
import '../models/prayer_time.dart';
import '../models/masjid_report.dart';
import '../models/event.dart';
import '../models/donation.dart';
import '../models/community_post.dart';
import '../models/feedback.dart' as feedback_models;

class MockData {
  // Announcements
  static List<Announcement> getAnnouncements() {
    return [
      Announcement(
        id: '1',
        title: 'Ramadan Schedule Update',
        description: 'The masjid will be open for Taraweeh prayers starting from tomorrow. Please arrive 10 minutes early.',
        date: DateTime.now().subtract(const Duration(days: 1)),
        isUrgent: true,
      ),
      Announcement(
        id: '2',
        title: 'Community Iftar This Friday',
        description: 'Join us for a community iftar this Friday after Maghrib prayer. All are welcome.',
        date: DateTime.now().subtract(const Duration(days: 3)),
        isUrgent: false,
      ),
      Announcement(
        id: '3',
        title: 'Quran Study Circle',
        description: 'Weekly Quran study circle every Sunday at 6 PM. Beginners welcome.',
        date: DateTime.now().subtract(const Duration(days: 5)),
        isUrgent: false,
      ),
    ];
  }

  // Khutbahs
  static List<Khutbah> getKhutbahs() {
    return [
      Khutbah(
        id: '1',
        title: 'The Importance of Patience',
        date: DateTime.now().subtract(const Duration(days: 7)),
        content: '''
In the name of Allah, the Most Gracious, the Most Merciful.

Patience (Sabr) is one of the greatest virtues in Islam. It is mentioned numerous times in the Quran and Hadith. The Prophet Muhammad (peace be upon him) said: "Patience is light."

Patience comes in three forms:
1. Patience in obedience to Allah
2. Patience in avoiding sin
3. Patience during trials and tribulations

Allah says in the Quran: "And be patient, for indeed, Allah does not allow to be lost the reward of those who do good." (Quran 11:115)

May Allah grant us all the strength to practice patience in all aspects of our lives.
        ''',
        audioUrl: 'placeholder_audio.mp3',
        videoUrl: 'placeholder_video.mp4',
      ),
      Khutbah(
        id: '2',
        title: 'Gratitude and Thankfulness',
        date: DateTime.now().subtract(const Duration(days: 14)),
        content: '''
In the name of Allah, the Most Gracious, the Most Merciful.

Gratitude is a fundamental aspect of faith. We must be grateful to Allah for all His blessings, both big and small.

Allah says: "If you are grateful, I will surely increase you in favor." (Quran 14:7)

Let us count our blessings and express gratitude through our words and actions.
        ''',
        audioUrl: 'placeholder_audio.mp3',
      ),
    ];
  }

  // Prayer Times
  static List<PrayerTime> getPrayerTimes() {
    return [
      PrayerTime(name: 'Fajr', time: '05:30', reminderEnabled: true),
      PrayerTime(name: 'Dhuhr', time: '12:45', reminderEnabled: true),
      PrayerTime(name: 'Asr', time: '16:20', reminderEnabled: true),
      PrayerTime(name: 'Maghrib', time: '19:05', reminderEnabled: true),
      PrayerTime(name: 'Isha', time: '20:30', reminderEnabled: true),
    ];
  }

  // Masjid Reports
  static List<MasjidReport> getMasjidReports() {
    return [
      MasjidReport(
        id: '1',
        type: 'financial',
        title: 'Weekly Financial Update',
        description: 'Donations received this week: \$5,250. Expenses: \$3,100. Net: \$2,150',
        date: DateTime.now().subtract(const Duration(days: 2)),
        amount: 2150.0,
        category: 'Weekly',
      ),
      MasjidReport(
        id: '2',
        type: 'project',
        title: 'Renovation Progress',
        description: 'The main prayer hall renovation is 60% complete. Expected completion: Next month.',
        date: DateTime.now().subtract(const Duration(days: 5)),
      ),
      MasjidReport(
        id: '3',
        type: 'financial',
        title: 'Monthly Financial Summary',
        description: 'Total donations this month: \$22,500. Major expenses: Maintenance, utilities, staff salaries.',
        date: DateTime.now().subtract(const Duration(days: 10)),
        amount: 22500.0,
        category: 'Monthly',
      ),
    ];
  }

  // Events
  static List<Event> getEvents() {
    return [
      Event(
        id: '1',
        title: 'Quran Recitation Competition',
        description: 'Annual Quran recitation competition for all age groups. Registration required.',
        date: DateTime.now().add(const Duration(days: 7)),
        location: 'Main Prayer Hall',
        category: 'Religious',
        requiresRSVP: true,
      ),
      Event(
        id: '2',
        title: 'Islamic Lecture Series',
        description: 'Weekly lecture on Islamic history and teachings. Topic: The Life of Prophet Muhammad (PBUH)',
        date: DateTime.now().add(const Duration(days: 3)),
        location: 'Community Center',
        category: 'Educational',
        requiresRSVP: false,
      ),
      Event(
        id: '3',
        title: 'Community Cleanup Day',
        description: 'Join us in cleaning and beautifying the masjid and surrounding areas.',
        date: DateTime.now().add(const Duration(days: 10)),
        location: 'Masjid Grounds',
        category: 'Community Service',
        requiresRSVP: true,
      ),
    ];
  }

  // Donation Categories
  static List<DonationCategory> getDonationCategories() {
    return [
      DonationCategory(
        id: '1',
        name: 'Zakat',
        description: 'Obligatory charity for eligible Muslims',
      ),
      DonationCategory(
        id: '2',
        name: 'Sadaqah',
        description: 'Voluntary charity and good deeds',
      ),
      DonationCategory(
        id: '3',
        name: 'Masjid Maintenance',
        description: 'Contributions for masjid upkeep and improvements',
      ),
      DonationCategory(
        id: '4',
        name: 'Education Fund',
        description: 'Support for Islamic education programs',
      ),
    ];
  }

  // Donation History
  static List<Donation> getDonationHistory() {
    return [
      Donation(
        id: '1',
        category: 'Sadaqah',
        amount: 100.0,
        date: DateTime.now().subtract(const Duration(days: 5)),
        receiptNumber: 'REC-2024-001',
      ),
      Donation(
        id: '2',
        category: 'Masjid Maintenance',
        amount: 250.0,
        date: DateTime.now().subtract(const Duration(days: 15)),
        receiptNumber: 'REC-2024-002',
      ),
      Donation(
        id: '3',
        category: 'Zakat',
        amount: 500.0,
        date: DateTime.now().subtract(const Duration(days: 30)),
        receiptNumber: 'REC-2024-003',
      ),
    ];
  }

  // Community Posts
  static List<CommunityPost> getCommunityPosts() {
    return [
      CommunityPost(
        id: '1',
        title: 'Lost: Prayer Mat',
        content: 'I lost my green prayer mat after Friday prayer. If found, please contact the front desk.',
        author: 'Brother Ahmed',
        date: DateTime.now().subtract(const Duration(days: 2)),
        category: 'lost_found',
        isModerated: true,
      ),
      CommunityPost(
        id: '2',
        title: 'Volunteers Needed for Iftar',
        content: 'We need volunteers to help set up and serve iftar this weekend. Please sign up at the front desk.',
        author: 'Masjid Committee',
        date: DateTime.now().subtract(const Duration(days: 1)),
        category: 'volunteering',
        isModerated: true,
      ),
      CommunityPost(
        id: '3',
        title: 'Found: Wallet',
        content: 'A wallet was found in the parking lot. Please claim it at the front desk with proper identification.',
        author: 'Brother Hassan',
        date: DateTime.now().subtract(const Duration(days: 3)),
        category: 'lost_found',
        isModerated: true,
      ),
    ];
  }

  // Feedback
  static List<feedback_models.FeedbackItem> getFeedbackHistory() {
    return [
      feedback_models.FeedbackItem(
        id: '1',
        title: 'Sound System Quality',
        content: 'The sound system during Friday prayer could be improved. Sometimes it\'s hard to hear the khutbah.',
        date: DateTime.now().subtract(const Duration(days: 7)),
        category: 'Improvement',
      ),
      feedback_models.FeedbackItem(
        id: '2',
        title: 'More Parking Spaces',
        content: 'During peak times, parking is limited. Could we consider expanding the parking area?',
        date: DateTime.now().subtract(const Duration(days: 14)),
        category: 'Infrastructure',
      ),
    ];
  }

  // Polls
  static List<feedback_models.Poll> getPolls() {
    return [
      feedback_models.Poll(
        id: '1',
        question: 'What time works best for weekly Quran classes?',
        options: ['Weekday Evenings', 'Weekend Mornings', 'Weekend Afternoons', 'Flexible'],
        date: DateTime.now().subtract(const Duration(days: 5)),
        votes: {
          'Weekday Evenings': 45,
          'Weekend Mornings': 32,
          'Weekend Afternoons': 28,
          'Flexible': 15,
        },
      ),
      feedback_models.Poll(
        id: '2',
        question: 'Preferred language for khutbah?',
        options: ['English Only', 'Arabic Only', 'Bilingual', 'No Preference'],
        date: DateTime.now().subtract(const Duration(days: 10)),
        votes: {
          'English Only': 20,
          'Arabic Only': 15,
          'Bilingual': 60,
          'No Preference': 5,
        },
      ),
    ];
  }
}

