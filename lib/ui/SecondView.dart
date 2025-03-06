import 'dart:math';

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
  List<String> members = [];

  @override
  void initState() {
    super.initState();
    numbers = widget.numbers;

    for (int i = 1; i < numbers[0] + 1 ; i++) {
      members.add("$i번 플레이어");
    }
  }


  void update(){
    setState(() {

    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child:
      Container(
          color: Color(0xFFFFFFFF),
          alignment: Alignment.center,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                right: 0,
                height: 350,
                bottom: 0,
                child: ListView.builder(
                  itemCount: members.length,
                  itemBuilder: (BuildContext ctx, int idx) {
                    return PlayerItem(members[idx]);
                  },
                ),
              )
            ],
          )
      )
      ),
    );
  }
}


class PlayerItem extends StatelessWidget {
  const PlayerItem(this.player,{super.key});

  final String player;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.grey.withOpacity(0.3)),
          bottom: BorderSide(color: Colors.grey.withOpacity(0.3))
        )
      ),
      child:SizedBox(
        height: 60,
        child: Row(
          children: [
            SizedBox(
              height: 100,
              child: Center(
                child: Text(
                    textAlign: TextAlign.center,
                    player
                ),
              )
              ,
            )
          ],
        ),
      ),
    );
  }
}
