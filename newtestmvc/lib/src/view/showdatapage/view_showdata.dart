import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:newtestmvc/src/controller/controller_widget.dart';

class ShowData extends StatefulWidget {
  ShowData({Key? key}) : super(key: key);

  @override
  ShowDataState createState() => ShowDataState();
}

class ShowDataState extends StateMVC<ShowData> {
  ShowDataState({Key? key}) : super(ControllerWidget()) {
    con = controller as ControllerWidget;
  }
  // declare variable
  late ControllerWidget con;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.purple),
      body: Center(
        child: Column(
          children: [
            Card(
              child: Text('Neko Chan~~~'),
            ),
            Card(
              child: Text('Inukami!!!'),
            ),
          ],
        ),
      ),
      // Nav Bar
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white70,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.bookOpen),
            label: 'PAGE1',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.bookReader),
            label: 'PAGE2',
          ),
        ],
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.blue,
        currentIndex: con.selectTabIndex!,
        onTap: con.onItemTapped,
      ),
    );
  }
}
