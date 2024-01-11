import 'dart:html';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:social_media_flutter/social_media_flutter.dart';

final Uri harita_url = Uri.parse(
    'https://www.google.com/maps/place/YediHilal/@41.0243787,29.0106278,16.22z/data=!4m6!3m5!1s0x14cab7890ee18e5b:0x795e805fc26becf9!8m2!3d41.024225!4d29.014771!16s%2Fg%2F11b7cgdr9m?entry=ttu');
final Uri web_url = Uri.parse("https://yedihilal.org/");
final Uri inst_url = Uri.parse("https://www.instagram.com/yedihilal/");
final Uri twi_url = Uri.parse("https://twitter.com/YediHilal");
final Uri face_url = Uri.parse("https://www.facebook.com/yedihilal");

class iletisim_widget extends StatelessWidget {
  const iletisim_widget({super.key});

  @override
  Widget build(BuildContext context) {
    void openurl() async {
      if (!await launchUrl(harita_url)) {
        throw Exception('Could not launch $harita_url');
      }
    }

    void openurl2() async { //web url acicisi
      if (!await launchUrl(web_url)) {
        throw Exception('Could not launch $web_url');
      }
    }

    void openurl3() async {
      if (!await launchUrl(inst_url)) {
        throw Exception('Could not launch $inst_url');
      }
    }

    void openurl4() async {
      if (!await launchUrl(twi_url)) {
        throw Exception('Could not launch $twi_url');
      }
    }

    void openurl5() async {
      if (!await launchUrl(face_url)) {
        throw Exception('Could not launch $face_url');
      }
    }

    return Scaffold(
        body: Center(
      child: Column(
        children: [
          Material(
            borderRadius: BorderRadius.circular(28),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: InkWell(
              onTap: openurl,
              child: Image.asset(
                'images/yedihilallocation.png',
                height: 175,
                width: 400,
              ),
            ),
          ),
          // Text("\n"),
          Container(
            //Konum
            child: InkWell(
                child: Padding(
              padding: EdgeInsets.all(15.0),
              child: Row(
                children: [
                  Expanded(
                    child: Icon(
                      Icons.location_on,
                      size: 30,
                      color: Color.fromARGB(255, 34, 82, 226),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                      "Mimar Sinan, Uncular Cd. No12, 34672 Üsküdar/İstanbul",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            )),
          ),
          Container(
            //Telefon
            child: InkWell(
                onTap: () {},
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Icon(
                          Icons.phone,
                          size: 30,
                          color: Color.fromARGB(255, 25, 221, 55),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Text(
                          "(0216) 201 14 24",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
          ),
          Container(
            //Mail
            child: InkWell(
                onTap: () {},
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Icon(
                          Icons.mail,
                          size: 30,
                          color: Color.fromARGB(255, 222, 21, 31),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Text(
                          "info@yedihilal.org",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
          ),
          Container(
            //twitter
            child: InkWell(
                onTap: openurl4,
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Icon(
                          Icons.close,
                          size: 25,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Text(
                          "@yedihilal",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
          ),
          Container(
            //instagram
            child: InkWell(
                onTap: openurl3,
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Icon(
                          Icons.camera_alt,
                          size: 30,
                          color: Color.fromARGB(255, 198, 135, 8),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Text(
                          "@yedihilal",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
          ),
          Container(
            //Facebook
            child: InkWell(
                onTap: openurl5,
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Icon(
                          Icons.facebook,
                           color: Color.fromARGB(255, 34, 82, 226),
                          size: 30,
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Text(
                          "@yedihilal",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
          ),
          Container(
            //link
            child: InkWell(
                onTap: openurl2,
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Icon(
                          Icons.link,
                          size: 30,
                          color: Color.fromARGB(255, 34, 82, 226),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Text(
                          "yedihilal.org",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
          ),
        ],
      ),
    ));
  }
}
