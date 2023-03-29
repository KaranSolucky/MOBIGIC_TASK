import 'package:flutter/material.dart';
import 'package:mobigic_karan_word/Screen/search_word.dart';

import '../Utils/hex_color.dart';

class GridResult extends StatefulWidget {
  final int row;
  final int column;
  const GridResult({super.key, required this.column, required this.row});

  @override
  State<GridResult> createState() => _GridResultState();
}

class _GridResultState extends State<GridResult> {
  late int r, c;
  late var gridList;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    r = widget.row;
    c = widget.column;
    gridList = List.generate(r, (i) => List.filled(c, "", growable: false),
        growable: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Create Grid"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Expanded(
                flex: 8,
                child: Container(
                  child: GridView.count(
                    // Create a grid with 2 columns. If you change the scrollDirection to
                    // horizontal, this produces 2 rows.
                    crossAxisCount: r,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                    // Generate 100 widgets that display their index in the List.
                    children: List.generate(
                      r * c,
                      (index) {
                        return Center(
                          child: TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "";
                              }
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                            ),
                            textAlign: TextAlign.center,
                            initialValue:
                                gridList[index - ((index / r).floor() * r)]
                                    [(index / r).floor()],
                            onChanged: (value) {
                              gridList[index - ((index / r).floor() * r)]
                                  [(index / r).floor()] = value;
                            },
                          ),
                          // "${index - ((index / r).floor() * r)},${(index / r).floor()}",
                        );
                      },
                    ),
                  ),
                ),
              ),
              MaterialButton(
                  color: HexColor('#b8d434'),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => SearchWord(
                                    gridList: gridList,
                                    row: r,
                                    column: c,
                                  ))));
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10.0,
                    ),
                    child: Text(
                      "Create Grid",
                      style: TextStyle(fontSize: 25),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
