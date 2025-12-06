import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'pages/home_page.dart';
import 'pages/prayer_times_page.dart';
import 'pages/events_page.dart';
import 'pages/donations_page.dart';
import 'utils/app_localizations.dart';
import 'utils/app_theme.dart';
import 'utils/theme_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>();
}

class _MyAppState extends State<MyApp> {
  Locale _locale = const Locale('en');
  final ThemeProvider _themeProvider = ThemeProvider();

  @override
  void initState() {
    super.initState();
    _themeProvider.addListener(_onThemeChanged);
  }

  @override
  void dispose() {
    _themeProvider.removeListener(_onThemeChanged);
    _themeProvider.dispose();
    super.dispose();
  }

  void _onThemeChanged() {
    setState(() {});
  }

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Masjid App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.getLightTheme(_themeProvider),
      darkTheme: AppTheme.getDarkTheme(_themeProvider),
      themeMode: _themeProvider.themeMode,
      locale: _locale,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('ar'),
        Locale('ur'),
      ],
      builder: (context, child) {
        return Directionality(
          textDirection: _locale.languageCode == 'ar' ? TextDirection.rtl : TextDirection.ltr,
          child: child!,
        );
      },
      home: HomePageWrapper(
        setLocale: setLocale,
        themeProvider: _themeProvider,
      ),
    );
  }
}

class HomePageWrapper extends StatefulWidget {
  final Function(Locale) setLocale;
  final ThemeProvider themeProvider;

  const HomePageWrapper({
    super.key,
    required this.setLocale,
    required this.themeProvider,
  });

  @override
  State<HomePageWrapper> createState() => _HomePageWrapperState();
}

class _HomePageWrapperState extends State<HomePageWrapper> {
  int _currentIndex = 0;

  List<Widget> get _pages => [
        HomeContentPage(themeProvider: widget.themeProvider),
        PrayerTimesPage(themeProvider: widget.themeProvider),
        EventsPage(themeProvider: widget.themeProvider),
        DonationsPage(themeProvider: widget.themeProvider),
        MorePage(
          setLocale: widget.setLocale,
          themeProvider: widget.themeProvider,
        ),
      ];

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context) ?? AppLocalizations(const Locale('en'));

    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: widget.themeProvider.primaryColor,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: localizations.home,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.access_time),
            label: localizations.prayerTimes,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.event),
            label: localizations.events,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.favorite),
            label: localizations.donations,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.more_horiz),
            label: localizations.more,
          ),
        ],
      ),
    );
  }
}
