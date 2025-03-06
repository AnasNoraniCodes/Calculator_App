import 'package:flutter/material.dart';

import 'calculator_screen.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CalculatorScreen(),
                  ));
            },
            icon: Icon(
              Icons.navigate_before_outlined,
              color: Colors.yellow.shade700,
            ),
          ),
          backgroundColor: Colors.black,
          title: Text(
            "About me",
            style: TextStyle(color: Colors.yellow.shade700),
          )),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Calculator App",
                style: TextStyle(
                    color: Colors.yellow.shade700,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text("Created by: AnasCodes",
                style: TextStyle(color: Colors.yellow.shade700, fontSize: 16)),
            Text("GitHub: github.com/AnasNoraniCodes",
                style: TextStyle(color: Colors.yellow.shade700, fontSize: 16))
          ],
        ),
      ),
    );
  }
}
