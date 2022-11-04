import 'package:flutter/material.dart';

class Planner_Fragment extends StatelessWidget {
  const Planner_Fragment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 0.0),
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          body: Container(
            color: Colors.grey.shade300,
            child: TabBar(
              indicatorWeight: 4.0,
              indicatorColor: Colors.greenAccent.shade700,
              tabs: [
                Tab(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.laptop, color: Colors.grey.shade700, size: 30),
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
                /*DropdownButton(
                  value: selectedValue,
                  dropdownColor: Colors.green,
                  onChanged: (String? newValue){
                    setState((){
                      selectedValue = newValue!;
                    });
                  },
                  items: dropDownItems,
                )*/
              ],
            ),
          ),
        ),
      ),
    );
  }
}
