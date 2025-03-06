import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FirstView extends StatefulWidget {
  const FirstView({super.key});

  @override
  State<FirstView> createState() => _FirstViewState();
}

class _FirstViewState extends State<FirstView> {
  TextEditingController playerCountController = TextEditingController();
  TextEditingController firstChipCountController = TextEditingController();
  String errorText = "";
  bool isRightPlayerCount = true;
  bool isRightFirstChipCount = true;
  int playerCount = 0;
  int firstChipCount = 0;
  @override
  void dispose() {
    playerCountController.dispose();
    firstChipCountController.dispose();
    super.dispose();
  }

  void startGame() {
    setState(() {
      isRightPlayerCount = true;
      isRightFirstChipCount = true;
      errorText = "";

      int playerCount = 0;
      int firstChipCount = 0;

      try {
        playerCount = int.parse(playerCountController.text);
      } on FormatException {
        errorText = "Enter the correct number";
        isRightPlayerCount = false;
      }

      try {
        firstChipCount = int.parse(firstChipCountController.text);
      } on FormatException {
        errorText = "Enter the correct number";
        isRightFirstChipCount = false;
      }

      if (!isRightFirstChipCount || !isRightPlayerCount) {
        return;
      }

      context.push('/second',extra: [playerCount,firstChipCount]);
    });
  }

  void resetError() {
    setState(() {
      errorText = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xffffffff),
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            const Padding(padding: EdgeInsets.all(90)),
            SizedBox(
              width: 200,
              child: CupertinoTextField(
                onChanged: (text) {
                  resetError();
                },
                controller: playerCountController,
                keyboardType: TextInputType.number,
                maxLines: 1,
                placeholder: "player count",
              ),
            ),
            const Padding(padding: EdgeInsets.all(8)),
            SizedBox(
              width: 200,
              child: CupertinoTextField(
                onChanged: (text) {
                  resetError();
                },
                controller: firstChipCountController,
                keyboardType: TextInputType.number,
                maxLines: 1,
                placeholder: "first chip count",
              ),
            ),
            CupertinoButton(
              onPressed: startGame,
              child: const Text("go"),
            ),
            if (!isRightPlayerCount || !isRightFirstChipCount)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  errorText,
                  style: const TextStyle(color: Colors.red),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
