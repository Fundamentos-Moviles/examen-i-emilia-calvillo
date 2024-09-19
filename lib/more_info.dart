import 'package:flutter/material.dart';

class MoreInfo extends StatefulWidget {
  const MoreInfo({super.key});

  @override
  State<MoreInfo> createState() => _MoreInfoState();
}

class _MoreInfoState extends State<MoreInfo> {
  int clickCount = 0;
  List<List<Color>> containers = [];

  void _onButtonPressed() {
    setState(() {
      clickCount++;

      int sections = (clickCount % 12 == 0) ? 12 : clickCount % 12;

      List<Color> currentContainer = List.generate(
        sections,
            (index) => index % 2 == 0 ? Colors.white : Colors.black,
      );

      if (sections == 1) {
        containers.add(currentContainer);
      } else {
        containers[containers.length - 1] = currentContainer;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30.0),
          child: Column(
            children: [
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'No digas su nombre',
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 15.0),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        fixedSize: Size(200, 50),
                      ),
                      onPressed: _onButtonPressed,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.warning, color: Colors.white),
                          SizedBox(width: 10),
                          Text(
                            'Beetlejuice',
                            style: TextStyle(fontSize: 15.0, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15.0),
                  ],
                ),
              ),
              Column(
                children: containers.map((colors) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Row(
                      children: colors
                          .map(
                            (color) => Expanded(
                          child: Container(
                            height: 300.0,
                            color: color,
                          ),
                        ),
                      )
                          .toList(),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
