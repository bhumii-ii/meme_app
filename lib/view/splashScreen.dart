import 'package:flutter/material.dart';

class Splashscreen extends StatelessWidget {
  const Splashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network("https://images.app.goo.gl/ck5xJZmW5ShEEo947"),
            SizedBox(height: 30),
            Text("Meme Generator",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),)
          ],
        ),
      ),
    );
  }
}
