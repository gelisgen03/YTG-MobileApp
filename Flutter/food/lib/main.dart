import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food/anaSayfa.dart';
import 'girisEkrani.dart';
import 'anaPanel.dart';
import 'firebase_options.dart';
import 'FireLib.dart';
import 'package:fluttertoast/fluttertoast.dart';

//Navigator.push(context,MaterialPageRoute(builder: (context) =>Home())); //Home Screen e yönlendirme
final FirebaseOptions firebaseOptions = FirebaseOptions(
  apiKey: 'AIzaSyCXK6wewlBhaB7Tq0K-smzXo3luw0clbEU',
  authDomain: 'yedihilal-database.firebaseapp.com',
  databaseURL:
      'https://console.firebase.google.com/u/0/project/yedihilal-database',
  projectId: 'yedihilal-database',
  storageBucket: 'yedihilal-database.appspot.com',
  messagingSenderId: '693859906725',
  appId: '1:693859906725:android:9d00dee9eca48892e7c94c',
  measurementId: 'YOUR_MEASUREMENT_ID', // Optional for Analytics
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnaClass(),
    );
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: firebaseOptions);
  runApp(MyApp());
}



class AnaClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Home();
          } else {
            return girisEkraniClass();
          }
      },
    );
  }
}
