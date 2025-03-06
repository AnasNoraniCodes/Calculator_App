import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:math_expressions/math_expressions.dart';
import 'history_screen.dart';
import 'reuseable_wigets.dart';


void main() {
  runApp(CalculatorScreen());
}

// Controller for State Management
class CalculatorController extends GetxController {
  var input = ''.obs; // Holds user input
  var output = ''.obs; // Holds result
  var history = <String>[].obs; // Stores previous calculations

  // Function to handle button taps
  void onButtonPressed(String value) {
    if (value == "C") {
      input.value = "";
      output.value = "";
    } else if (value == "⌫") {
      if (input.isNotEmpty) {
        if (input.value.isNotEmpty) {
          input.value = input.value.substring(0, input.value.length - 1);
        }

      }
    } else if (value == "=") {
      calculateResult();
    } else {
      input.value += value;
    }
  }

  // Function to evaluate the mathematical expression
  void calculateResult() {
    try {
      String formattedInput = input.value.replaceAll('×', '*').replaceAll('÷', '/');
      Parser p = Parser();
      Expression exp = p.parse(formattedInput);
      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);
      output.value = eval.toString();

      // Add to history
      history.add("${input.value} = ${output.value}");
    } catch (e) {
      output.value = "Error";
    }
  }
}

// Calculator Screen
class CalculatorScreen extends StatelessWidget {
  final CalculatorController controller = Get.put(CalculatorController());

  final List<String> buttons = [
    "C", "⌫", "(", ")",
    "7", "8", "9", "÷",
    "4", "5", "6", "×",
    "1", "2", "3", "-",
    "0", ".", "=", "+"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator App"),
        actions: [
          IconButton(
            icon: Icon(Icons.history),
            onPressed: () {
              Get.to(() => HistoryScreen());
            },
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AboutScreen()),
              );
            },
            child: Text("About"),
          ),

        ],
      ),
      body: Column(
        children: [
          // Display Input & Output
          Expanded(
            child: Container(
              padding: EdgeInsets.all(16),
              alignment: Alignment.bottomRight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Obx(() => Text(
                    controller.input.value,
                    style: TextStyle(fontSize: 32),
                  )),
                  SizedBox(height: 10),
                  Obx(() => Text(
                    controller.output.value,
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  )),
                ],
              ),
            ),
          ),

          // Calculator Buttons
          Expanded(
            flex: 2,
            child: GridView.builder(
              itemCount: buttons.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                childAspectRatio: 1.3,
              ),
              itemBuilder: (context, index) {
                return CalculatorButton(
                  text: buttons[index],
                  onTap: () => controller.onButtonPressed(buttons[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// Reusable Calculator Button
class CalculatorButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  CalculatorButton({required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.blueGrey.shade100,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
