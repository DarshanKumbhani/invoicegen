import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inoicegernrator/Screen/pdf.dart';
import 'package:inoicegernrator/modal/modal.dart';
import 'package:share/share.dart';

class pre extends StatefulWidget {
  const pre({Key? key}) : super(key: key);

  @override
  _preState createState() => _preState();
}

class _preState extends State<pre> {
  File? f1 ;
  @override
  Widget build(BuildContext context) {
    List d2 = ModalRoute.of(context)!.settings.arguments as List;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(),
              ),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(width: 2),
                      ),
                    ),
                    child: Column(
                      children: [
                        Text(
                          "${d2[2]}",
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "GSTIN : ${d2[10]}",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //invoice details
                  Container(
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(width: 2),
                      ),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Invoice"),
                            Text("${d2[4]}"),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Invoice Date"),
                            Text("${d2[5]}"),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Due Date"),
                            Text("${d2[6]}"),
                            SizedBox(
                              height: 5,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  //Product details
                  Container(
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(width: 2),
                      ),
                    ),
                    alignment: Alignment.topLeft,
                    child: Column(
                      children: [
                        Text(
                          "Item Details",
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("${d2[7]}"),
                            Text("${int.parse(d2[8]) * int.parse(d2[9])}"),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "${d2[8]}*${d2[9]}",
                              style: TextStyle(color: Colors.grey.shade600),
                            )),
                        SizedBox(
                          height: 5,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "CGST : ${(int.parse(d2[8]) * int.parse(d2[9]) * (12 / 100)).toStringAsFixed(2)} (12%)",
                            style: TextStyle(color: Colors.grey.shade600),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "SGST : ${(int.parse(d2[8]) * int.parse(d2[9]) * (12 / 100)).toStringAsFixed(2)} (12%)",
                            style: TextStyle(color: Colors.grey.shade600),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                  ),
                  //gst
                  Container(
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(width: 2),
                      ),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("subTotal"),
                            Text(
                                "${double.parse(d2[8]) * double.parse(d2[9])}"),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("CGST"),
                            Text(
                                "${(double.parse(d2[8]) * double.parse(d2[9]) * (12 / 100)).toStringAsFixed(2)}"),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("SGST"),
                            Text(
                                "${(double.parse(d2[8]) * double.parse(d2[9]) * (12 / 100)).toStringAsFixed(2)}"),
                          ],
                        ),
                      ],
                    ),
                  ),
                  //total
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Total Amount:"),
                        Text(
                            "Rs.${((int.parse(d2[8]) * int.parse(d2[9])) + (int.parse(d2[8]) * int.parse(d2[9]) * (12 / 100)) + (int.parse(d2[8]) * int.parse(d2[9]) * (12 / 100))).toStringAsFixed(2)}"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: ()async {
                      pdfg p = pdfg();
                      f1 = await p.pd(d2);
                    },
                    child: Text("Save"),
                  ),
                ),
                Expanded(
                  child: TextButton(
                    onPressed: () async {
                      pdfg p = pdfg();
                      f1 = await p.pd(d2);
                      Share.shareFiles([f1!.path]);
                    },
                    child: Text("Share"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
