import 'package:flutter/material.dart';

class HistoryFragment extends StatefulWidget {
  const HistoryFragment({Key? key}) : super(key: key);

  @override
  State<HistoryFragment> createState() => _HistoryFragmentState();
}

class _HistoryFragmentState extends State<HistoryFragment> {




  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          'Hi History',
        ),
      ),
    );
  }
}
