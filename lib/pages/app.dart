import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:microf/util/screenUtil.dart';

class App extends StatefulWidget {
  App({Key key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  int _selectedItemPosition = 0;
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: IndexedStack(
            index: _selectedItemPosition,
            children: <Widget>[
              Center(
                child: Text('首页'),
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
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: index,
            unselectedItemColor: Colors.black,
            backgroundColor: Colors.grey[200],
            selectedFontSize: Screen.setF(30),
            unselectedFontSize: Screen.setF(30),
            iconSize: Screen.setF(60),
            selectedItemColor: Colors.red,
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
            onTap: (int i) {
              if (i != 2) {
                setState(() {
                  _selectedItemPosition = i > 2 ? i - 1 : i;
                  index = i;
                });
              }else{
                
              }
            },
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home), title: Text("首页")),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search), title: Text("发现")),
              BottomNavigationBarItem(icon: Icon(Icons.send), title: Text("")),
              BottomNavigationBarItem(
                  icon: Icon(Icons.message), title: Text("消息")),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), title: Text("个人")),
            ],
          )
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
          ),
    );
  }
}
