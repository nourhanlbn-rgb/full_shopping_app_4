// Hidden bug:
// The user enter Home with go("/home") so the stack contains only Home
// The old button called pop() which tried to remove the only page in the
// stack and threw "There is nothing to pop"
// The fix is a Logout button that sets isLoggedIn = false and uses go("/login") to replace the stack

// go vs push (stack)
// push() add a new page on top of the stack so the old page stay
// underneath and pop() returns to it
// go() replaces the whole stack with the new page
// so nothing is left underneath to pop back to

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'test.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});
  @override
  State<ProductsPage> createState() {
    return _ProductsPageState();
  }
}

class _ProductsPageState extends State<ProductsPage> {
  @override
  void initState() {
    print("start Products");
    super.initState();
  }

  @override
  void dispose() {
    print("finish Products");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text("welcome to Products Page"),
            // ElevatedButton(
            //   onPressed: () {
            //     context.pop();
            //   },
            //   child: Text("go back"),
            // ),
            ElevatedButton(
              onPressed: () {
                Database.isLoggedIn = false;
                context.go("/login");
              },
              child: const Text("Logout"),
            ),
          ],
        ),
      ),
    );
  }
}
