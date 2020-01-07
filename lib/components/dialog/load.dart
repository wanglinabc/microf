import 'package:flutter/material.dart';

class Loading extends StatefulWidget {
  final Widget child;
  Loading({Key key, this.child}) : super(key: key);
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  void initState() {
    super.initState();
  }

  void dismiss() {
    Navigator.of(context).pop();
  }

  Widget _getDefaultLoad() {
    if (widget.child != null) {
      return widget.child;
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(Colors.red),
          strokeWidth: 3,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          '玩命加载中...',
          style: new TextStyle(
            fontSize: 17.0,
            color: Colors.white,
            letterSpacing: 0.8,
            fontWeight: FontWeight.normal,
            decoration: TextDecoration.none,
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Opacity(
        opacity: 0.6,
        child: Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.black),
          child: _getDefaultLoad(),
        ),
      ),
    );
  }
}
