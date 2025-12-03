import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();

  void createAccount() {
    final email = emailController.text.trim();
    if (email.endsWith("@imam")) {
      Navigator.pushNamed(context, "/dashboard");
    } else if (email.endsWith("@khadim")) {
      Navigator.pushNamed(context, "/khadim");
    } else {
      Navigator.pushNamed(context, "/ummah");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FDF8),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              Center(
                child: Icon(Icons.mosque,
                    size: 75, color: Color(0xFF1A3D2B)),
              ),
              const SizedBox(height: 15),
              Text(
                "Create Your Account",
                style: GoogleFonts.poppins(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1A3D2B),
                ),
              ),
              const SizedBox(height: 25),
              _buildInput("Full Name", nameController),
              const SizedBox(height: 15),
              _buildInput("Email", emailController),
              const SizedBox(height: 15),
              _buildInput("Password", passController, isPassword: true),
              const SizedBox(height: 25),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: createAccount,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF1A3D2B),
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Text(
                    "Create Account",
                    style: GoogleFonts.poppins(
                        fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: GestureDetector(
                  onTap: () => Navigator.pushNamed(context, "/login"),
                  child: Text(
                    "Already have an account? Login",
                    style: GoogleFonts.poppins(
                      color: Color(0xFF1A3D2B),
                      fontSize: 14,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInput(String label, TextEditingController controller,
      {bool isPassword = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style:
                GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w500, color: Color(0xFF1A3D2B))),
        const SizedBox(height: 5),
        TextField(
          controller: controller,
          obscureText: isPassword,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 15, vertical: 14),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Color(0xFF1A3D2B)),
            ),
          ),
        ),
      ],
    );
  }
}
