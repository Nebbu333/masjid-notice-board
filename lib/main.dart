import 'package:flutter/material.dart';
import 'screens/imam_dashboard.dart';
import 'screens/landing_page.dart';
import 'screens/login.dart';
import 'screens/signup.dart';
import 'screens/imam_login.dart';
import 'screens/khadim_dashboard.dart';
import 'screens/maintenance_update.dart';
import 'screens/ummah_dashboard.dart';
import 'screens/announcements_screen.dart';
import 'screens/khutbahs_screen.dart';
import 'screens/prayer_times_screen.dart';
import 'screens/events_screen.dart';
import 'screens/donation_screen.dart';
import 'screens/community_board_screen.dart';
import 'screens/feedback_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/khadim_donation_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Masjid Notice Board',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: '/',
      routes: {
        '/': (ctx) => const LandingPageScreen(),
        '/login': (ctx) => const LoginScreen(),
        '/signup': (ctx) => const SignupScreen(),
        '/imam-login': (ctx) => const ImamLoginScreen(),
        '/dashboard': (ctx) => const ImamDashboardScreen(),
        '/khadim': (ctx) => const KhadimDashboardScreen(),
        '/maintenance': (ctx) => const MaintenanceUpdateScreen(),
        '/ummah': (ctx) => const UmmahDashboardScreen(),
        '/announcements': (ctx) => const AnnouncementsScreen(),
        '/khutbahs': (ctx) => const KhutbahsScreen(),
        '/prayer': (ctx) => const PrayerTimesScreen(),
        '/events': (ctx) => const EventsScreen(),
        '/donate': (ctx) => const DonationScreen(),
        '/community': (ctx) => const CommunityBoardScreen(),
        '/feedback': (ctx) => const FeedbackScreen(),
        '/profile': (ctx) => const ProfileScreen(),
        '/donations': (ctx) => const KhadimDonationScreen(),
      },
    );
  }
}
