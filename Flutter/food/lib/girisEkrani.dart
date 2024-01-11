import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:food/FireLib.dart';
import 'package:food/anaPanel.dart';
import 'package:gsheets/gsheets.dart';
import 'yeniKayit.dart';
import 'iletisim.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class girisEkraniClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.yellow,
          title: Center(
            child: Text(
              "YEDİHİLAL MOBİL",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            ),
          ),
        ),
        body: loginScreen());
  }
}

class loginScreen extends StatefulWidget {
  const loginScreen({super.key});

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> signIn() async {
    try {
      showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.yellow,
              backgroundColor: Colors.grey,
            ),
          );
        },
      );

      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      Navigator.of(context).pop(); // Loading ekranını kapat
    } catch (e) {
      Navigator.of(context).pop(); // Loading ekranını kapat

      // Hata mesajını kullanıcıya göster
      String errorMessage = "Bir hata oluştu. Giriş başarısız oldu.";

      if (e is FirebaseAuthException) {
        // Firebase Authentication özel hataları
        if (e.code == 'user-not-found') {
          errorMessage =
              "Kullanıcı bulunamadı. Lütfen e-posta adresinizi kontrol edin.";
        } else if (e.code == 'wrong-password') {
          errorMessage =
              "Yanlış şifre girdiniz. Lütfen şifrenizi kontrol edin.";
        } else {
          errorMessage =
              "Giriş yapılamadı. Lütfen E-mail ve şifrenizi kontrol edip tekrar deneyiniz.";
        }
      }

      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Giriş Hatası"),
            content: Text(errorMessage),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("Tamam"),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 50),

              Image.asset(
                "images/yedihilal2.png",
                width: 300,
              ),

              const SizedBox(height: 50),

              // or continue with
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        'UYGULAMAYA HOŞGELDİNİZ',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 50),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    icon: Icon(Icons.key, size: 18),
                    labelText: 'E-Mail',
                  ),
                ),
              ),

              const SizedBox(height: 25),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextFormField(
                  obscureText: true,
                  controller: passwordController,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    icon: Icon(Icons.lock, size: 18),
                    labelText: 'Password',
                  ),
                ),
              ),

              const SizedBox(height: 10),

              // forgot password?

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black, // Background color
                      ),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("Hata"),
                              content: Text('Malesef Şuanda Bu hizmet kullanılamamkta.'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text("Tamam"),
                                ),
                              ],
                            );
                          },
                        );
                        print('Yeni Şifre');
                        // Respond to button press
                      },
                      icon: Icon(Icons.add, size: 18),
                      label: Text("Yeni Şifre"),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              GestureDetector(
                child: InkWell(
                  onTap: signIn, //methot,
                  child: Container(
                    padding: const EdgeInsets.all(25),
                    margin: const EdgeInsets.symmetric(horizontal: 25),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Center(
                      child: Text(
                        "Giriş",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black, // Background color
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => yeni_kayit()));
                  

                  // Respond to button press
                },
                icon: Icon(Icons.person, size: 18),
                label: Text("Yeni Kullanici"),
              ),
              const SizedBox(height: 75),

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
      ),
    );
  }
}
