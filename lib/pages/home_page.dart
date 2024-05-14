import 'dart:math';

import 'package:dars35/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime date = DateTime.now();
  bool isX = true;
  // String box1 = "";
  // String box2 = "";
  // String box3 = "";

  List<String> boxes = [
    "",
    "",
    "",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text("35-Dars"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Gap(20),
          TextButton(
            onPressed: () async {
              //? Vaqt tanlash
              // TimeOfDay? time = await showTimePicker(
              //   context: context,
              //   initialTime: TimeOfDay.now(),
              // );

              // print(time);

              //? Sana tanlash
              DateTime? newDate = await showDatePicker(
                context: context,
                firstDate: DateTime(1000),
                lastDate: DateTime(2025),
                currentDate: DateTime.now(),
              );

              if (newDate != null) {
                date = newDate;
                setState(() {});
              }

              // print(date);

              //? Oraliq sanalarni tanlash
              // DateTimeRange? range = await showDateRangePicker(
              //   context: context,
              //   firstDate: DateTime(2024, 05, 14),
              //   lastDate: DateTime(2024, 12, 30),
              // );

              // print(range!.duration.inDays);
            },
            child: Text(
              date.format(),
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {},
                  style: IconButton.styleFrom(
                    foregroundColor: Colors.grey,
                    side: const BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  icon: const Icon(
                    Icons.keyboard_arrow_left,
                    size: 40,
                  ),
                ),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "4,950,000",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        height: 0.7,
                      ),
                    ),
                    Text(
                      "so'm",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {},
                  style: IconButton.styleFrom(
                    foregroundColor: Colors.grey,
                    side: const BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  icon: const Icon(
                    Icons.keyboard_arrow_right,
                    size: 40,
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    int randomNumber = Random().nextInt(3);
                    if (isX) {
                      boxes[0] = "X";
                      boxes[randomNumber] = "O";
                    } else {
                      boxes[0] = "O";
                      boxes[randomNumber] = "X";
                    }
                    isX = !isX;

                    setState(() {});
                  },
                  child: Container(
                    color: Colors.amber,
                    padding: EdgeInsets.all(20),
                    child: Text(boxes[0]),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    if (isX) {
                      boxes[1] = "X";
                    } else {
                      boxes[1] = "O";
                    }
                    isX = !isX;
                    setState(() {});
                  },
                  child: Container(
                    color: Colors.blue,
                    padding: EdgeInsets.all(20),
                    child: Text(boxes[1]),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    if (isX) {
                      boxes[2] = "X";
                    } else {
                      boxes[2] = "O";
                    }
                    isX = !isX;
                    setState(() {});
                  },
                  child: Container(
                    color: Colors.red,
                    padding: EdgeInsets.all(20),
                    child: Text(boxes[2]),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
