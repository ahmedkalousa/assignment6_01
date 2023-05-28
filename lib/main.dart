import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Rock Paper Scissors",
          ),
          backgroundColor: Colors.amber,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({super.key});

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int? img_num;
  int? img_num2;
  List<Icon> icons = [];

  @override
  void initState() {
    int? img_num = 1;
    int? img_num2 = 1;
    List<Icon> icons = [];
  }

  void rand() {
    setState(() {
      img_num = Random().nextInt(3) + 1;
      img_num2 = Random().nextInt(3) + 1;
      if (icons.length == 10) {
        icons.clear();
      }
      icons.add(getIcon());
      if (icons.length == 10) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Game App'),
              content: Text('Done.. \n\n Try Again'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      }
    });
  }

  Icon getIcon() {
    if (img_num == 1 && img_num2 == 2) {
      return Icon(
        Icons.thumb_up,
        color: Colors.green,
        size: 30,
      );
    } else if (img_num == 1 && img_num2 == 3) {
      return Icon(
        Icons.thumb_down,
        color: Colors.red,
        size: 30,
      );
    } else if (img_num == 2 && img_num2 == 1) {
      return Icon(
        Icons.thumb_down,
        color: Colors.red,
        size: 30,
      );
    } else if (img_num == 2 && img_num2 == 3) {
      return Icon(
        Icons.thumb_up,
        color: Colors.green,
        size: 30,
      );
    } else if (img_num == 3 && img_num2 == 1) {
      return Icon(
        Icons.thumb_up,
        color: Colors.green,
        size: 30,
      );
    } else if (img_num == 3 && img_num2 == 2) {
      return Icon(
        Icons.thumb_down,
        color: Colors.red,
        size: 30,
      );
    } else {
      return Icon(
        Icons.handshake,
        color: Colors.yellow,
        size: 30,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        GestureDetector(
          onTap: rand,
          child: Container(
            color: Colors.black,
          ),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 210),
          child: Row(
            children: icons,
          ),
        ),
        Row(children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
                splashFactory: NoSplash
                    .splashFactory, // بيمنع الشادو اللي بيطلع لما اضغط على الزر
                onTap: () {
                  rand();
                },
                child: Container(
                    decoration: BoxDecoration(shape: BoxShape.circle),
                    width: 100,
                    height: 150,
                    child: Image.asset(
                      "images/game$img_num.jpg",
                      fit: BoxFit.fill,
                    ))),
          )),
          Text(
            "VS",
            style: TextStyle(color: Colors.amber, fontSize: 20),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
                splashFactory: NoSplash.splashFactory,
                onTap: () {
                  // getIcon();
                  rand();
                },
                child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      // color: Colors.black,
                    ),
                    width: 100,
                    height: 150,
                    child: Image.asset(
                      "images/game$img_num2.jpg",
                      fit: BoxFit.fill,
                    ))),
          )),
        ]),
        Container(
          padding: EdgeInsets.all(8),
          margin: EdgeInsets.only(top: 200),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                  child: Text("You",
                      style: TextStyle(fontSize: 25, color: Colors.amber))),
              Text("System",
                  style: TextStyle(fontSize: 25, color: Colors.amber)),
            ],
          ),
        )
      ],
    );
  }
}
