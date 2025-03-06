import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Player{
  late String name;
  late int chip;
  late bool isLive;
  late int id;

  int betting(int betChip){
    chip -= betChip;
    return betChip;
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
  List<String> members = [];

  @override
  void initState() {
    super.initState();
    numbers = widget.numbers;

    for (int i = 1; i < numbers[0] + 1 ; i++) {
      members.add("${i}th player");
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
          child: Column(
            children: [
              Expanded(
                flex: 4,
                  child: Container()
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
                                CupertinoTextField()
                            ),
                            Expanded(
                                flex: 2,
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
          top: BorderSide(color: Colors.grey.withValues(alpha: 0.3)),
          bottom: BorderSide(color: Colors.grey.withValues(alpha: 0.3))
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
              ),
            ),
            Spacer(),

            CupertinoButton(child: Text("go"), onPressed: (){
              print("clicked");
            })
          ],
        ),
      ),
    );
  }
}
