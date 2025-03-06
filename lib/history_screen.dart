import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'calculator_screen.dart';

class HistoryScreen extends StatelessWidget {
  final CalculatorController controller = Get.find();

  HistoryScreen({super.key});

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
            "History",
            style: TextStyle(color: Colors.yellow.shade700),
          )),
      body: Obx(() {
        return ListView.builder(
          itemCount: controller.history.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                controller.history[index],
                style: TextStyle(color: Colors.white),
              ),
              trailing: IconButton(
                icon: Icon(
                  Icons.delete,
                  color: Colors.yellow.shade900,
                ),
                onPressed: () {
                  controller.history.removeAt(index);
                },
              ),
            );
          },
        );
      }),
    );
  }
}
