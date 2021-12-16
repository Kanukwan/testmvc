import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:newtestmvc/src/models/cats_model.dart';
import 'package:newtestmvc/src/service/connect_asset.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends AppStatefulWidgetMVC {
  const MyApp({Key? key}) : super(key: key);
  @override
  AppStateMVC createState() => View();
}

class View extends AppStateMVC<MyApp> {
  @override
  Widget buildApp(BuildContext context) => MaterialApp(
        home: LandingPage(),
      );
}

/* 

  Landing Page

*/
class LandingPage extends StatefulWidget {
  LandingPage({Key? key}) : super(key: key);
  @override
  LandingPageState createState() => LandingPageState();
}

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
        backgroundColor: Colors.purple,
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

/* 

  Show Data

*/
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
    // tab List
    List<Widget?> _tabList = <Widget>[
      // [1]
      con.isLoading
          ? Center(
              child: CircularProgressIndicator(), // show circle loading
            )
          : Container(
              color: Colors.purple[200],
              //widget page A
              child: Container(
                height: MediaQuery.of(context).size.height,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: con.listCatData.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Card(
                          color: Colors.amber,
                          elevation: 3, //shadow
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0)),
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                    '${con.listCatData[index].title} : ${con.listCatData[index].subtitle}'),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )), // listCatData
      // [2]
      Container(
        color: Colors.purple[200],
      )
    ];

    // Main
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.purple),
      body: Center(
        child: _tabList.elementAt(con.selectTabIndex!),
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
        selectedItemColor: Colors.purple,
        currentIndex: con.selectTabIndex!,
        onTap: con.onItemTapped,
      ),
    );
  }
}

/* 

  Controller

*/
class ControllerWidget extends ControllerMVC {
  factory ControllerWidget([StateMVC? state]) =>
      _this ??= ControllerWidget._(state);
  ControllerWidget._(StateMVC? state) : super(state);
  static ControllerWidget? _this;

  int? selectTabIndex = 0;
  bool isLoading = true;
  List<CatsAssets> listCatData = <CatsAssets>[];

  @override
  void initState() {
    super.initState();
    getJsonCats();
  }

  // Change Tab
  void onItemTapped(int? index) {
    setState(() {
      selectTabIndex = index;
    });
  }

  // GET data from static json file
  Future getJsonCats() async {
    await ConnectCatsAsset.convertAsset().then((data) {
      setState(() {
        isLoading = false;
        listCatData = data;
      });
      // return listCatData;
      // return data;
    });
  }
}

