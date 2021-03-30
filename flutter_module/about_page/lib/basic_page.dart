import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'native_channel.dart';
import 'dart:io';

Widget _buildHelloWorld(BuildContext context) {
  return Center(child: Text("Hello World!"));
}

class BasicPage extends StatefulWidget {
  BasicPage(
      {Key key,
      this.title,
      this.backgroundColor,
      this.contentBuilder = _buildHelloWorld})
      : super(key: key);

  final String title;

  final Color backgroundColor;

  final WidgetBuilder contentBuilder;

  @override
  _BasicPageState createState() => _BasicPageState();
}

class _BasicPageState extends State<BasicPage> {
  @override
  Widget build(BuildContext context) {
    var foregroundColor =
        widget.backgroundColor == Colors.white ? Colors.black : Colors.white;
    return Scaffold(
      appBar: AppBar(
        // backgroundColor:
        //     widget.backgroundColor ?? Theme.of(context).primaryColor,
        elevation: 0,
        toolbarHeight: 44,
        centerTitle: true,
        title: Text(
          widget.title,
          style: TextStyle(color: foregroundColor),
        ),
        leading: IconButton(
            iconSize: 24,
            padding: EdgeInsets.zero,
            splashRadius: 24,
            icon: Icon(
              Icons.navigate_before,
              // color: foregroundColor,
            ),
            onPressed: () {
              SystemNavigator.pop();
              // Navigator.pop(context);
              if (Platform.isIOS) {}
              Map<String, dynamic> map = {"name": "", "arguments": "test"};
              NativeChannel.instance
                  .invokeNativeMethod("OPEN_GALLERY", param: map);
            }),
      ),
      body: widget.contentBuilder(context),
    );
  }
}
