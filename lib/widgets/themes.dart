import 'package:flutter/material.dart';
import 'package:todo/widgets/theme_color.dart';

class Themes extends StatelessWidget {
  const Themes({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color:
              Theme.of(context).colorScheme.primaryContainer.withOpacity(0.2),
        ),
        child: const Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 5),
                child: Text("Themes",
                    textAlign: TextAlign.start,
                    style:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 16)),
              ),
              SizedBox(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ThemeColor(Color.fromARGB(255, 116, 204, 255)),
                      ThemeColor(Color.fromARGB(255, 188, 116, 255)),
                      ThemeColor(Color.fromARGB(255, 59, 242, 248)),
                      ThemeColor(Color.fromARGB(255, 248, 59, 147)),
                      ThemeColor(Color.fromARGB(255, 159, 255, 167)),
                      ThemeColor(Color.fromARGB(255, 255, 193, 123)),
                      ThemeColor(Color.fromARGB(255, 69, 156, 255)),
                      ThemeColor(Color.fromARGB(255, 253, 0, 76)),
                      ThemeColor(Color.fromARGB(255, 0, 59, 126)),
                      ThemeColor(Color.fromARGB(255, 3, 97, 15)),
                      ThemeColor(Color.fromARGB(255, 163, 60, 1)),
                      ThemeColor(Color.fromARGB(255, 163, 1, 1)),
                    ],
                  ),
                ),
              )
            ]),
      ),
    );
  }
}
