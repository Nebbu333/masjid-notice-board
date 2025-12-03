import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LandingPageScreen extends StatelessWidget {
  const LandingPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FDF8),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 40),
            Icon(Icons.mosque, size: 80, color: Colors.green.shade700),
            const SizedBox(height: 10),
            Text(
              "Stay Connected With Your Masjid",
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.green.shade800,
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Text(
                "Prayer times, khutbah updates, events, and announcements — all in one place.",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  height: 1.4,
                  color: Colors.black54,
                ),
              ),
            ),
            const SizedBox(height: 40),
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 22),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.green.shade100,
                      blurRadius: 15,
                      spreadRadius: 3,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      _buildFeatureCard(
                        icon: Icons.access_time_filled,
                        title: "Live Prayer & Iqamah Times",
                      ),
                      _buildFeatureCard(
                        icon: Icons.campaign,
                        title: "Announcements & Events",
                      ),
                      _buildFeatureCard(
                        icon: Icons.menu_book_rounded,
                        title: "Khutbah & Imam Updates",
                      ),
                      _buildFeatureCard(
                        icon: Icons.volunteer_activism,
                        title: "Support & Donate",
                      ),
                      const Spacer(),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green.shade700,
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, "/login");
                          },
                          child: Text(
                            "Login",
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(color: Colors.green.shade600),
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, "/signup");
                          },
                          child: Text(
                            "Create Account",
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.green.shade800,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 25),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureCard({required IconData icon, required String title}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: const Color(0xFFF6FFF6),
        border: Border.all(color: Colors.green.shade100),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.green.shade700),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.green.shade900,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
