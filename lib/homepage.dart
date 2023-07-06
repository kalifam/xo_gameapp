import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool oTurn = true;
  List<String> displayXo = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];
  int oScore = 0;
  int xScore = 0;
  int filledBoxes = 0;
  String resulutDeclaration = '';
  static var customFontWhite = GoogleFonts.coiny(
      textStyle: TextStyle(
    color: Colors.white,
    letterSpacing: 3,
    fontSize: 28,
  ));
  // late List<GameButton> buttonlist;
  // @override
  // void initState() {
  //   super.initState();
  //   buttonlist = doInit();
  // }

  // List<GameButton> doInit() {
  //   var gameButtons = <GameButton>[
  //     new GameButton(id: 1),
  //     new GameButton(id: 2),
  //     new GameButton(id: 3),
  //     new GameButton(id: 4),
  //     new GameButton(id: 5),
  //     new GameButton(id: 6),
  //     new GameButton(id: 7),
  //     new GameButton(id: 8),
  //     new GameButton(id: 9),
  //   ];
  //   return gameButtons;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text('TIC TAK'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              decoration: BoxDecoration(
                  //     gradient: LinearGradient(
                  //   colors: [Colors.red, Color(0xffee4036)],
                  //   begin: Alignment.topLeft,
                  //   end: Alignment.bottomRight,
                  // )
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 6.0,
                      mainAxisSpacing: 9.0,
                    ),
                    itemCount: 9,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          _tapped(index);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              displayXo[index],
                              style: GoogleFonts.coiny(fontSize: 60.0),
                            ),
                          ),
                        ),
                      );
                    }),
              ),

              // child: GridView.builder(
              //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //     crossAxisCount: 3,
              //     childAspectRatio: 1.0,
              //     crossAxisSpacing: 6.0,
              //     mainAxisSpacing: 9.0,
              //   ),
              //   itemCount: buttonlist.length,
              //   itemBuilder: (context, index) => SizedBox(
              //     height: 100.0,
              //     width: 100.0,
              //     child: Padding(
              //       padding: const EdgeInsets.all(8.0),
              //       child: ElevatedButton(
              //         onPressed: () {},
              //         child: Text(
              //           buttonlist[index].text,
              //           style: TextStyle(color: Colors.amber, fontSize: 20.0),
              //         ),
              //         style: ElevatedButton.styleFrom(
              //           backgroundColor: buttonlist[index].bg,
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
            ),
            Expanded(
                // flex: 2,
                child: Text(resulutDeclaration,
                    style: TextStyle(color: Colors.green, fontSize: 20.0)))
          ],
        ),
      ),
    );
  }

  void _tapped(int index) {
    setState(() {
      if (oTurn && displayXo[index] == '') {
        displayXo[index] = 'x';
      } else if (!oTurn && displayXo[index] == '') {
        displayXo[index] = '0';
      }
      oTurn = !oTurn;
      _checkwinner();
    });
  }

  void _checkwinner() {
    //check 1row
    if (displayXo[0] == displayXo[1] &&
        displayXo[0] == displayXo[2] &&
        displayXo[0] != '') {
      setState(() {
        resulutDeclaration = 'Player' + displayXo[0] + 'Wins!';
      });
    }
    //check 2row
    if (displayXo[3] == displayXo[4] &&
        displayXo[3] == displayXo[5] &&
        displayXo[3] != '') {
      setState(() {
        resulutDeclaration = 'Player' + displayXo[3] + 'Wins!';
      });
    }
    //check 3row
    if (displayXo[6] == displayXo[7] &&
        displayXo[6] == displayXo[8] &&
        displayXo[6] != '') {
      setState(() {
        resulutDeclaration = 'Player' + displayXo[6] + 'Wins!';
      });
    }
    //check 1column
    if (displayXo[0] == displayXo[3] &&
        displayXo[0] == displayXo[6] &&
        displayXo[0] != '') {
      setState(() {
        resulutDeclaration = 'Player' + displayXo[0] + 'Wins!';
      });
    }
    //check 2column
    if (displayXo[1] == displayXo[4] &&
        displayXo[1] == displayXo[7] &&
        displayXo[1] != '') {
      setState(() {
        resulutDeclaration = 'Player' + displayXo[1] + 'Wins!';
      });
    }
    //check 3column
    if (displayXo[2] == displayXo[5] &&
        displayXo[2] == displayXo[8] &&
        displayXo[2] != '') {
      setState(() {
        resulutDeclaration = 'Player' + displayXo[2] + 'Wins!';
      });
    }
    //check dignal
    if (displayXo[0] == displayXo[4] &&
        displayXo[0] == displayXo[8] &&
        displayXo[0] != '') {
      setState(() {
        resulutDeclaration = 'Player' + displayXo[0] + 'Wins!';
      });
    }
    //check dignal
    if (displayXo[6] == displayXo[4] &&
        displayXo[6] == displayXo[2] &&
        displayXo[6] != '') {
      setState(() {
        resulutDeclaration = 'Player' + displayXo[6] + 'Wins!';
      });
    }
  }
}