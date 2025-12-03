import 'package:flutter/foundation.dart';

/// Simple in-memory auth service to represent an Imam-verified account.
/// This is a lightweight placeholder for a real auth/back-end integration.
class AuthService {
  AuthService._privateConstructor();
  static final AuthService instance = AuthService._privateConstructor();

  /// Whether the current user is an authenticated & verified Imam.
  final ValueNotifier<bool> isImamVerified = ValueNotifier<bool>(false);

  get currentUserName => null;

  get currentUserPhoto => null;

  get currentUserBanner => null;

  /// Simulate verifying the imam (replace with real verification flow).
  Future<void> verifyImam() async {
    // In a real app you'd call your backend to verify credentials and set a token.
    await Future.delayed(const Duration(milliseconds: 300));
    isImamVerified.value = true;
  }

  /// Sign out / unverify for testing.
  void revokeVerification() => isImamVerified.value = false;
}
