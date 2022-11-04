import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutternewproject/fragment/actions_fragment.dart';
import 'package:flutternewproject/fragment/checklistfragment.dart';
import 'package:flutternewproject/fragment/historyfragment.dart';
import 'package:flutternewproject/fragment/plannerfragement.dart';

class DrawerItem {
  String title;
  ImageIcon icon;

  DrawerItem(this.title, this.icon);
}

class HomePage extends StatefulWidget {
  final drawerItems = [
    DrawerItem(
        "Planner",
        ImageIcon(
          AssetImage('assets/planner.png'),
          size: 22,
          color: Colors.grey.shade800,
        )),
    DrawerItem(
        "Checklist",
        ImageIcon(
          AssetImage('assets/checklist.png'),
          size: 22,
          color: Colors.grey.shade800,
        )),
    DrawerItem(
        "Actions",
        ImageIcon(
          AssetImage('assets/actions.png'),
          size: 22,
          color: Colors.grey.shade800,
        )),
    DrawerItem(
        "History",
        ImageIcon(
          AssetImage('assets/history.png'),
          size: 22,
          color: Colors.grey.shade800,
        )),
  ];

  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedDrawerIndex = 0;

  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return const Planner_Fragment();
      case 1:
        return const Checklist_Fragment();
      case 2:
        return const Action_Fragment();
      case 3:
        return const History_Fragment();
    }
  }

  _onSelectItem(int index) {
    setState(() => _selectedDrawerIndex = index);
    Navigator.of(context).pop(); // close the drawer
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool isDrawerOpen = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var drawerOptions = <Widget>[];
    for (var i = 0; i < widget.drawerItems.length; i++) {
      var d = widget.drawerItems[i];
      drawerOptions.add(
        ListTile(
          leading: ImageIcon(d.icon.image),
          title: Text(
            d.title,
            style: TextStyle(fontSize: 18),
          ),
          selected: i == _selectedDrawerIndex,
          onTap: () => _onSelectItem(i),
        ),
      );
    }

    return Scaffold(
      primary: true,
      appBar: AppBar(
        systemOverlayStyle:
            SystemUiOverlayStyle(statusBarColor: Colors.greenAccent),
        title: Text(
          widget.drawerItems[_selectedDrawerIndex].title,
          style: TextStyle(color: Colors.greenAccent),
        ),
        leading: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset('assets/tick.png'),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: AspectRatio(
                aspectRatio: 1,
                child: Image.asset('assets/circle.png', fit: BoxFit.cover),
              ),
            ),
            Positioned(
              right: 12,
              bottom: 12.5,
              child: Image.asset(
                'assets/dot.png',
              ),
            ),
          ],
        ),
        backgroundColor: const Color(0xFFFFFFFF),
        actions: [
          IconButton(
            onPressed: () {
              toggleDrawer();
            },
            icon: Icon(
              Icons.menu,
              size: 30,
              color: Colors.grey.shade800,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.settings,
              size: 30,
              color: Colors.grey.shade800,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.space_dashboard,
              size: 30,
              color: Colors.grey.shade800,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0, left: 8.0),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/profilepic.jpeg'),
              radius: 16,
            ),
          )
        ],
        automaticallyImplyLeading: false,
      ),
      body: Scaffold(
        key: _scaffoldKey,
        endDrawerEnableOpenDragGesture: false,
        endDrawer: Container(
          child: Drawer(
            child: Column(
              children: [
                const UserAccountsDrawerHeader(
                  decoration: BoxDecoration(color: Colors.greenAccent),
                  accountName: Text(
                    "Abhishek Sharma",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  accountEmail: Text(
                    "sharmaabhi4433@gmail.com",
                    style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),
                  ),
                ),
                Column(
                  children: drawerOptions,
                )
              ],
            ),
          ),
        ),
        body: _getDrawerItemWidget(_selectedDrawerIndex),
      ),
    );
  }

  void toggleDrawer() {
    if (_scaffoldKey.currentState?.isEndDrawerOpen == false) {
      _scaffoldKey.currentState?.openEndDrawer();
    } else {
      _scaffoldKey.currentState?.closeEndDrawer();
    }
  }
}
