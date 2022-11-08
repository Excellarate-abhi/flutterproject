import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutternewproject/fragment/actions_fragment.dart';
import 'package:flutternewproject/fragment/checklistfragment.dart';
import 'package:flutternewproject/fragment/historyfragment.dart';
import 'package:flutternewproject/fragment/mydayfragment.dart';
import 'package:flutternewproject/fragment/silencefragment.dart';
import 'package:flutternewproject/fragment/snoozedfragment.dart';

class Planner_Fragment extends StatefulWidget {
  const Planner_Fragment({Key? key}) : super(key: key);

  @override
  State<Planner_Fragment> createState() => _PlannerFragmentState();
}

class _PlannerFragmentState extends State<Planner_Fragment> {
  String dropdownValue = 'Select Location';

  // List of items in our dropdown menu
  var listItems = [
    'Select Location',
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 0.0),
              child: Container(
                color: Colors.grey.shade300,
                child: TabBar(
                  indicatorWeight: 4.0,
                  indicatorColor: Colors.greenAccent.shade700,
                  isScrollable: true,
                  tabs: [
                    Tab(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.laptop,
                              color: Colors.grey.shade700, size: 30),
                          SizedBox(width: 8),
                          Text(
                            "My Day",
                            style: TextStyle(
                                color: Colors.grey.shade700, fontSize: 15),
                          )
                        ],
                      ),
                    ),
                    Tab(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.alarm_outlined,
                              color: Colors.grey.shade700, size: 30),
                          SizedBox(width: 8),
                          Text(
                            "Snoozed",
                            style: TextStyle(
                                color: Colors.grey.shade700, fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                    Tab(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.alarm_off,
                              color: Colors.grey.shade700, size: 30),
                          SizedBox(width: 8),
                          Text(
                            "Silenced",
                            style: TextStyle(
                                color: Colors.grey.shade700, fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 10.0, 12.0, 0.0),
              child: Row(
                children: [
                  Expanded(
                    child: InputDecorator(
                      decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 10.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          value: dropdownValue,
                          icon: Icon(Icons.arrow_drop_down_rounded),
                          iconSize: 24,
                          elevation: 16,
                          style: const TextStyle(color: Colors.deepPurple),
                          items: listItems.map((String options) {
                            return DropdownMenuItem(
                              value: options,
                              child: Text(options),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownValue = newValue!;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Icon(
                        Icons.circle,
                        color: Colors.grey.shade400,
                      ),
                      Text(
                        "2",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  CupertinoButton(
                    minSize: double.minPositive,
                    padding: EdgeInsets.zero,
                    child: Icon(
                      Icons.filter_alt,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Divider(
                thickness: 2,
                color: Colors.grey,
              ),
            ),
            Expanded(
                child: TabBarView(
              children: [
                MyDay_Fragment(),
                Snoozed_Fragment(),
                Silenced_Fragment()
              ],
            )),
          ],
        ),
      ),
    );
  }
}
