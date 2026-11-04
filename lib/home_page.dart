import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    print("start Home");
    super.initState();
  }

  @override
  void dispose() {
    print("finish Home");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text("welcome to Home Page"),
            ElevatedButton(
              onPressed: () {
                context.pop();
              },
              child: Text("go back"),
            ),
          ],
        ),
      ),
    );
  }
}
