import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SecondView extends StatefulWidget {
  final List<int> numbers;

  const SecondView({super.key, required this.numbers});

  @override
  State<SecondView> createState() => _SecondViewState();
}

class _SecondViewState extends State<SecondView> {
  TextEditingController controller = TextEditingController();

  List<int> numbers = [];

  @override
  void initState() {
    super.initState();
    numbers = widget.numbers;
  }

  void update(){
    setState(() {

    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFFFFFFFF),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(numbers[0].toString()),
            Text(numbers[1].toString())
          ],
        )
      ),
    );
  }
}