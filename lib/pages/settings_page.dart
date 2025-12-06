import 'package:flutter/material.dart';
import '../utils/app_localizations.dart';
import '../utils/theme_provider.dart';

class SettingsPage extends StatelessWidget {
  final ThemeProvider themeProvider;

  const SettingsPage({super.key, required this.themeProvider});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context) ?? AppLocalizations(const Locale('en'));

    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.settings),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Theme Mode Section
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    localizations.theme,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        themeProvider.isDarkMode ? localizations.darkMode : localizations.lightMode,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      Switch(
                        value: themeProvider.isDarkMode,
                        onChanged: (value) {
                          themeProvider.toggleTheme();
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          // Color Scheme Section
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    localizations.colorScheme,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    children: [
                      _buildColorOption(
                        context,
                        ThemeColorScheme.greenGold,
                        'Green & Gold',
                        const Color(0xFF2D5016),
                        const Color(0xFFD4AF37),
                        themeProvider,
                      ),
                      _buildColorOption(
                        context,
                        ThemeColorScheme.emerald,
                        'Emerald',
                        const Color(0xFF059669),
                        const Color(0xFF34D399),
                        themeProvider,
                      ),
                      _buildColorOption(
                        context,
                        ThemeColorScheme.blue,
                        'Blue',
                        const Color(0xFF1E40AF),
                        const Color(0xFF60A5FA),
                        themeProvider,
                      ),
                      _buildColorOption(
                        context,
                        ThemeColorScheme.purple,
                        'Purple',
                        const Color(0xFF6D28D9),
                        const Color(0xFFA78BFA),
                        themeProvider,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildColorOption(
    BuildContext context,
    ThemeColorScheme scheme,
    String name,
    Color primaryColor,
    Color secondaryColor,
    ThemeProvider provider,
  ) {
    final isSelected = provider.colorScheme == scheme;

    return GestureDetector(
      onTap: () {
        provider.setColorScheme(scheme);
      },
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? provider.primaryColor : Colors.grey,
            width: isSelected ? 3 : 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                gradient: LinearGradient(
                  colors: [primaryColor, secondaryColor],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              name,
              style: TextStyle(
                fontSize: 10,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                color: Theme.of(context).textTheme.bodyMedium?.color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

