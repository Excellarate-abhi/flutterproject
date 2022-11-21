import 'package:flutter/material.dart';
import 'package:flutternewproject/model/planner.dart';

class WiseTailCard extends StatefulWidget {
  final PlannerList plannerList;

  const WiseTailCard(this.plannerList, {Key? key}) : super(key: key);

  @override
  State<WiseTailCard> createState() => _WiseTailCardState(plannerList);
}

class _WiseTailCardState extends State<WiseTailCard> {
  PlannerList plannerList;

  _WiseTailCardState(this.plannerList);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardList,
    );
  }

  Widget get cardList {
    return Container(
      height: MediaQuery.of(context).size.height / 8,
      margin: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        border: Border.all(
            color: Colors.grey.shade300, width: 2.0, style: BorderStyle.solid),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.redAccent.shade200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    child: Icon(Icons.saved_search_rounded),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Container(
                color: Colors.grey.shade100,
                child: Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: ListTile(
                        title: Text(
                          widget.plannerList.title.toString(),
                          style: TextStyle(fontSize: 22),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: ListTile(
                        title: Text(
                          "02:00 PM - 07:00 PM",
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 14.0, top: 14.0),
                      child: Expanded(
                        flex: 1,
                        child: Row(
                          children: [
                            Container(
                                decoration: BoxDecoration(color: Colors.white),
                                child: Icon(Icons.alarm_rounded)),
                            SizedBox(width: 10),
                            Container(
                                decoration: BoxDecoration(color: Colors.white),
                                child: Icon(Icons.alarm_off)),
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
          ),
          Expanded(
              flex: 3,
              child: Container(
                color: Colors.grey.shade100,
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: EdgeInsets.only(right: 10.0, bottom: 10.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: Colors.blueGrey),
                    child: const Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Text(
                        'Required',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
