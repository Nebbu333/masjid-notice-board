import 'package:flutter/material.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  static final Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'app_title': 'Masjid App',
      'home': 'Home',
      'prayer_times': 'Prayer Times',
      'events': 'Events',
      'donations': 'Donations',
      'more': 'More',
      'announcements': 'Announcements',
      'khutbah': 'Khutbah',
      'reports': 'Reports',
      'community': 'Community',
      'feedback': 'Feedback',
      'urgent': 'Urgent',
      'download': 'Download',
      'play': 'Play',
      'pause': 'Pause',
      'reminder': 'Reminder',
      'location': 'Location',
      'adjust_time': 'Adjust Time',
      'rsvp': 'RSVP',
      'donate': 'Donate',
      'history': 'History',
      'receipt': 'Receipt',
      'create_post': 'Create Post',
      'submit': 'Submit',
      'language': 'Language',
      'settings': 'Settings',
      'theme': 'Theme',
      'light_mode': 'Light Mode',
      'dark_mode': 'Dark Mode',
      'color_scheme': 'Color Scheme',
      'quick_access': 'Quick Access',
      'view_all': 'View All',
      'no_announcements': 'No announcements available',
      'no_khutbahs': 'No khutbahs available',
      'audio': 'Audio',
      'video': 'Video',
      'current_location': 'Current Location',
      'downtown_masjid': 'Downtown Masjid',
      'north_branch': 'North Branch',
      'south_branch': 'South Branch',
      'adjusted_by': 'Adjusted by',
      'min': 'min',
      'fajr': 'Fajr',
      'dhuhr': 'Dhuhr',
      'asr': 'Asr',
      'maghrib': 'Maghrib',
      'isha': 'Isha',
      'financial': 'Financial',
      'projects': 'Projects',
      'total_donations': 'Total Donations',
      'select_category': 'Select Category',
      'amount': 'Amount',
      'note_optional': 'Note (Optional)',
      'add_note': 'Add a note',
      'payment_method': 'Payment Method',
      'credit_debit_card': 'Credit/Debit Card',
      'bank_transfer': 'Bank Transfer',
      'card_number': 'Card Number',
      'card_number_hint': '1234 5678 9012 3456',
      'expiry': 'Expiry',
      'expiry_hint': 'MM/YY',
      'cvv': 'CVV',
      'cvv_hint': '123',
      'no_community_posts': 'No community posts yet',
      'moderated': 'Moderated',
      'by': 'By',
      'select_category_hint': 'Select category',
      'improvement': 'Improvement',
      'infrastructure': 'Infrastructure',
      'services': 'Services',
      'other': 'Other',
      'title': 'Title',
      'please_enter_title': 'Please enter a title',
      'your_suggestion': 'Your suggestion or feedback',
      'please_enter_feedback': 'Please enter your feedback',
      'rsvp_submitted': 'RSVP submitted (dummy)',
      'no_events_today': 'No events on this day',
      'calendar': 'Calendar',
      'upcoming': 'Upcoming',
      'donate_tab': 'Donate',
      'history_tab': 'History',
      'submit_tab': 'Submit',
      'polls_tab': 'Polls',
      'votes': 'votes',
      'vote': 'Vote',
      'vote_submitted': 'Vote submitted for',
      'please_select_category': 'Please select a category',
      'enter_amount': 'Enter amount',
      'please_enter_amount': 'Please enter an amount',
      'please_enter_valid_amount': 'Please enter a valid amount',
      'video_player_placeholder': 'Video Player Placeholder',
      'download_started': 'Download started (dummy)',
      'feedback_submitted': 'Feedback submitted (dummy)',
      'weekly_financial_update': 'Weekly Financial Update',
      'monthly_financial_summary': 'Monthly Financial Summary',
      'donations_received_week': 'Donations received this week',
      'expenses': 'Expenses',
      'net': 'Net',
      'total_donations_month': 'Total donations this month',
      'major_expenses': 'Major expenses',
      'maintenance': 'Maintenance',
      'utilities': 'Utilities',
      'staff_salaries': 'Staff salaries',
      'renovation_progress': 'Renovation Progress',
      'main_prayer_hall_renovation': 'The main prayer hall renovation is',
      'complete': 'complete',
      'expected_completion': 'Expected completion',
      'next_month': 'Next month',
      'weekly': 'Weekly',
      'monthly': 'Monthly',
      'ramadan_schedule_update': 'Ramadan Schedule Update',
      'masjid_open_taraweeh': 'The masjid will be open for Taraweeh prayers starting from tomorrow. Please arrive 10 minutes early.',
      'community_iftar_friday': 'Community Iftar This Friday',
      'join_community_iftar': 'Join us for a community iftar this Friday after Maghrib prayer. All are welcome.',
      'quran_study_circle': 'Quran Study Circle',
      'weekly_quran_study': 'Weekly Quran study circle every Sunday at 6 PM. Beginners welcome.',
      'importance_patience': 'The Importance of Patience',
      'gratitude_thankfulness': 'Gratitude and Thankfulness',
      'quran_recitation_competition': 'Quran Recitation Competition',
      'annual_quran_competition': 'Annual Quran recitation competition for all age groups. Registration required.',
      'main_prayer_hall': 'Main Prayer Hall',
      'islamic_lecture_series': 'Islamic Lecture Series',
      'weekly_lecture_islamic': 'Weekly lecture on Islamic history and teachings. Topic: The Life of Prophet Muhammad (PBUH)',
      'community_center': 'Community Center',
      'community_cleanup_day': 'Community Cleanup Day',
      'join_cleanup': 'Join us in cleaning and beautifying the masjid and surrounding areas.',
      'masjid_grounds': 'Masjid Grounds',
      'religious': 'Religious',
      'educational': 'Educational',
      'community_service': 'Community Service',
      'zakat': 'Zakat',
      'zakat_description': 'Obligatory charity for eligible Muslims',
      'sadaqah': 'Sadaqah',
      'sadaqah_description': 'Voluntary charity and good deeds',
      'masjid_maintenance': 'Masjid Maintenance',
      'masjid_maintenance_description': 'Contributions for masjid upkeep and improvements',
      'education_fund': 'Education Fund',
      'education_fund_description': 'Support for Islamic education programs',
      'lost_prayer_mat': 'Lost: Prayer Mat',
      'lost_prayer_mat_desc': 'I lost my green prayer mat after Friday prayer. If found, please contact the front desk.',
      'volunteers_needed_iftar': 'Volunteers Needed for Iftar',
      'volunteers_needed_desc': 'We need volunteers to help set up and serve iftar this weekend. Please sign up at the front desk.',
      'found_wallet': 'Found: Wallet',
      'found_wallet_desc': 'A wallet was found in the parking lot. Please claim it at the front desk with proper identification.',
      'lost_found': 'Lost & Found',
      'volunteering': 'Volunteering',
      'general': 'General',
      'brother_ahmed': 'Brother Ahmed',
      'masjid_committee': 'Masjid Committee',
      'brother_hassan': 'Brother Hassan',
      'sound_system_quality': 'Sound System Quality',
      'sound_system_feedback': 'The sound system during Friday prayer could be improved. Sometimes it\'s hard to hear the khutbah.',
      'more_parking_spaces': 'More Parking Spaces',
      'parking_feedback': 'During peak times, parking is limited. Could we consider expanding the parking area?',
    },
    'ar': {
      'app_title': 'تطبيق المسجد',
      'home': 'الرئيسية',
      'prayer_times': 'أوقات الصلاة',
      'events': 'الفعاليات',
      'donations': 'التبرعات',
      'more': 'المزيد',
      'announcements': 'الإعلانات',
      'khutbah': 'الخطبة',
      'reports': 'التقارير',
      'community': 'المجتمع',
      'feedback': 'الملاحظات',
      'urgent': 'عاجل',
      'download': 'تحميل',
      'play': 'تشغيل',
      'pause': 'إيقاف',
      'reminder': 'تذكير',
      'location': 'الموقع',
      'adjust_time': 'تعديل الوقت',
      'rsvp': 'تأكيد الحضور',
      'donate': 'تبرع',
      'history': 'السجل',
      'receipt': 'إيصال',
      'create_post': 'إنشاء منشور',
      'submit': 'إرسال',
      'language': 'اللغة',
      'settings': 'الإعدادات',
      'theme': 'المظهر',
      'light_mode': 'الوضع الفاتح',
      'dark_mode': 'الوضع الداكن',
      'color_scheme': 'مخطط الألوان',
      'quick_access': 'الوصول السريع',
      'view_all': 'عرض الكل',
      'no_announcements': 'لا توجد إعلانات',
      'no_khutbahs': 'لا توجد خطب',
      'audio': 'صوتي',
      'video': 'فيديو',
      'current_location': 'الموقع الحالي',
      'downtown_masjid': 'المسجد المركزي',
      'north_branch': 'الفرع الشمالي',
      'south_branch': 'الفرع الجنوبي',
      'adjusted_by': 'تم التعديل بمقدار',
      'min': 'دقيقة',
      'fajr': 'الفجر',
      'dhuhr': 'الظهر',
      'asr': 'العصر',
      'maghrib': 'المغرب',
      'isha': 'العشاء',
      'financial': 'المالية',
      'projects': 'المشاريع',
      'total_donations': 'إجمالي التبرعات',
      'select_category': 'اختر الفئة',
      'amount': 'المبلغ',
      'note_optional': 'ملاحظة (اختياري)',
      'add_note': 'أضف ملاحظة',
      'payment_method': 'طريقة الدفع',
      'credit_debit_card': 'بطاقة ائتمان/خصم',
      'bank_transfer': 'تحويل بنكي',
      'card_number': 'رقم البطاقة',
      'card_number_hint': '1234 5678 9012 3456',
      'expiry': 'تاريخ الانتهاء',
      'expiry_hint': 'شهر/سنة',
      'cvv': 'CVV',
      'cvv_hint': '123',
      'no_community_posts': 'لا توجد منشورات مجتمعية بعد',
      'moderated': 'مُراقب',
      'by': 'بواسطة',
      'select_category_hint': 'اختر الفئة',
      'improvement': 'تحسين',
      'infrastructure': 'البنية التحتية',
      'services': 'الخدمات',
      'other': 'أخرى',
      'title': 'العنوان',
      'please_enter_title': 'الرجاء إدخال العنوان',
      'your_suggestion': 'اقتراحك أو ملاحظاتك',
      'please_enter_feedback': 'الرجاء إدخال ملاحظاتك',
      'rsvp_submitted': 'تم تأكيد الحضور (تجريبي)',
      'no_events_today': 'لا توجد فعاليات في هذا اليوم',
      'calendar': 'التقويم',
      'upcoming': 'القادمة',
      'donate_tab': 'تبرع',
      'history_tab': 'السجل',
      'submit_tab': 'إرسال',
      'polls_tab': 'الاستطلاعات',
      'votes': 'أصوات',
      'vote': 'صوت',
      'vote_submitted': 'تم التصويت لـ',
      'please_select_category': 'الرجاء اختيار فئة',
      'enter_amount': 'أدخل المبلغ',
      'please_enter_amount': 'الرجاء إدخال مبلغ',
      'please_enter_valid_amount': 'الرجاء إدخال مبلغ صحيح',
      'video_player_placeholder': 'مشغل فيديو تجريبي',
      'download_started': 'بدأ التحميل (تجريبي)',
      'feedback_submitted': 'تم إرسال الملاحظات (تجريبي)',
      'weekly_financial_update': 'تحديث مالي أسبوعي',
      'monthly_financial_summary': 'ملخص مالي شهري',
      'donations_received_week': 'التبرعات المستلمة هذا الأسبوع',
      'expenses': 'المصروفات',
      'net': 'صافي',
      'total_donations_month': 'إجمالي التبرعات هذا الشهر',
      'major_expenses': 'المصروفات الرئيسية',
      'maintenance': 'الصيانة',
      'utilities': 'المرافق',
      'staff_salaries': 'رواتب الموظفين',
      'renovation_progress': 'تقدم التجديد',
      'main_prayer_hall_renovation': 'تجديد قاعة الصلاة الرئيسية',
      'complete': 'مكتمل',
      'expected_completion': 'تاريخ الانتهاء المتوقع',
      'next_month': 'الشهر القادم',
      'weekly': 'أسبوعي',
      'monthly': 'شهري',
      'ramadan_schedule_update': 'تحديث جدول رمضان',
      'masjid_open_taraweeh': 'سيكون المسجد مفتوحاً لصلاة التراويح ابتداءً من الغد. يرجى الحضور قبل 10 دقائق.',
      'community_iftar_friday': 'إفطار جماعي هذا الجمعة',
      'join_community_iftar': 'انضم إلينا في إفطار جماعي هذا الجمعة بعد صلاة المغرب. الجميع مرحب بهم.',
      'quran_study_circle': 'دائرة دراسة القرآن',
      'weekly_quran_study': 'دائرة دراسة القرآن الأسبوعية كل يوم أحد الساعة 6 مساءً. المبتدئون مرحب بهم.',
      'importance_patience': 'أهمية الصبر',
      'gratitude_thankfulness': 'الشكر والامتنان',
      'quran_recitation_competition': 'مسابقة تلاوة القرآن',
      'annual_quran_competition': 'مسابقة تلاوة القرآن السنوية لجميع الفئات العمرية. التسجيل مطلوب.',
      'main_prayer_hall': 'قاعة الصلاة الرئيسية',
      'islamic_lecture_series': 'سلسلة محاضرات إسلامية',
      'weekly_lecture_islamic': 'محاضرة أسبوعية عن التاريخ الإسلامي والتعاليم. الموضوع: حياة النبي محمد (صلى الله عليه وسلم)',
      'community_center': 'المركز المجتمعي',
      'community_cleanup_day': 'يوم تنظيف المجتمع',
      'join_cleanup': 'انضم إلينا في تنظيف وتبجيل المسجد والمناطق المحيطة.',
      'masjid_grounds': 'أرض المسجد',
      'religious': 'ديني',
      'educational': 'تعليمي',
      'community_service': 'خدمة المجتمع',
      'zakat': 'زكاة',
      'zakat_description': 'صدقة واجبة للمسلمين المؤهلين',
      'sadaqah': 'صدقة',
      'sadaqah_description': 'صدقة تطوعية وأعمال خير',
      'masjid_maintenance': 'صيانة المسجد',
      'masjid_maintenance_description': 'مساهمات لصيانة وتحسينات المسجد',
      'education_fund': 'صندوق التعليم',
      'education_fund_description': 'دعم برامج التعليم الإسلامي',
      'lost_prayer_mat': 'مفقود: سجادة صلاة',
      'lost_prayer_mat_desc': 'فقدت سجادتي الخضراء للصلاة بعد صلاة الجمعة. إذا تم العثور عليها، يرجى الاتصال بالاستقبال.',
      'volunteers_needed_iftar': 'متطوعون مطلوبون للإفطار',
      'volunteers_needed_desc': 'نحتاج متطوعين للمساعدة في إعداد وتقديم الإفطار في نهاية هذا الأسبوع. يرجى التسجيل في الاستقبال.',
      'found_wallet': 'وجد: محفظة',
      'found_wallet_desc': 'تم العثور على محفظة في موقف السيارات. يرجى المطالبة بها في الاستقبال مع هوية مناسبة.',
      'lost_found': 'مفقود وموجود',
      'volunteering': 'التطوع',
      'general': 'عام',
      'brother_ahmed': 'الأخ أحمد',
      'masjid_committee': 'لجنة المسجد',
      'brother_hassan': 'الأخ حسن',
      'sound_system_quality': 'جودة نظام الصوت',
      'sound_system_feedback': 'يمكن تحسين نظام الصوت أثناء صلاة الجمعة. أحياناً من الصعب سماع الخطبة.',
      'more_parking_spaces': 'المزيد من أماكن وقوف السيارات',
      'parking_feedback': 'خلال أوقات الذروة، مواقف السيارات محدودة. هل يمكننا التفكير في توسيع منطقة وقوف السيارات؟',
    },
    'ur': {
      'app_title': 'مسجد ایپ',
      'home': 'ہوم',
      'prayer_times': 'نماز کے اوقات',
      'events': 'تقاریب',
      'donations': 'عطیات',
      'more': 'مزید',
      'announcements': 'اعلانات',
      'khutbah': 'خطبہ',
      'reports': 'رپورٹس',
      'community': 'کمیونٹی',
      'feedback': 'فیڈ بیک',
      'urgent': 'فوری',
      'download': 'ڈاؤن لوڈ',
      'play': 'چلائیں',
      'pause': 'روکیں',
      'reminder': 'یاد دہانی',
      'location': 'مقام',
      'adjust_time': 'وقت ایڈجسٹ کریں',
      'rsvp': 'حاضری کی تصدیق',
      'donate': 'عطیہ دیں',
      'history': 'تاریخ',
      'receipt': 'رسید',
      'create_post': 'پوسٹ بنائیں',
      'submit': 'جمع کریں',
      'language': 'زبان',
    },
  };

  String translate(String key) {
    return _localizedValues[locale.languageCode]?[key] ?? key;
  }

  String get appTitle => translate('app_title');
  String get home => translate('home');
  String get prayerTimes => translate('prayer_times');
  String get events => translate('events');
  String get donations => translate('donations');
  String get more => translate('more');
  String get announcements => translate('announcements');
  String get khutbah => translate('khutbah');
  String get reports => translate('reports');
  String get community => translate('community');
  String get feedback => translate('feedback');
  String get urgent => translate('urgent');
  String get download => translate('download');
  String get play => translate('play');
  String get pause => translate('pause');
  String get reminder => translate('reminder');
  String get location => translate('location');
  String get adjustTime => translate('adjust_time');
  String get rsvp => translate('rsvp');
  String get donate => translate('donate');
  String get history => translate('history');
  String get receipt => translate('receipt');
  String get createPost => translate('create_post');
  String get submit => translate('submit');
  String get language => translate('language');
  String get settings => translate('settings');
  String get theme => translate('theme');
  String get lightMode => translate('light_mode');
  String get darkMode => translate('dark_mode');
  String get colorScheme => translate('color_scheme');
  String get quickAccess => translate('quick_access');
  String get viewAll => translate('view_all');
  String get noAnnouncements => translate('no_announcements');
  String get noKhutbahs => translate('no_khutbahs');
  String get audio => translate('audio');
  String get video => translate('video');
  String get currentLocation => translate('current_location');
  String get downtownMasjid => translate('downtown_masjid');
  String get northBranch => translate('north_branch');
  String get southBranch => translate('south_branch');
  String get adjustedBy => translate('adjusted_by');
  String get min => translate('min');
  String get fajr => translate('fajr');
  String get dhuhr => translate('dhuhr');
  String get asr => translate('asr');
  String get maghrib => translate('maghrib');
  String get isha => translate('isha');
  String get financial => translate('financial');
  String get projects => translate('projects');
  String get totalDonations => translate('total_donations');
  String get selectCategory => translate('select_category');
  String get amount => translate('amount');
  String get noteOptional => translate('note_optional');
  String get addNote => translate('add_note');
  String get paymentMethod => translate('payment_method');
  String get creditDebitCard => translate('credit_debit_card');
  String get bankTransfer => translate('bank_transfer');
  String get cardNumber => translate('card_number');
  String get cardNumberHint => translate('card_number_hint');
  String get expiry => translate('expiry');
  String get expiryHint => translate('expiry_hint');
  String get cvv => translate('cvv');
  String get cvvHint => translate('cvv_hint');
  String get noCommunityPosts => translate('no_community_posts');
  String get moderated => translate('moderated');
  String get by => translate('by');
  String get selectCategoryHint => translate('select_category_hint');
  String get improvement => translate('improvement');
  String get infrastructure => translate('infrastructure');
  String get services => translate('services');
  String get other => translate('other');
  String get titleLabel => translate('title');
  String get pleaseEnterTitle => translate('please_enter_title');
  String get yourSuggestion => translate('your_suggestion');
  String get pleaseEnterFeedback => translate('please_enter_feedback');
  String get rsvpSubmitted => translate('rsvp_submitted');
  String get noEventsToday => translate('no_events_today');
  String get calendar => translate('calendar');
  String get upcoming => translate('upcoming');
  String get donateTab => translate('donate_tab');
  String get historyTab => translate('history_tab');
  String get submitTab => translate('submit_tab');
  String get pollsTab => translate('polls_tab');
  String get votes => translate('votes');
  String get vote => translate('vote');
  String get voteSubmitted => translate('vote_submitted');
  String get pleaseSelectCategory => translate('please_select_category');
  String get enterAmount => translate('enter_amount');
  String get pleaseEnterAmount => translate('please_enter_amount');
  String get pleaseEnterValidAmount => translate('please_enter_valid_amount');
  String get videoPlayerPlaceholder => translate('video_player_placeholder');
  String get downloadStarted => translate('download_started');
  String get feedbackSubmitted => translate('feedback_submitted');
  String get weeklyFinancialUpdate => translate('weekly_financial_update');
  String get monthlyFinancialSummary => translate('monthly_financial_summary');
  String get donationsReceivedWeek => translate('donations_received_week');
  String get expenses => translate('expenses');
  String get net => translate('net');
  String get totalDonationsMonth => translate('total_donations_month');
  String get majorExpenses => translate('major_expenses');
  String get maintenance => translate('maintenance');
  String get utilities => translate('utilities');
  String get staffSalaries => translate('staff_salaries');
  String get renovationProgress => translate('renovation_progress');
  String get mainPrayerHallRenovation => translate('main_prayer_hall_renovation');
  String get complete => translate('complete');
  String get expectedCompletion => translate('expected_completion');
  String get nextMonth => translate('next_month');
  String get weekly => translate('weekly');
  String get monthly => translate('monthly');
  String get ramadanScheduleUpdate => translate('ramadan_schedule_update');
  String get masjidOpenTaraweeh => translate('masjid_open_taraweeh');
  String get communityIftarFriday => translate('community_iftar_friday');
  String get joinCommunityIftar => translate('join_community_iftar');
  String get quranStudyCircle => translate('quran_study_circle');
  String get weeklyQuranStudy => translate('weekly_quran_study');
  String get importancePatience => translate('importance_patience');
  String get gratitudeThankfulness => translate('gratitude_thankfulness');
  String get quranRecitationCompetition => translate('quran_recitation_competition');
  String get annualQuranCompetition => translate('annual_quran_competition');
  String get mainPrayerHall => translate('main_prayer_hall');
  String get islamicLectureSeries => translate('islamic_lecture_series');
  String get weeklyLectureIslamic => translate('weekly_lecture_islamic');
  String get communityCenter => translate('community_center');
  String get communityCleanupDay => translate('community_cleanup_day');
  String get joinCleanup => translate('join_cleanup');
  String get masjidGrounds => translate('masjid_grounds');
  String get religious => translate('religious');
  String get educational => translate('educational');
  String get communityService => translate('community_service');
  String get zakat => translate('zakat');
  String get zakatDescription => translate('zakat_description');
  String get sadaqah => translate('sadaqah');
  String get sadaqahDescription => translate('sadaqah_description');
  String get masjidMaintenance => translate('masjid_maintenance');
  String get masjidMaintenanceDescription => translate('masjid_maintenance_description');
  String get educationFund => translate('education_fund');
  String get educationFundDescription => translate('education_fund_description');
  String get lostPrayerMat => translate('lost_prayer_mat');
  String get lostPrayerMatDesc => translate('lost_prayer_mat_desc');
  String get volunteersNeededIftar => translate('volunteers_needed_iftar');
  String get volunteersNeededDesc => translate('volunteers_needed_desc');
  String get foundWallet => translate('found_wallet');
  String get foundWalletDesc => translate('found_wallet_desc');
  String get lostFound => translate('lost_found');
  String get volunteering => translate('volunteering');
  String get general => translate('general');
  String get brotherAhmed => translate('brother_ahmed');
  String get masjidCommittee => translate('masjid_committee');
  String get brotherHassan => translate('brother_hassan');
  String get soundSystemQuality => translate('sound_system_quality');
  String get soundSystemFeedback => translate('sound_system_feedback');
  String get moreParkingSpaces => translate('more_parking_spaces');
  String get parkingFeedback => translate('parking_feedback');
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'ar', 'ur'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    return AppLocalizations(locale);
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

