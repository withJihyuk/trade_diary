import 'dart:io';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';

class OauthProvider {
  final supabase = Supabase.instance.client;

  Future<AuthResponse?> nativeGoogleLogin() async {
    if (Platform.isAndroid || Platform.isIOS) {
      const webClientId =
          '758208968172-95ov64v7jpu6vfopo0ho3hnfnn72ktri.apps.googleusercontent.com';
      const iosClientId =
          '758208968172-s02f95mh5sv31cb23tqa36uh1n2uj4rb.apps.googleusercontent.com';
      final GoogleSignIn googleSignIn = GoogleSignIn(
        clientId: iosClientId,
        serverClientId: webClientId,
      );

      final googleUser = await googleSignIn.signIn();
      final googleAuth = await googleUser!.authentication;
      final accessToken = googleAuth.accessToken;
      final idToken = googleAuth.idToken;
      // 로직 취소시 무효화 로직 추가 필요

      if (accessToken == null) {
        throw 'No Access Token found.';
      }
      if (idToken == null) {
        throw 'No ID Token found.';
      }

      return supabase.auth.signInWithIdToken(
        provider: OAuthProvider.google,
        idToken: idToken,
        accessToken: accessToken,
      );
    }
    return null;
  }

  webGoogleLogin() {
    supabase.auth.signInWithOAuth(
      OAuthProvider.google,
      redirectTo: dotenv.env['REDIRECT_URI']!,
    );
  }

  appleLogin() {
    if (Platform.isIOS) {
      supabase.auth.signInWithOAuth(
        OAuthProvider.apple,
        redirectTo: dotenv.env['REDIRECT_URI']!,
      );
    }
  }

  checkUserLogin() {
    if (supabase.auth.currentUser == null) {
      return false;
    } else {
      return true;
    }
  }

  logout(context) {
    supabase.auth.signOut();
  }
}
