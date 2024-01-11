import 'dart:js';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:fluttertoast/fluttertoast.dart';

Future girisYap(val1, val2) async {
  
  // val1: hangi e mail le giris?
  // val2: hangi pasword le giris ?
}

void showToastMessage(String message) => Fluttertoast.showToast(
    msg: message, 
    toastLength: Toast.LENGTH_SHORT, 
    gravity: ToastGravity.SNACKBAR,
    timeInSecForIosWeb: 5,
    backgroundColor: Colors.grey,
    textColor: Colors.white,
    );

