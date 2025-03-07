import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Player{
  late String name;
  late int chip;
  late bool isLive = true;
  late int id;

  Player(this.name, this.chip, this.id);
}

class Game{
  int currentChips = 0;
  int turn = 0;
  late List<int> livePlayers;

  Game(this.livePlayers);
}

extension StringExtensions on String {
  int toInt() {
    return int.parse(this);
  }
}


class SecondView extends StatefulWidget {
  final List<int> numbers;

  const SecondView({super.key, required this.numbers});

  @override
  State<SecondView> createState() => _SecondViewState();
}

class _SecondViewState extends State<SecondView> {
  TextEditingController betChipController = TextEditingController();

  List<int> numbers = [];
  List<Player> Players = [];
  late Game game;
  String error = "";

  @override
  void initState() {
    super.initState();
    numbers = widget.numbers;



    for (int i = 1; i < numbers[0] + 1 ; i++) {
      Players.add(
        Player("${i}th player",numbers[1],i)
      );
    }
    game = Game(List.generate(numbers[0], (i) => i ));
  }

  bool isInt(String str) {
    return int.tryParse(str) != null;
  }




  void endCheck(){
    setState(() {
      if(game.livePlayers.length == 1){
        Players[game.livePlayers[0]].chip += game.currentChips;
      }
    });
  }

  void resetError(){
    setState(() {
      error = "";
    });
  }

  void nextTurn(){
    print(game.turn);
    if (game.turn == game.livePlayers.length - 1){
      print("game.turn");
      print(game.livePlayers);
      print("max turn");
      game.turn = 0;
    }
    else{
      print("next turn");
      game.turn +=1 ;
    }
  }

  void errorUpdate(String str){
    setState(() {
      error = str;
    });
  }


  void betting(int betChip){
    setState(() {
      if (Players[game.turn].chip - betChip < 0){
        errorUpdate("The number of chips exceeds");
      }
      else{
        Players[game.turn].chip -= betChip;
        game.currentChips += betChip;
        nextTurn();
      }
    });
  }
  void die(){
    setState(() {
      Players[game.livePlayers[game.turn]].isLive = false;
    });
  }

  void resetPlayers(){
    setState(() {
      game.livePlayers.clear();
      game.livePlayers = List.generate(numbers[0], (i) => i );
    });
  }


  @override
  Widget build(BuildContext context) {
    return
      (Scaffold(
      body:
      GestureDetector(
        onTap: () => {FocusManager.instance.primaryFocus?.unfocus()},
        child:
          SafeArea(child:
      Container(
          color: Colors.white,
          alignment: Alignment.center,
          child: Column(
            children: [
              Expanded(
                flex: 4,
                  child: Container(
                    alignment: Alignment.topCenter,
                    child: SizedBox(
                      width: 400,
                      height: 350,
                      child:
                      Column(
                        children: [
                          Text(
                              "Current chips",
                            style: TextStyle(
                              fontSize: 20
                            ),
                          ),
                          Text(
                              game.currentChips.toString(),
                            style: TextStyle(
                              fontSize: 40
                            ),
                          ),

                          Text("this turn"),
                          Text(
                              "${Players[game.turn].id.toString()}th player",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15
                            ),
                          ),
                          Padding(padding: EdgeInsets.fromLTRB(0, 5, 0, 0)),
                          Text(
                            error,
                            style: TextStyle(
                              color: Colors.red
                            ),
                          )
                        ],
                      ),
                    ),
                  )
              ),
              Expanded(
                  flex: 6,
                child: Column(
                  children: [

                    Expanded(
                        flex: 1,
                        child:
                        Row(
                          children: [
                            Padding(padding: EdgeInsets.fromLTRB(10, 0, 0, 0)),
                            Expanded(
                                flex: 8,
                                child:
                                CupertinoTextField(
                                  keyboardType: TextInputType.number,
                                    onChanged: (text) {
                                      resetError();
                                    },
                                  controller: betChipController,
                                  placeholder: "Betting chip Count",
                                )
                            ),
                            Expanded(
                              flex: 3,
                                child:
                                CupertinoButton(child:Text('die'),onPressed: (){})
                            ),
                            Expanded(
                                flex: 3,
                                child: CupertinoButton(child:Text('bet'),onPressed: (){
                                  if (isInt(betChipController.text)){
                                    betting(betChipController.text.toInt());
                                  }
                                  else{
                                    errorUpdate("Enter the correct number");
                                  }
                                })
                            )
                          ],
                        )
                    ),
                    Expanded(
                      flex: 7,
                      child:
                      ListView.builder(
                        itemCount: Players.length,
                        itemBuilder: (BuildContext ctx, int idx) {
                          return PlayerItem(Players[idx]);
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          )
      )
      ),
    )
      )
      );
  }
}


class PlayerItem extends StatelessWidget {
  const PlayerItem(this.player,{super.key});

  final Player player;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.grey.withValues(alpha: 0.3)),
          bottom: BorderSide(color: Colors.grey.withValues(alpha: 0.3))
        )
      ),
      child:SizedBox(
        height: 60,
        child: Row(
          children: [
            Padding(padding: EdgeInsets.fromLTRB(20, 0, 0,0 )),
            SizedBox(
              height: 100,
              child: Center(
                child: Text(
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: player.isLive ? Colors.black : Colors.red
                    ),
                    player.name
                ),
              ),
            ),
            Spacer(),
            Text(player.chip.toString()),
            Padding(padding: EdgeInsets.fromLTRB(20, 0, 0,0 )),
          ],
        ),
      ),
    );
  }
}

