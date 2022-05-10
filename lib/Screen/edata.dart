import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class edata extends StatefulWidget {
  const edata({Key? key}) : super(key: key);

  @override
  _edataState createState() => _edataState();
}

class _edataState extends State<edata> {
  TextEditingController ccn = TextEditingController();
  TextEditingController cca = TextEditingController();
  TextEditingController ycn = TextEditingController();
  TextEditingController yca = TextEditingController();
  TextEditingController ycg = TextEditingController();
  TextEditingController ino = TextEditingController();
  TextEditingController id = TextEditingController();
  TextEditingController idd = TextEditingController();
  TextEditingController iname = TextEditingController();
  TextEditingController iq = TextEditingController();
  TextEditingController ip = TextEditingController();

  String cs = "Gujarat";
  String ys = "Gujarat";

  String cc = "India";
  String yc = "India";

  var city = ["Gujarat", "Goa", "Delhi", "Maharashtra", "Rajasthan"];
  var country = ["India", "China", "USA", "UK", "Ukrain"];

  List d1 = [];

  var key = GlobalKey<FormState>();

  ImagePicker i = ImagePicker();
  File i1 = File("");

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Form(
        key: key,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Creat invoice"),
            actions: [
              TextButton(
                onPressed: () {
                  d1 = [
                    ccn.text, //0
                    cca.text, //1
                    ycn.text, //2
                    yca.text, //3
                    ino.text, //4
                    id.text, //5
                    idd.text, //6
                    iname.text, //7
                    iq.text, //8
                    ip.text,//9
                    ycg.text,//10
                    cs,//11
                    cc,//12
                    ys,//13
                    yc,//14
                  ];
                  if (key.currentState!.validate()) {
                    Navigator.pushNamed(context, 'pre', arguments: d1);
                  }
                },
                child: Text(
                  "Next",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
            ],
          ),
          body: Container(
            height: double.infinity,
            width: double.infinity,
            padding: EdgeInsets.all(5),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 2)),
                    padding: EdgeInsets.all(5),
                    child: Column(
                      children: [
                        Container(
                          color: Colors.blue,
                          margin: EdgeInsets.only(bottom: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Client Destails",
                                style: TextStyle(color: Colors.white),
                              ),
                              Expanded(
                                child: SizedBox(),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            children: [
                              TextFormField(
                                controller: ccn,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  label: Text("Company Name"),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Enter Client's Company Name";
                                  }
                                },
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              TextFormField(
                                controller: cca,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintMaxLines: 2,
                                  label: Text("Company's Address "),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Enter Client's Company Address";
                                  }
                                },
                              ),
                              SizedBox(
                                height: 5,
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            DropdownButton(
                              value: cs,
                              icon: const Icon(Icons.keyboard_arrow_down),
                              items: city.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(items),
                                );
                              }).toList(),
                              onChanged: (newValue) {
                                setState(() {
                                  cs = newValue as String;
                                });
                              },
                            ),
                            DropdownButton(
                              value: cc,
                              icon: const Icon(Icons.keyboard_arrow_down),
                              items: country.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(items),
                                );
                              }).toList(),
                              onChanged: (newValue) {
                                setState(() {
                                  cc = newValue as String;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 2)),
                    padding: EdgeInsets.all(5),
                    child: Column(
                      children: [
                        Container(
                          color: Colors.blue,
                          margin: EdgeInsets.only(bottom: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "your company Destails",
                                style: TextStyle(color: Colors.white),
                              ),
                              Expanded(
                                child: SizedBox(),
                              ),
                            ],
                          ),
                        ),

                         Container(
                           width: 50,
                           alignment: Alignment.center,
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(20),
                             color:Colors.blue,
                           ),
                           child: IconButton(
                             onPressed: () async {
                               // XFile? ii =
                               //     await i.pickImage(source: ImageSource.gallery);
                               // setState(() {
                               //   i1 = File(ii!.path);
                               // }
                               // );
                             },
                             icon: Icon(Icons.add_a_photo),
                           ),
                         ),

                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          child: Column(
                            children: [
                              TextFormField(
                                controller: ycn,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  label: Text("Company Name"),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Enter your Company Name";
                                  }
                                },
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              TextFormField(
                                controller: yca,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintMaxLines: 2,
                                  label: Text("Company's Address "),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Enter your Company Address";
                                  }
                                },
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              TextFormField(
                                controller: ycg,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintMaxLines: 2,
                                  label: Text("GST Number"),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Enter your GST Number";
                                  }
                                },
                              ),
                              SizedBox(
                                height: 5,
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            DropdownButton(
                              value: ys,
                              icon: const Icon(Icons.keyboard_arrow_down),
                              items: city.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(items),
                                );
                              }).toList(),
                              onChanged: (newValue) {
                                setState(() {
                                  ys = newValue as String;
                                });
                              },
                            ),
                            DropdownButton(
                              value: yc,
                              icon: const Icon(Icons.keyboard_arrow_down),
                              items: country.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(items),
                                );
                              }).toList(),
                              onChanged: (newValue) {
                                setState(() {
                                  yc = newValue as String;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 2)),
                    padding: EdgeInsets.all(5),
                    child: Column(
                      children: [
                        Container(
                          color: Colors.blue,
                          margin: EdgeInsets.only(bottom: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "invoice details",
                                style: TextStyle(color: Colors.white),
                              ),
                              Expanded(
                                child: SizedBox(),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            children: [
                              TextFormField(
                                controller: ino,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  label: Text("invoice number"),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Enter invoice number";
                                  }
                                },
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              TextFormField(
                                controller: id,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  label: Text("invoice date"),
                                ),
                                keyboardType: TextInputType.number,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Enter invoice date";
                                  }
                                },
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              TextFormField(
                                controller: idd,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  label: Text("due date"),
                                ),
                                keyboardType: TextInputType.number,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Enter due date";
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 2)),
                    padding: EdgeInsets.all(5),
                    child: Column(
                      children: [
                        Container(
                          color: Colors.blue,
                          margin: EdgeInsets.only(bottom: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "item details",
                                style: TextStyle(color: Colors.white),
                              ),
                              Expanded(
                                child: SizedBox(),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            children: [
                              TextFormField(
                                controller: iname,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  label: Text("item's name"),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Enter item's name";
                                  }
                                },
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              TextFormField(
                                controller: iq,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  label: Text("item's quantity"),
                                ),
                                keyboardType: TextInputType.number,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Enter quantity";
                                  }
                                },
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              TextFormField(
                                controller: ip,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  label: Text("item's price"),
                                ),
                                keyboardType: TextInputType.number,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Enter item's price";
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
