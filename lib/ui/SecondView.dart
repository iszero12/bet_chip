import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SecondView extends StatefulWidget {
  const SecondView({super.key});

  @override
  State<SecondView> createState() => _SecondViewState();
}

class _SecondViewState extends State<SecondView> {
  TextEditingController controller = TextEditingController();
  List<String> list = ["1","2","3","4","5","6",];

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
        child: Text("wait a minuet.")
      ),
    );
  }
}