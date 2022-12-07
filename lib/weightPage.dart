// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_interpolation_to_compose_strings, must_be_immutable, use_key_in_widget_constructors, no_logic_in_create_state, override_on_non_overriding_member, non_constant_identifier_names, prefer_final_fields, annotate_overrides, unnecessary_string_interpolations, unused_local_variable, sized_box_for_whitespace, body_might_complete_normally_nullable, file_names

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'data.dart';

List<Data> _weight = [];
// The array which will store the entries, it is made global to be accessible everywhere

class WeightPage extends StatefulWidget {
  String name;
  //Will store the name of the user passed from Home Page
  int indd;
  //Will store the index of toggle bar which will indicate the language, user is proceeding with

  WeightPage(this.name, this.indd);
  //Constructor, which will take name and index as parameters

  @override
  State<WeightPage> createState() => _WeightPageState(name, indd);
}

class _WeightPageState extends State<WeightPage> {
  @override
  String name;

  Map<String, Map<int, String>> get Keys => {
        'Eng': {
          0: 'Data History',
          1: 'Add Weight',
          2: 'Jan',
          3: 'Feb',
          4: 'Mar',
          5: 'Apr',
          6: 'May',
          7: 'June',
          8: 'July',
          9: 'Aug',
          10: 'Sept',
          11: 'Oct',
          12: 'Nov',
          13: 'Dec',
          14: 'Weight',
          15: 'Confirm',
          16: 'Kilo'
        },
        'हिन्दी': {
          0: 'जानकारी इतिहास',
          1: 'वजन जोड़ें',
          2: 'जनवरी',
          3: 'फरवरी',
          4: 'मार्च',
          5: 'अप्रैल',
          6: 'मई',
          7: 'जून',
          8: 'जुलाई',
          9: 'अगस्त',
          10: 'सितंबर',
          11: 'अक्टूबर',
          12: 'नवंबर',
          13: 'दिसंबर',
          14: 'वजन',
          15: 'पुष्टि करें',
          16: 'किलो'
        }
      };
  // Map Containing texts in english and its corresponding hindi text

  String dh = '', aw = '';
  var _listTextTabToggle = ["Eng", 'हिन्दी'];

  TextEditingController cont = TextEditingController();
  late int v = 60;
  late DateTime _date;
  late TimeOfDay tod;
  String hint1 = 'Enter Value/मूल्य भरे',
      hint2 = 'Enter Value/मूल्य भरे',
      hint3 = 'Enter Value/मूल्य भरे';
  int indd = 0;

  //Variables

  _WeightPageState(this.name, this.indd);
  //This constructor will take name and index from Weight Page class

  Widget build(BuildContext context) {
    setState(() {
      dh = Keys[_listTextTabToggle[indd]]![0].toString();
      aw = Keys[_listTextTabToggle[indd]]![1].toString();
    });
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          //Space

          Text(
            '$name',
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          //Text showing the name of the user (forwarded by home page)

          SizedBox(
            height: 20,
            width: double.infinity,
          ),
          //Space

          SfCartesianChart(
            primaryXAxis: CategoryAxis(),
            series: <ChartSeries<Data, String>>[
              LineSeries<Data, String>(
                  dataSource: _weight,
                  xValueMapper: (Data wt, _) =>
                      Keys[_listTextTabToggle[indd]]![wt.date.month + 1],
                  yValueMapper: (Data wt, _) => wt.weight)
            ],
          ),
          //The Widget which will transform the _weight array into a X-Y plane graph

          SizedBox(
            height: 5,
          ),
          //Space

          Text(
            '$dh',
            style: TextStyle(
              fontSize: 18,
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: _weight.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 4,
                  child: ListTile(
                    trailing: InkWell(
                      onTap: () {
                        setState(() {
                          _weight.removeAt(index);
                        });
                      },
                      child: Icon(Icons.delete),
                    ),
                    title: Row(
                      children: [
                        SizedBox(
                          width: 30,
                        ),
                        Column(
                          children: [
                            Text(
                              _weight[index].date.day.toString() +
                                  ' ' +
                                  Keys[_listTextTabToggle[indd]]![
                                          _weight[index].date.month + 1]
                                      .toString() +
                                  ' ' +
                                  _weight[index].date.year.toString(),
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              _weight[index].time.hour.toString() +
                                  ':' +
                                  _weight[index].time.minute.toString() +
                                  ' ' +
                                  _weight[index].time.period.toString()[10] +
                                  _weight[index].time.period.toString()[11],
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: Text(
                            _weight[index].weight.toString() +
                                ' ' +
                                Keys[_listTextTabToggle[indd]]![16].toString(),
                            textAlign: TextAlign.right,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          //This contains the list view having the weight entries

          ElevatedButton(
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return Wrap(
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          Keys[_listTextTabToggle[indd]]![14].toString(),
                          style: TextStyle(
                            fontSize: 22,
                          ),
                        ),
                        TextField(
                          controller: cont,
                          onTap: () {},
                          decoration: InputDecoration(
                            icon: Icon(Icons.line_weight),
                            hintText: '$hint1',
                            border: InputBorder.none,
                          ),
                          cursorColor: Colors.white,
                        ),
                        TextField(
                          decoration: InputDecoration(
                            icon: Icon(Icons.calendar_today),
                            hintText: '$hint2',
                            border: InputBorder.none,
                          ),
                          onTap: () async {
                            DateTime? pd = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2022),
                                    lastDate: DateTime(2023))
                                .then((value) {
                              setState(() {
                                _date = value!;
                                hint2 = _date.day.toString() +
                                    ' ' +
                                    _date.month.toString() +
                                    ' ' +
                                    _date.year.toString();
                              });
                            });
                          },
                          cursorColor: Colors.white,
                        ),
                        TextField(
                          onTap: () async {
                            showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now())
                                .then((value) {
                              setState(() {
                                tod = value!;
                                hint3 = tod.hour.toString() +
                                    ' ' +
                                    tod.minute.toString();
                              });
                            });
                          },
                          decoration: InputDecoration(
                            icon: Icon(Icons.timelapse),
                            hintText: '$hint3',
                            border: InputBorder.none,
                          ),
                          cursorColor: Colors.white,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              v = int.parse(cont.text);
                              setState(() {
                                _weight.add(Data(v.toDouble(), _date, tod));
                              });
                              Navigator.of(context).pop(_weight);
                            },
                            child: Text(
                                Keys[_listTextTabToggle[indd]]![15].toString()),
                            style: ButtonStyle(
                              minimumSize:
                                  MaterialStateProperty.all(Size(210, 40)),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.green),
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                            ),
                          ),
                        ),
                      ],
                    );
                  });
            },
            child: Text(
              '$aw',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(Size(350, 50)),
              backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            ),
          ),
          //This button will add weight entries to the array and force the graph to get modified

          SizedBox(
            height: 10,
          )
          //Space at the bottom
        ],
      ),
    );
  }
}
