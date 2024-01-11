import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'girisEkrani.dart';
import 'anaPanel.dart';

class AnaSayfaClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          print('Giris Yapildi');
          return Home();
        } else {
          print('Sifre veya e-mail yanlış');
          return girisEkraniClass();
        }
      },
    );
  }
}
