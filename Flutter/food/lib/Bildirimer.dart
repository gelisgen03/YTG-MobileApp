import 'package:flutter/material.dart';

class Bildirimler_widget extends StatelessWidget {
  const Bildirimler_widget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(children: [Text('\n'),Text('\n'),Text('\n'),Text('\n'),Text('\n'),Text('\n'),Center(child: Image.asset('images/coming.png',height: 150,
      width: 150,))],),
      ),
    );
  }
}