import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class ShowData extends StatefulWidget {
  ShowData({Key? key}) : super(key: key);

  @override
  ShowDataState createState() => ShowDataState();
}

class ShowDataState extends StateMVC<ShowData> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
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
    );
  }
}
