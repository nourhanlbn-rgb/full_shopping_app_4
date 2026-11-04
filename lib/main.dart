import 'package:flutter/material.dart';

import 'router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(routerConfig: router);
  }
}

// في التجربة الاولى push then pop
// console
//  start Login
//  start Signup
//  finish Signup
// login page wasn't disposed because push puts Signup on top of it in the stack

// التجربة التانية  go then pop
// console
// start Login
// start Signup
// finish Login
// then GoError: "There is nothing to pop"
// go replaced the whole stack, so login was disposed and
// there was nothing under Signup to return to

// التجربة التالتة go("/signup") then go("/login")
// console
// start Login
// start Signup
// finish Login
// start Login
// finish Signup
// No error new login page is created
// because go replaced the whole stack instead of returning to the old page

// التجربة الرابعة push then the AppBar back arrow
// console
//  start Login
//  start Signup
//  finish Signup
// back arrow does a pop() and remove Signup and Login was still under it in the stack
