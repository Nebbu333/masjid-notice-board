import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import 'imam_dashboard.dart';

class ImamLoginScreen extends StatefulWidget {
  const ImamLoginScreen({super.key});

  @override
  State<ImamLoginScreen> createState() => _ImamLoginScreenState();
}

class _ImamLoginScreenState extends State<ImamLoginScreen> {
  final TextEditingController _emailCtrl = TextEditingController();
  final TextEditingController _passwordCtrl = TextEditingController();
  final TextEditingController _codeCtrl = TextEditingController();
  bool _loading = false;
  bool _codeSent = false;
  String? _error;
  bool _obscurePassword = true;
  bool _rememberMe = false;

  @override
  void dispose() {
    _emailCtrl.dispose();
    _passwordCtrl.dispose();
    _codeCtrl.dispose();
    super.dispose();
  }

  Future<void> _sendCode() async {
    setState(() {
      _error = null;
      _codeSent = false;
      _loading = true;
    });
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 700));
    if (!mounted) return;
    setState(() {
      _loading = false;
      _codeSent = true;
    });
    // Demo code hint
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Verification code sent (demo): 123456')));
  }

  Future<void> _verify() async {
    final code = _codeCtrl.text.trim();
    setState(() {
      _error = null;
    });

    if (!_codeSent) {
      setState(() => _error = 'Please request a verification code first.');
      return;
    }
    if (code.isEmpty) {
      setState(() => _error = 'Enter the verification code.');
      return;
    }
    // In demo accept 123456 or any non-empty code
    setState(() => _loading = true);
    await AuthService.instance.verifyImam();
    if (!mounted) return;
    setState(() => _loading = false);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Imam verified (demo)')));
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => const ImamDashboardScreen()));
  }

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Imam Verification', style: TextStyle(fontWeight: FontWeight.w600)),
        backgroundColor: isDark ? const Color(0xFF102216) : const Color(0xFFF6F8F6),
        elevation: 0,
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 8),
              const Text('Welcome back', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700)),
              const SizedBox(height: 6),
              const Text('Sign in as Imam to manage mosque announcements and times.', style: TextStyle(color: Colors.black54)),
              const SizedBox(height: 18),

              // Email / Phone
              TextField(
                controller: _emailCtrl,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(labelText: 'Email or Phone', prefixIcon: Icon(Icons.person)),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: _passwordCtrl,
                obscureText: _obscurePassword,
                decoration: InputDecoration(
                  labelText: 'Password (demo)',
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: Icon(_obscurePassword ? Icons.visibility : Icons.visibility_off),
                    onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Row(children: [
                Checkbox(value: _rememberMe, onChanged: (v) => setState(() => _rememberMe = v ?? false)),
                const SizedBox(width: 6),
                const Text('Remember me', style: TextStyle(fontWeight: FontWeight.w500)),
              ]),
              const SizedBox(height: 12),

              Row(children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: (_loading || _emailCtrl.text.trim().isEmpty || _passwordCtrl.text.trim().isEmpty) ? null : _sendCode,
                    child: _loading ? const SizedBox(width: 18, height: 18, child: CircularProgressIndicator(strokeWidth: 2)) : const Text('Request Verification'),
                  ),
                ),
              ]),
              const SizedBox(height: 12),

              if (_codeSent) ...[
                TextField(
                  controller: _codeCtrl,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Verification Code', prefixIcon: Icon(Icons.confirmation_number)),
                ),
                const SizedBox(height: 12),
              ],

              if (_error != null) ...[
                Text(_error!, style: const TextStyle(color: Colors.red)),
                const SizedBox(height: 8),
              ],

              ElevatedButton(
                onPressed: _loading ? null : _verify,
                style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 14)),
                child: _loading ? const SizedBox(width: 18, height: 18, child: CircularProgressIndicator(strokeWidth: 2)) : const Text('Verify and Continue'),
              ),

              const SizedBox(height: 12),
              TextButton(
                onPressed: () {
                  // Quick demo login: verify immediately
                  if (!_loading) {
                    _codeCtrl.text = '123456';
                    _verify();
                  }
                },
                child: const Text('Quick demo login'),
              ),

              const SizedBox(height: 16),
              const Text('Note: This demo flow does not persist credentials. For production, integrate a secure back-end verification.'),
            ],
          ),
        ),
      ),
    );
  }
}
