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

      int? playerCount;
      int? firstChipCount;

      try {
        playerCount = int.parse(playerCountController.text);
      } on FormatException {
        errorText = "올바른 수를 입력해주세요";
        isRightPlayerCount = false;
      }

      try {
        firstChipCount = int.parse(firstChipCountController.text);
      } on FormatException {
        errorText = "올바른 수를 입력해주세요";
        isRightFirstChipCount = false;
      }

      print("Player Count: $playerCount, First Chip Count: $firstChipCount");
      print("isRightFirstChipCount: $isRightFirstChipCount");
      print("isRightPlayerCount: $isRightPlayerCount");

      if (!isRightFirstChipCount || !isRightPlayerCount) {
        return;
      }

      context.push('/second');
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
                maxLength: 1,
                placeholder: "인원 수를 입력하시오.",
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
                maxLength: 2,
                placeholder: "최초 칩 개수를 입력하시오.",
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
