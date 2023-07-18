import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: baslik(),
    );
  }
}

void main() {
  runApp(MyApp());
}

class baslik extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Center(
          child: Text("Yedi Hilal Mobile"),
        )),
        body: loginScreen());
  }
}

class loginScreen extends StatefulWidget {
  const loginScreen({super.key});

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //Text("\n"),
            Image.asset(
              "images/yediHilal.png",
              height: 200,
              width: 500,
            ),
            Text("\n"),
            Text(
              "UYGULAMAYA HOŞ GELDİNİZ",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            Text("\n"),
            TextFormField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                icon: Icon(Icons.mail, size: 18),
                labelText: 'E-MAIL',
              ),
            ),
            Text("\n"),
            TextFormField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                icon: Icon(Icons.lock, size: 18),
                labelText: 'SIFRE',
              ),
            ),
            Text("\n"),
            ElevatedButton.icon(
              onPressed: () {
                // Respond to button press
              },
              icon: Icon(Icons.home, size: 18),
              label: Text("Giris"),
            ),
            Text("\n"),
            ElevatedButton.icon(
              onPressed: () {
                // Respond to button press
              },
              icon: Icon(Icons.new_label, size: 18),
              label: Text("Sifremi Unuttum"),
            ),
            Text("\n"),
            ElevatedButton.icon(
              onPressed: () {
                // Respond to button press
              },
              icon: Icon(Icons.person, size: 18),
              label: Text("Yeni Kullanici"),
            ),
            Text("\n"),
            Text(
              "Powered By Yedi Hilal Bursa",
              style: const TextStyle(
                  fontSize: 12,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
