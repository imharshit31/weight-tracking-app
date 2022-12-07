// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_constructors_in_immutables, unnecessary_new, prefer_final_fields, prefer_const_literals_to_create_immutables, unnecessary_string_interpolations, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'weightPage.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

TextEditingController _name = new TextEditingController();

String eyn = 'Enter Your Name', yn = 'Your Name', sv = 'Save';
var _tabTextIndexSelected = 0, _listTextTabToggle = ["Eng", 'हिन्दी'];
//variables

class _HomePageState extends State<HomePage> {
  Map<String, Map<String, String>> get Keys => {
        'Eng': {'0': 'Enter Your Name', '1': 'Your Name', '2': 'Save'},
        'हिन्दी': {'0': 'अपना नाम डाले', '1': 'आपका नाम', '2': 'सहेजें'}
      };
  // Map Containing texts in english and its corresponding hindi text

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 150,
          ),
          //Giving space at the top

          Text(
            '$eyn',
            style: TextStyle(
              fontSize: 27,
              color: Colors.green,
            ),
          ),
          //Text

          SizedBox(
            height: 20,
          ),
          //Space

          TextField(
            controller: _name,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 6,
                  color: Colors.green,
                ),
                borderRadius: BorderRadius.circular(80.0),
              ),
              hintText: '$yn',
            ),
          ),
          //Place to enter the name

          SizedBox(
            height: 35,
          ),
          //Space

          ElevatedButton(
            onPressed: () async {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          WeightPage(_name.text, _tabTextIndexSelected)));
            },
            child: Text(
              '$sv',
              style: TextStyle(fontSize: 20),
            ),
            style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(Size(140, 50)),
              backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            ),
          ),
          //Button to proceed to the next page

          SizedBox(
            height: 100,
          ),
          //Space

          FlutterToggleTab(
            //Toggle Tab to change the language
            width: 40,
            borderRadius: 30,
            height: 30,
            selectedIndex: _tabTextIndexSelected,
            selectedBackgroundColors: [Colors.blue, Colors.blueAccent],
            selectedTextStyle: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700),
            unSelectedTextStyle: TextStyle(
                color: Colors.black87,
                fontSize: 14,
                fontWeight: FontWeight.w500),
            labels: _listTextTabToggle,
            selectedLabelIndex: (index) {
              setState(() {
                //Changing state of variables having text
                _tabTextIndexSelected = index;
                eyn = Keys[_listTextTabToggle[index]]!["0"].toString();
                yn = Keys[_listTextTabToggle[index]]!["1"].toString();
                sv = Keys[_listTextTabToggle[index]]!["2"].toString();
              });
            },
            isScroll: false,
          ),
        ],
      ),
    );
  }
}
