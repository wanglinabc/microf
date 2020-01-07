import 'package:flutter/material.dart';
import 'dart:async';
// import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:microf/util/screenUtil.dart';
import 'package:photo/photo.dart';
import 'package:flutter/cupertino.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:microf/components/photo/preview.dart';
import 'package:microf/components/dialog/load.dart';

class App extends StatefulWidget {
  App({Key key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  int _index = 0;
  int _selectedItemPosition = 0;
  void _pickAsset(
      {List<AssetPathEntity> pathList, PickType type: PickType.all}) async {
    /// context is required, other params is optional.
    /// context is required, other params is optional.
    /// context is required, other params is optional.
    if (pathList == null) {
      pathList = await PhotoManager.getAssetPathList();
    }
    print(pathList);
    print(pathList.join(","));
    // var list=await pathList[0].assetList;
    // print(list);
    List<AssetEntity> imgList = await PhotoPicker.pickAsset(
      // BuildContext required
      context: context,

      /// The following are optional parameters.
      themeColor: Colors.green,
      // the title color and bottom color

      textColor: Colors.white,
      // text color
      padding: 1.0,
      // item padding
      dividerColor: Colors.grey,
      // divider color
      disableColor: Colors.grey.shade300,
      // the check box disable color
      itemRadio: 0.88,
      // the content item radio
      maxSelected: 8,
      // max picker image count
      // provider: I18nProvider.english,
      provider: I18nProvider.chinese,
      // i18n provider ,default is chinese. , you can custom I18nProvider or use ENProvider()
      rowCount: 3,
      // item row count

      thumbSize: 150,
      // preview thumb size , default is 64
      sortDelegate: SortDelegate.common,
      // default is common ,or you make custom delegate to sort your gallery
      checkBoxBuilderDelegate: DefaultCheckBoxBuilderDelegate(
        activeColor: Colors.white,
        unselectedColor: Colors.white,
        checkColor: Colors.green,
      ),
      // default is DefaultCheckBoxBuilderDelegate ,or you make custom delegate to create checkbox

      // loadingDelegate: buildBigImageLoading(context),
      // if you want to build custom loading widget,extends LoadingDelegate, [see example/lib/main.dart]

      badgeDelegate: const DurationBadgeDelegate(),
      // badgeDelegate to show badge widget

      pickType: type,

      photoPathList: pathList,
    );
    if (imgList == null || imgList.isEmpty) {
      print("No pick item.");
    } else {
      List<String> r = [];
      for (var e in imgList) {
        var file = await e.file;
        r.add(file.absolute.path);
      }
      print(r.join(","));
      List<AssetEntity> preview = [];
      preview.addAll(imgList);
      Navigator.push(context,
          MaterialPageRoute(builder: (_) => PreviewPage(list: preview)));
    }
    setState(() {});
  }

  void test() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Loading();
        });
    Timer(Duration(seconds: 1), () {
      Navigator.of(context).pop();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: IndexedStack(
            index: _selectedItemPosition,
            children: <Widget>[
              Center(
                child: IconButton(
                  icon: Icon(Icons.add),
                  onPressed: test,
                ),
              ),
              Center(
                child: Text('calendar'),
              ),
              Center(
                child: Text('home'),
              ),
              Center(
                child: Text('个人'),
              ),
            ],
          ),
          bottomNavigationBar: Container(
            height: 56,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                BottomNavigationBar(
                  currentIndex: _index,
                  unselectedItemColor: Colors.black,
                  backgroundColor: Colors.grey[200],
                  selectedFontSize: Screen.setF(30),
                  unselectedFontSize: Screen.setF(30),
                  iconSize: Screen.setF(60),
                  selectedItemColor: Colors.red,
                  showUnselectedLabels: true,
                  type: BottomNavigationBarType.fixed,
                  onTap: (int i) {
                    print(i);
                    if (i != 2) {
                      setState(() {
                        _selectedItemPosition = i > 2 ? i - 1 : i;
                        _index = i;
                      });
                    } else {
                      _pickAsset();
                    }
                  },
                  items: [
                    BottomNavigationBarItem(
                        icon: Icon(Icons.home), title: Text("首页")),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.search), title: Text("发现")),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.send), title: Text("")),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.message), title: Text("消息")),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.person), title: Text("个人")),
                  ],
                ),
                Align(
                  alignment: Alignment.center,
                  child: InkWell(
                    child: Container(
                      width: 40,
                      height: 40,
                      child: FloatingActionButton(
                        elevation: 0,
                        child: Icon(
                          Icons.add,
                          size: 30,
                        ),
                        onPressed: _pickAsset,
                      ),
                    ),
                  ),
                )
              ],
            ),
          )),

      // SnakeNavigationBar(
      //   style: SnakeBarStyle.floating,
      //   backgroundColor: Colors.deepPurpleAccent,
      //   currentIndex: _selectedItemPosition,
      //   showUnselectedLabels: true,
      //   snakeShape: SnakeShape.circle,
      //   onTap: (index) => setState(() => _selectedItemPosition = index),
      //   items: [
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.home),
      //         title: Text(
      //           '首页',
      //           style: TextStyle(fontSize: Screen.setF(15.0)),
      //         )),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.find_in_page),
      //       title: Text('发现', style: TextStyle(fontSize: Screen.setF(15.0))),
      //     ),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.message),
      //         title:
      //             Text('消息', style: TextStyle(fontSize: Screen.setF(15.0)))),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.person),
      //         title:
      //             Text('个人', style: TextStyle(fontSize: Screen.setF(15.0)))),
      //   ],
      // )
    );
  }
}
