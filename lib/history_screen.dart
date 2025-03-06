import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'calculator_screen.dart';

class HistoryScreen extends StatelessWidget {
  final CalculatorController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("History")),
      body: Obx(() {
        return ListView.builder(
          itemCount: controller.history.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(controller.history[index]),
              trailing: IconButton(
                icon: Icon(Icons.delete),
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
