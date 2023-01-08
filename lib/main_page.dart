import 'package:bmicalculator/constant.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int height = 150;
  int weight = 75;
  String gender = '';
  late double bmi = calculateBMI(height: height, weight: weight);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        color: Colors.white,
        child: Column(children: [
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    gender = "M";
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: gender == "M"
                        ? Colors.orange.withAlpha(100)
                        : Colors.orange.withAlpha(50),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: const [Icon(Icons.male, size: 150), Text("Male")],
                  ),
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  setState(() {
                    gender = "F";
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: gender == "F"
                        ? Colors.orange.withAlpha(100)
                        : Colors.orange.withAlpha(50),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: const [
                      Icon(Icons.female, size: 150),
                      Text("Female")
                    ],
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const Text("Height"),
                    Text(
                      "$height",
                      style: kTextInputColor,
                    ),
                    Row(
                      children: [
                        FloatingActionButton(
                            onPressed: () {
                              setState(() {
                                if (height > 50) height--;
                                bmi = calculateBMI(
                                    height: height, weight: weight);
                              });
                            },
                            child: const Icon(Icons.remove, size: 40)),
                        const SizedBox(width: 10),
                        FloatingActionButton(
                            onPressed: () {
                              setState(() {
                                if (height < 300) height++;
                                bmi = calculateBMI(
                                    height: height, weight: weight);
                              });
                            },
                            child: const Icon(Icons.add, size: 40)),
                      ],
                    )
                  ],
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const Text("Weight"),
                    Text(
                      "$weight",
                      style: kTextInputColor,
                    ),
                    Row(
                      children: [
                        FloatingActionButton(
                            onPressed: () {
                              setState(() {
                                weight--;
                                bmi = calculateBMI(
                                    height: height, weight: weight);
                              });
                            },
                            child: const Icon(Icons.remove, size: 40)),
                        const SizedBox(width: 10),
                        FloatingActionButton(
                            onPressed: () {
                              setState(() {
                                weight++;
                                bmi = calculateBMI(
                                    height: height, weight: weight);
                              });
                            },
                            child: const Icon(Icons.add, size: 40)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          Column(
            children: [
              Text("BMI"),
              Text("${bmi.toStringAsFixed(2)}",
                  style: kTextInputColor.copyWith(
                      color: kTextOutputColor, fontSize: 60)),
              Text(getResult(bmi)),
            ],
          )
        ]),
      )),
    );
  }

  double calculateBMI({required int height, required int weight}) {
    return (weight / (height * height)) * 10000;
  }

  static String getResult(bmiValue) {
    if (bmiValue >= 25) {
      return "Overweight";
    } else if (bmiValue >= 18.5) {
      return "Normal";
    } else {
      return "Underwight";
    }
  }
}
