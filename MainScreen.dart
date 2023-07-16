import 'dart:html';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'MyHeaderDrawer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ana Ekran',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 113, 187, 219)),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int state = 0; //Navigasyon çubuğu numarasının ilk durumu
  void yukariyapasla(int index) {
    setState(() {
      state =
          index; // navigasyon çubuğundan imdex ile gelen gerçek numara state atandı
      //print(state);
    });
  }

  //Aşağıdaki liste sayesinde 'body i kontrol ediyoruz'
  final List<Widget> sayfalar = [
    Center(
      child: Text("Ana Sayfa"), //0
    ),
    Center(
      child: Text("Portfolyom"), //1
    ),
    Center(
      child: Text("Görevlerim"), //2
    ),
    Center(
      child: Text("Profil"), //3 //drawbar
    ),
    Center(
      child: Text("Etkinlikler"), //4 //drawbar
    ),
    Center(
      child: Text("Sıralamalar"), //5 //drawbar
    ),
    Center(
      child: Text("Duyurular"), //6 //drawbar
    ),
    Center(
      child: Text("Haberler"), //7 //drawbar
    ),
    Center(
      child: Text("Ezgi/Marş Kitapçığı"), //8 //drawbar
    ),
    Center(
      child: Text("İletişim"), //9 //drawbar
    ),
    Center(
      child: Text("Ayarlar"), //10 //drawbar
    ),
    Center(
      child: Text("Hakkında"), //11 //drawbar
    ),
    Center(
      child: Text("Bildirimler"), //12 //drawbar
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.yellow,
          actions: [
            IconButton(
                icon: Icon(Icons.notifications),
                tooltip: 'Bildirimler',
                onPressed: () {
                  yukariyapasla(12);
                })
          ],
          title: Center(
            child: Image.asset(
              'images/yedihilal2.png',
              height: 40,
              width: 200,
            ),
          )),
      body: sayfalar[state],
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Container(
            child: Column(children: [MyHeaderDrawer(), MyDrawerList()]),
          ),
        ),
      ),
      bottomNavigationBar: GNav(
        duration: Duration(milliseconds: 400),
        gap: 8,

        //Alt Navigasyon çubuğundaki her lognun numarasını yukariyapasla() ile yukariya gönderdik
        onTabChange: (a) {
          yukariyapasla(a);
        },

        activeColor: Colors.white,
        backgroundColor: Colors.yellow,
        tabBackgroundColor: Colors.black,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        tabs: [
          GButton(
            icon: Icons.home,
            text: "Ana Sayfa",
          ),
          GButton(
            icon: Icons.star,
            text: "Portfolyom",
          ),
          GButton(icon: Icons.assignment, text: "Görevlerim"),
        ],
      ),
    );
  }

  Widget MyDrawerList() {
    return Container(
      padding: EdgeInsets.only(top: 15),
      child: Column(
        children: [menuItem()],
        //Menü Drawerinin sistesini gösterir
      ),
    );
  }

  Widget menuItem() {
    return Material(
        child: Column(
      children: [
        Container(
          //Ana Sayfa
          child: InkWell(
              onTap: () {
                yukariyapasla(0);
                Navigator.pop(context);
              },
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Icon(
                        Icons.home,
                        size: 20,
                        color: Colors.black,
                      ),
                    ),
                    Expanded(
                        flex: 3,
                        child: Text(
                          "Ana Sayfa",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ))
                  ],
                ),
              )),
        ),
        Container(
          //Profil
          child: InkWell(
              onTap: () {
                yukariyapasla(3);
                Navigator.pop(context);
              },
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Icon(
                        Icons.account_circle,
                        size: 20,
                        color: Colors.black,
                      ),
                    ),
                    Expanded(
                        flex: 3,
                        child: Text(
                          "Profil",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ))
                  ],
                ),
              )),
        ),
        Container(
          //Etkinlikler
          child: InkWell(
              onTap: () {
                yukariyapasla(4);
                Navigator.pop(context);
              },
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Icon(
                        Icons.local_activity,
                        size: 20,
                        color: Colors.black,
                      ),
                    ),
                    Expanded(
                        flex: 3,
                        child: Text(
                          "Etkinlikler",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ))
                  ],
                ),
              )),
        ),
        Container(
          //Sıralamalar
          child: InkWell(
              onTap: () {
                yukariyapasla(5);
                Navigator.pop(context);
              },
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Icon(
                        Icons.bar_chart,
                        size: 20,
                        color: Colors.black,
                      ),
                    ),
                    Expanded(
                        flex: 3,
                        child: Text(
                          "Sıralamalar",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ))
                  ],
                ),
              )),
        ),
        Container(
          //Duyurular
          child: InkWell(
              onTap: () {
                yukariyapasla(6);
                Navigator.pop(context);
              },
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Icon(
                        Icons.import_contacts,
                        size: 20,
                        color: Colors.black,
                      ),
                    ),
                    Expanded(
                        flex: 3,
                        child: Text(
                          "Duyurular",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ))
                  ],
                ),
              )),
        ),
        Container(
          //Haberler
          child: InkWell(
              onTap: () {
                yukariyapasla(7);
                Navigator.pop(context);
              },
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Icon(
                        Icons.newspaper,
                        size: 20,
                        color: Colors.black,
                      ),
                    ),
                    Expanded(
                        flex: 3,
                        child: Text(
                          "Haberler",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ))
                  ],
                ),
              )),
        ),
        Container(
          //Ezmi/Marş
          child: InkWell(
              onTap: () {
                yukariyapasla(8);
                Navigator.pop(context);
              },
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Icon(
                        Icons.book_online,
                        size: 20,
                        color: Colors.black,
                      ),
                    ),
                    Expanded(
                        flex: 3,
                        child: Text(
                          "Ezgi/Marş Kitapçığı",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ))
                  ],
                ),
              )),
        ),
        Container(
          //İletişim
          child: InkWell(
              onTap: () {
                yukariyapasla(9);
                Navigator.pop(context);
              },
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Icon(
                        Icons.phone,
                        size: 20,
                        color: Colors.black,
                      ),
                    ),
                    Expanded(
                        flex: 3,
                        child: Text(
                          "İletişim",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ))
                  ],
                ),
              )),
        ),
        Container(
          //Ayarlar
          child: InkWell(
              onTap: () {
                yukariyapasla(10);
                Navigator.pop(context);
              },
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Icon(
                        Icons.settings,
                        size: 20,
                        color: Colors.black,
                      ),
                    ),
                    Expanded(
                        flex: 3,
                        child: Text(
                          "Ayarlar",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ))
                  ],
                ),
              )),
        ),
        Container(
          //Hakkında
          child: InkWell(
              onTap: () {
                yukariyapasla(11);
                Navigator.pop(context);
              },
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Icon(
                        Icons.info,
                        size: 20,
                        color: Colors.black,
                      ),
                    ),
                    Expanded(
                        flex: 3,
                        child: Text(
                          "Hakkında",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ))
                  ],
                ),
              )),
        ),
        Container(
            child: Image.asset(
          'images/yedihilal2.png',
          width: 160,
          height: 100,
        )),
      ],
    ));
  }
}
