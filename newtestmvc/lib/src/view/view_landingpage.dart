import 'package:flutter/material.dart';
import 'package:newtestmvc/src/view/showdatapage/view_showdata.dart';

class LandingPage extends StatefulWidget {
  LandingPage({Key? key}) : super(key: key);
  @override
  LandingPageState createState() => LandingPageState();
}

// StateMVC
class LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Container(
            child: Image.asset(
          'assets/images/owl-2.jpg',
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
          alignment: Alignment.center,
        )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => ShowData()));
        },
        tooltip: 'go to the next page',
        child: Icon(Icons.arrow_right),
      ),
    );
  }
}
