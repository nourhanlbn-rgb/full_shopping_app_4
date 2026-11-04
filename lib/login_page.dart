// super.key passes the optional key parameter to the parent class (StatefulWidget)
// key help flutter identify a widget in the tree
// Global key is a special type of key that gives access to the widget's state from snywhere
// _keyForm is a globalkey <FormState>

// const means the widget is a compile-time constant
// Flutter creates it once and reuses it instead of rebuilding it every time

// _  makes a name private to its file

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'test.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  final _keyForm = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  void _inputCheck() {
    if (_keyForm.currentState!.validate()) {
      final username = _usernameController.text;
      final password = _passwordController.text;
      if (username == Database.username && password == Database.password) {
        Database.isLoggedIn = true;
        context.go("/home");
      } else {
        _usernameController.clear();
        _passwordController.clear();
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Wrong info")));
      }
    }
  }

  @override
  void initState() {
    print(" start Login");
    super.initState();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    print(" finish Login");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: _keyForm,
          child: Column(
            children: [
              TextFormField(
                controller: _usernameController,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "please enter valid username ";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _passwordController,
                validator: (value) {
                  if (((value?.length) ?? 0) < 6) {
                    return "please enter valid password";
                  }
                  return null;
                },
                obscureText: true,
              ),
              ElevatedButton(
                onPressed: _inputCheck,
                child: const Text("go to home "),
              ),
              TextButton(
                onPressed: () {
                  context.push("/signup");
                  // context.go("/signup");
                },
                child: const Text("Don't have an account? Sign up"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
