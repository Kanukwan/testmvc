import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:newtestmvc/src/models/cats_model.dart';
import 'package:newtestmvc/src/service/connect_asset.dart';

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
  getJsonCats() async {
    await ConnectCatsAsset.convertAsset().then((data) {
      setState(() {
        isLoading = false;
        listCatData = data;
      });
      // return listCatData;
    });
  }
}
