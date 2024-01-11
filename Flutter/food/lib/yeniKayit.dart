import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'girisEkrani.dart';

class yeni_kayit extends StatelessWidget {
  const yeni_kayit({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.yellow,
          automaticallyImplyLeading: false,
          title: Center(
            child: Text(
              'Yeni Kayıt',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            ),
          )),
      body: kayit_kutulari(),
    );
  }
}

class kayit_kutulari extends StatefulWidget {
  const kayit_kutulari({super.key});

  @override
  State<kayit_kutulari> createState() => _kayit_kutulariState();
}

class _kayit_kutulariState extends State<kayit_kutulari> {
  //text kutusundan veri almak için controller kullanıyoruz
  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController okulController = TextEditingController();
  TextEditingController dogumController = TextEditingController();
  TextEditingController telController = TextEditingController();
  TextEditingController kullaniciadiController = TextEditingController();
  TextEditingController sifre1Controller = TextEditingController();
  TextEditingController sifre2Controller = TextEditingController();
  TextEditingController yasController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    surnameController.dispose();
    emailController.dispose();
    okulController.dispose();
    dogumController.dispose();
    telController.dispose();
    kullaniciadiController.dispose();
    sifre1Controller.dispose();
    sifre2Controller.dispose();
    yasController.dispose();

    super.dispose();
  }

  Future<void> signUp() async {
    try {
      if (sifre1Controller.text.trim() == sifre2Controller.text.trim()) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: sifre1Controller.text,
        );
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Kayıt Başarılı"),
              content: Text(
                  'Profiliniz başarı ile oluşturuldu. Lütfen giriş sayfasına dönüp giriş yapınız.'),
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
        addNewUser(
          nameController.text.trim(),
          surnameController.text.trim(),
          emailController.text.trim(),
          okulController.text.trim(),
          int.parse(yasController.text.trim()),
          dogumController.text.trim(),
          int.parse(telController.text.trim()),
          kullaniciadiController.text.trim(),
        );
      } else {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Hata"),
              content: Text('İki şifre birbiri ile uyuşmuyor.'),
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
    } catch (error) {
      if (error is FirebaseAuthException) {
        if (error.code == 'weak-password') {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("Hata"),
                content: Text('Şifre zayıf. Daha güçlü bir şifre seçiniz.'),
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
        } else if (error.code == 'email-already-in-use') {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("Hata"),
                content: Text('Bu e-posta adresi zaten kullanımda.'),
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
        } else {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("Hata"),
                content: Text('Bilgileri Eksiksiz doldurunuz.'),
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
    }
  }

  Future addNewUser(String ad, String soyad, String email, String okul, int yas,
      String dogumt, int tel, String kullaniciad) async {
    await FirebaseFirestore.instance.collection('user').add({
      'Ad': ad,
      'Soyad': soyad,
      'E-Mail': email,
      'Okul': okul,
      'Yas': yas,
      'DogumT': dogumt,
      'Telefon': tel,
      'KullaniciAdi': kullaniciad,
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              Image.asset(
                "images/sancaktar.png",
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
                        'Bilgileri doldurunuz',
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

              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    icon: Icon(Icons.person, size: 18),
                    labelText: 'Ad',
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextFormField(
                  controller: surnameController,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    icon: Icon(Icons.group, size: 18),
                    labelText: 'Soyad',
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    icon: Icon(Icons.mail, size: 18),
                    labelText: 'E-Mail',
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextFormField(
                  controller: yasController,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    icon: Icon(Icons.accessibility, size: 18),
                    labelText: 'Yaş',
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextFormField(
                  controller: okulController,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    icon: Icon(Icons.school, size: 18),
                    labelText: 'Okul',
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextFormField(
                  controller: dogumController,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    icon: Icon(Icons.calendar_month, size: 18),
                    labelText: 'Doğum Tarihi (Ex: 30.01.2004)',
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextFormField(
                  controller: telController,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    icon: Icon(Icons.phone, size: 18),
                    labelText: 'Telefon (Başında 0 olmadan birleşik)',
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextFormField(
                  controller: kullaniciadiController,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    icon: Icon(Icons.key, size: 18),
                    labelText: 'Kullanıcı Adı',
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextFormField(
                  obscureText: true,
                  controller: sifre1Controller,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    icon: Icon(Icons.lock, size: 18),
                    labelText: 'Şifre',
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextFormField(
                  obscureText: true,
                  controller: sifre2Controller,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    icon: Icon(Icons.lock, size: 18),
                    labelText: 'Şifre Tekrar',
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        color: Color.fromARGB(255, 233, 49, 49),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        'LÜtfen Bilgilerinizin Doğruluğunu Konrtol Ediniz',
                        style:
                            TextStyle(color: Color.fromARGB(255, 233, 49, 49)),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        color: Color.fromARGB(255, 233, 49, 49),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                child: InkWell(
                  onTap: signUp,
                  child: Container(
                    padding: const EdgeInsets.all(25),
                    margin: const EdgeInsets.symmetric(horizontal: 25),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 65, 163, 70),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Center(
                      child: Text(
                        "Kayıt",
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
              const SizedBox(height: 10),
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => girisEkraniClass()));
                  },
                  child: Text('Giriş Sayfası'),
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
