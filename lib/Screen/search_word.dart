import 'package:flutter/material.dart';
import 'package:mobigic_karan_word/Screen/create_grid.dart';
import 'package:mobigic_karan_word/Utils/hex_color.dart';

import '../Utils/search_logic.dart';

class SearchWord extends StatefulWidget {
  var gridList;
  int row;
  int column;
  SearchWord(
      {super.key,
      required this.column,
      required this.row,
      required this.gridList});

  @override
  State<SearchWord> createState() => _SearchWordState();
}

class _SearchWordState extends State<SearchWord> {
  late String word;
  late List hlist = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text("Search the word"),
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Expanded(
              flex: 8,
              child: GridView.count(
                crossAxisCount: widget.row,
                crossAxisSpacing: 1.0,
                mainAxisSpacing: 1.0,
                children: List.generate(
                  widget.row * widget.column,
                  (index) {
                    return Center(
                      child: Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: hlist.contains(index)
                              ? HexColor('#b8d434')
                              : Colors.black,
                        ),
                        child: Text(
                          widget.gridList[index -
                                  ((index / widget.row).floor() * widget.row)]
                              [(index / widget.row).floor()],
                          style: TextStyle(
                              fontSize: 20.0,
                              color: hlist.contains(index)
                                  ? Colors.black
                                  : Colors.white),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: TextFormField(
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20.0),
                decoration: InputDecoration(
                    isDense: true,
                    // contentPadding:
                    //     const EdgeInsets.only(top: 15, bottom: 15, left: 15),
                    hintText: "Search Word",
                    hintStyle: const TextStyle(fontFamily: "Poppins"),
                    labelStyle: const TextStyle(fontFamily: "Poppins"),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 2.0, color: HexColor('#b8d434')),
                        borderRadius: BorderRadius.circular(5)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5))),
                onChanged: (value) {
                  word = value;
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  MaterialButton(
                      color: HexColor('#b8d434'),
                      onPressed: () {
                        setState(() {
                          hlist = SearchLogicList(
                              widget.gridList, word, widget.row, widget.column);
                        });
                      },
                      child: Text("Search")),
                  MaterialButton(
                      color: HexColor('#b8d434'),
                      onPressed: () {
                        Navigator.of(context)
                            .popUntil((route) => route.isFirst);
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => CreateGRID())));
                      },
                      child: Text("Reset")),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
