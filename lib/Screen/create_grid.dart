import 'package:flutter/material.dart';
import 'package:mobigic_karan_word/Screen/grid_result.dart';

import '../Utils/hex_color.dart';

class CreateGRID extends StatefulWidget {
  const CreateGRID({super.key});

  @override
  State<CreateGRID> createState() => _CreateGRIDState();
}

class _CreateGRIDState extends State<CreateGRID> {
  late int row;
  late int column;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text("Word Search"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Container(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  style: const TextStyle(fontFamily: "Poppins"),
                  keyboardType: TextInputType.number,
                  validator: (String? str) {
                    if (str == null || str.isEmpty || int.parse(str) > 7) {
                      return 'enter a value between 1-7';
                    }
                  },
                  onChanged: (value) {
                    row = int.parse(value);
                  },
                  decoration: InputDecoration(
                      isDense: true,
                      contentPadding:
                          const EdgeInsets.only(top: 15, bottom: 15, left: 15),
                      hintText: "Enter Row Count",
                      hintStyle: const TextStyle(fontFamily: "Poppins"),
                      labelStyle: const TextStyle(fontFamily: "Poppins"),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 2.0, color: HexColor('#b8d434')),
                          borderRadius: BorderRadius.circular(5)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5))),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  style: const TextStyle(fontFamily: "Poppins"),
                  keyboardType: TextInputType.number,
                  validator: (String? str) {
                    if (str == null || str.isEmpty || int.parse(str) > 7) {
                      return 'enter a value between 1-7';
                    }
                  },
                  onChanged: (value) {
                    column = int.parse(value);
                  },
                  decoration: InputDecoration(
                      isDense: true,
                      contentPadding:
                          const EdgeInsets.only(top: 15, bottom: 15, left: 15),
                      hintText: "Enter Customer Name",
                      hintStyle: const TextStyle(fontFamily: "Poppins"),
                      labelStyle: const TextStyle(fontFamily: "Poppins"),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 2.0, color: HexColor('#b8d434')),
                          borderRadius: BorderRadius.circular(5)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5))),
                ),
                SizedBox(
                  height: 20,
                ),
                MaterialButton(
                    color: HexColor('#b8d434'),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => GridResult(
                                      row: row,
                                      column: column,
                                    ))));
                      }
                    },
                    child: Text("Add")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
