import '../utils/app_localizations.dart';
import '../models/masjid_report.dart';
import '../models/announcement.dart';
import '../models/event.dart';
import '../models/donation.dart';
import '../models/community_post.dart';
import '../models/donation.dart' as donation_models;

class MockDataLocalizer {
  static String localizeReportTitle(String title, AppLocalizations loc) {
    switch (title) {
      case 'Weekly Financial Update':
        return loc.weeklyFinancialUpdate;
      case 'Monthly Financial Summary':
        return loc.monthlyFinancialSummary;
      case 'Renovation Progress':
        return loc.renovationProgress;
      default:
        return title;
    }
  }

  static String localizeReportDescription(String description, AppLocalizations loc) {
    if (description.contains('Donations received this week')) {
      return '${loc.donationsReceivedWeek}: \$5,250. ${loc.expenses}: \$3,100. ${loc.net}: \$2,150';
    } else if (description.contains('Total donations this month')) {
      return '${loc.totalDonationsMonth}: \$22,500. ${loc.majorExpenses}: ${loc.maintenance}, ${loc.utilities}, ${loc.staffSalaries}.';
    } else if (description.contains('main prayer hall renovation')) {
      return '${loc.mainPrayerHallRenovation} ${loc.complete} 60%. ${loc.expectedCompletion}: ${loc.nextMonth}.';
    }
    return description;
  }

  static String localizeCategory(String? category, AppLocalizations loc) {
    if (category == null) return '';
    switch (category) {
      case 'Weekly':
        return loc.weekly;
      case 'Monthly':
        return loc.monthly;
      default:
        return category;
    }
  }

  static String localizeAnnouncementTitle(String title, AppLocalizations loc) {
    switch (title) {
      case 'Ramadan Schedule Update':
        return loc.ramadanScheduleUpdate;
      case 'Community Iftar This Friday':
        return loc.communityIftarFriday;
      case 'Quran Study Circle':
        return loc.quranStudyCircle;
      default:
        return title;
    }
  }

  static String localizeAnnouncementDescription(String description, AppLocalizations loc) {
    if (description.contains('masjid will be open for Taraweeh')) {
      return loc.masjidOpenTaraweeh;
    } else if (description.contains('community iftar this Friday')) {
      return loc.joinCommunityIftar;
    } else if (description.contains('Weekly Quran study circle')) {
      return loc.weeklyQuranStudy;
    }
    return description;
  }

  static String localizeEventTitle(String title, AppLocalizations loc) {
    switch (title) {
      case 'Quran Recitation Competition':
        return loc.quranRecitationCompetition;
      case 'Islamic Lecture Series':
        return loc.islamicLectureSeries;
      case 'Community Cleanup Day':
        return loc.communityCleanupDay;
      default:
        return title;
    }
  }

  static String localizeEventDescription(String description, AppLocalizations loc) {
    if (description.contains('Annual Quran recitation competition')) {
      return loc.annualQuranCompetition;
    } else if (description.contains('Weekly lecture on Islamic history')) {
      return loc.weeklyLectureIslamic;
    } else if (description.contains('cleaning and beautifying the masjid')) {
      return loc.joinCleanup;
    }
    return description;
  }

  static String localizeEventLocation(String location, AppLocalizations loc) {
    switch (location) {
      case 'Main Prayer Hall':
        return loc.mainPrayerHall;
      case 'Community Center':
        return loc.communityCenter;
      case 'Masjid Grounds':
        return loc.masjidGrounds;
      default:
        return location;
    }
  }

  static String localizeEventCategory(String category, AppLocalizations loc) {
    switch (category) {
      case 'Religious':
        return loc.religious;
      case 'Educational':
        return loc.educational;
      case 'Community Service':
        return loc.communityService;
      default:
        return category;
    }
  }

  static String localizeDonationCategory(String category, AppLocalizations loc) {
    switch (category) {
      case 'Zakat':
        return loc.zakat;
      case 'Sadaqah':
        return loc.sadaqah;
      case 'Masjid Maintenance':
        return loc.masjidMaintenance;
      case 'Education Fund':
        return loc.educationFund;
      default:
        return category;
    }
  }

  static String localizeDonationCategoryDescription(String description, AppLocalizations loc) {
    switch (description) {
      case 'Obligatory charity for eligible Muslims':
        return loc.zakatDescription;
      case 'Voluntary charity and good deeds':
        return loc.sadaqahDescription;
      case 'Contributions for masjid upkeep and improvements':
        return loc.masjidMaintenanceDescription;
      case 'Support for Islamic education programs':
        return loc.educationFundDescription;
      default:
        return description;
    }
  }

  static String localizeCommunityPostTitle(String title, AppLocalizations loc) {
    switch (title) {
      case 'Lost: Prayer Mat':
        return loc.lostPrayerMat;
      case 'Volunteers Needed for Iftar':
        return loc.volunteersNeededIftar;
      case 'Found: Wallet':
        return loc.foundWallet;
      default:
        return title;
    }
  }

  static String localizeCommunityPostContent(String content, AppLocalizations loc) {
    if (content.contains('lost my green prayer mat')) {
      return loc.lostPrayerMatDesc;
    } else if (content.contains('volunteers to help set up and serve iftar')) {
      return loc.volunteersNeededDesc;
    } else if (content.contains('wallet was found in the parking lot')) {
      return loc.foundWalletDesc;
    }
    return content;
  }

  static String localizeCommunityPostAuthor(String author, AppLocalizations loc) {
    switch (author) {
      case 'Brother Ahmed':
        return loc.brotherAhmed;
      case 'Masjid Committee':
        return loc.masjidCommittee;
      case 'Brother Hassan':
        return loc.brotherHassan;
      default:
        return author;
    }
  }

  static String localizeCommunityPostCategory(String category, AppLocalizations loc) {
    switch (category) {
      case 'lost_found':
        return loc.lostFound;
      case 'volunteering':
        return loc.volunteering;
      case 'general':
        return loc.general;
      default:
        return category.replaceAll('_', ' ').toUpperCase();
    }
  }
}

