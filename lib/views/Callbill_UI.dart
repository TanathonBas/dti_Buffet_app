// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class CallbillUi extends StatefulWidget {
  const CallbillUi({super.key});

  @override
  State<CallbillUi> createState() => _CallbillUiState();
}

class _CallbillUiState extends State<CallbillUi> {
  bool adultCheck = false;
  bool childCheck = false;

  TextEditingController adultCtrl = TextEditingController(text: '0');
  TextEditingController childCtrl = TextEditingController(text: '0');
  TextEditingController cokeCtrl = TextEditingController(text: '0');
  TextEditingController pureCtrl = TextEditingController(text: '0');

  int waterCheck = 1;

  List<String> memberType = [
    'ไม่เป็น'
        'สมาชิกVIP 5%'
        'สมาชิกพิเศษ 20%'
  ];

  double discount = 0;

  File? imgFile;

  Future<void> openCamera() async {
    final picker = await ImagePicker().pickImage(
      source: ImageSource.camera,
      imageQuality: 75,
    );

    if (picker == null) return;

    setState(() {
      imgFile = File(picker.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            left: 40,
            right: 40,
          ),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 50.0,
                ),
                InkWell(
                  onTap: () {
                    openCamera();
                  },
                  child: imgFile == null
                      ? Image.asset(
                          'assets/images/camera.jpg',
                          height: 120.0,
                        )
                      : Image.file(
                          imgFile!,
                          height: 120.0,
                        ),
                ),
                SizedBox(
                  height: 35.0,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'ป้อนจำนวนคน',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Checkbox(
                      onChanged: (valueparam) {
                        setState(() {
                          adultCheck = valueparam!;
                          if (valueparam == false) {
                            adultCtrl.text = '0';
                          }
                        });
                      },
                      value: adultCheck,
                    ),
                    Text('ผู้ใหญ่ 299 บาท/คน'),
                    Flexible(
                      child: TextField(
                        keyboardType: TextInputType.number,
                        enabled: adultCheck,
                        controller: adultCtrl,
                        decoration: InputDecoration(
                          prefix: Text('จำนวน:   '),
                          suffix: Text('คน'),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      onChanged: (valueparam) {
                        setState(() {
                          childCheck = valueparam!;
                          if (valueparam == false) {
                            childCtrl.text = '0';
                          }
                        });
                      },
                      value: childCheck,
                    ),
                    Text('เด็ก 69 บาท/คน'),
                    Flexible(
                      child: TextField(
                        keyboardType: TextInputType.number,
                        enabled: childCheck,
                        controller: childCtrl,
                        decoration: InputDecoration(
                          prefix: Text('จำนวน:   '),
                          suffix: Text('คน'),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 35.0,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'บุฟเฟ่น้ำดื่ม',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Radio(
                      onChanged: (valueParam) {
                        setState(() {
                          waterCheck = valueParam!;
                          if (waterCheck == 1) {
                            cokeCtrl.text = '0';
                            pureCtrl.text = '0';
                          }
                        });
                      },
                      value: 1,
                      groupValue: waterCheck,
                    ),
                    Text(
                      'รับ 25 บาท/หัว',
                    ),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      onChanged: (valueParam) {
                        setState(() {
                          waterCheck = valueParam!;
                        });
                      },
                      value: 2,
                      groupValue: waterCheck,
                    ),
                    Text(
                      'ไม่รับ',
                    ),
                  ],
                ),
                SizedBox(
                  height: 5.0,
                ),
                Row(
                  children: [
                    Text('               โค้ก 20 บาท/ขวด'),
                    Flexible(
                      child: TextField(
                        keyboardType: TextInputType.number,
                        enabled: waterCheck == 1 ? false : true,
                        controller: cokeCtrl,
                      ),
                    ),
                    Text('ขวด'),
                  ],
                ),
                Row(
                  children: [
                    Text('               น้ำเปล่า 15 บาท/ขวด'),
                    Flexible(
                      child: TextField(
                        keyboardType: TextInputType.number,
                        enabled: waterCheck == 1 ? false : true,
                        controller: pureCtrl,
                      ),
                    ),
                    Text('ขวด'),
                  ],
                ),
                SizedBox(
                  height: 5.0,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'ประเภทสมาชิก',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                ),
                DropdownButton(
                  value: discount,
                  isExpanded: true,
                  items: memberType
                      .map(
                        (e) => DropdownMenuItem(
                          child: Text(
                            e,
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                          value: memberType.indexOf(e).toDouble(),
                        ),
                      )
                      .toList(),
                  onChanged: (valueParam) {
                    switch (valueParam) {
                      case 0:
                        discount = 0;
                        break;
                      case 1:
                        discount = 0.05;
                        break;
                      case 2:
                        discount = 0.2;
                        break;
                    }
                  },
                ),
                SizedBox(
                  height: 15.0,
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        icon: Icon(
                          Icons.calculate,
                        ),
                        label: Text(
                          'คำนวณเงิน',
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepOrange,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            )),
                      ),
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        icon: Icon(
                          Icons.cancel,
                        ),
                        label: Text(
                          'ยกเลิก',
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.tealAccent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0))),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
