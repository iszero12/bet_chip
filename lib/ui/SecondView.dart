import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Player{
  late String name;
  late int chip;
  late bool isLive = true;
  late int id;

  Player(this.name, this.chip, this.id);

  int betting(int betChip){
    if(chip - betChip<0){
      isLive = false;
      return 0;
    }
    else{
      chip -= betChip;
      return betChip;
    }

  }
  void die(){
    isLive = false;
  }
}

class Game{
  int currentChips = 0;
  int turn = 1;
  late int livePlayer;

  Game(this.livePlayer);

  void nextTurn(){
    turn +=1;
  }
  void betting(int chip){
    currentChips += chip;
  }
}


class SecondView extends StatefulWidget {
  final List<int> numbers;

  const SecondView({super.key, required this.numbers});

  @override
  State<SecondView> createState() => _SecondViewState();
}

class _SecondViewState extends State<SecondView> {
  TextEditingController controller = TextEditingController();

  List<int> numbers = [];
  List<Player> members = [];
  late int currentChip = 0;
  late Game game;

  @override
  void initState() {
    super.initState();
    numbers = widget.numbers;



    for (int i = 1; i < numbers[0] + 1 ; i++) {
      members.add(
        Player("${i}th player",numbers[1],i)
      );
    }
    game = Game(numbers[0]);
  }





  void update(){
    setState(() {


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
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: 200,
                      height: 150,
                      child:
                      Column(
                        children: [
                          Text(
                              "Current chips",
                            style: TextStyle(
                              fontSize: 30
                            ),
                          ),
                          Text(
                              game.currentChips.toString(),
                            style: TextStyle(
                              fontSize: 50
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
                                child: CupertinoButton(child:Text('bet'),onPressed: (){})
                            )
                          ],
                        )
                    ),
                    Expanded(
                      flex: 7,
                      child:
                      ListView.builder(
                        itemCount: members.length,
                        itemBuilder: (BuildContext ctx, int idx) {
                          return PlayerItem(members[idx]);
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
