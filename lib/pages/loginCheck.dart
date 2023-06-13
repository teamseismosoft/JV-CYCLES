import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jv_cycles/pages/errorPage.dart';
import 'package:jv_cycles/pages/loginPage.dart';
import 'package:jv_cycles/services/auth.dart';

class LoginCheckPage extends StatefulWidget {
  LoginCheckPage({
    super.key,
    required this.page,
  });

  Widget page;

  @override
  State<LoginCheckPage> createState() => _LoginCheckPageState();
}

class _LoginCheckPageState extends State<LoginCheckPage> {
  Timer? timer;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  Future checkverified() async {
    User? user = Auth().currentUser!;
    await user.reload();
    setState(() {
      bool isVerified = user.emailVerified;
      if (isVerified) {
        timer?.cancel();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => widget.page,
          ),
        );
      }
    });
  }

  void signOut() async {
    await Auth().signOut();
  }

  void sendVerification() async {
    try {
      final user = Auth().currentUser;
      await user?.sendEmailVerification();
      var snack = const SnackBar(content: Text('Sending verification email'));
      ScaffoldMessenger.of(context).showSnackBar(snack);
    } catch (e) {
      var snack = SnackBar(content: Text('Error : $e'));
      ScaffoldMessenger.of(context).showSnackBar(snack);
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Auth().authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          User? user = Auth().currentUser;
          bool isVerified = user!.emailVerified;
          if (!isVerified) {
            timer = Timer.periodic(
              const Duration(seconds: 5),
              (_) => checkverified(),
            );
            return ErrorPage(
              buttonMessage: 'Sign Out',
              message: 'Account Not Verified',
              email: user.email!,
              onPressed: () {
                signOut();
              },
              retry: () {
                sendVerification();
              },
              retryMessage: 'Resend email',
            );
          } else {
            return widget.page;
          }
        } else if (!snapshot.hasData) {
          return LoginPage(pageKey: 1);
        } else {
          return const Center(
            child: SizedBox(
              height: 90,
              width: 90,
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
