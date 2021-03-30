import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_about.dart';
import 'basic_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // 沉浸式状态栏
  if (Platform.isAndroid) {
    // 以下两行 设置android状态栏为透明的沉浸。
    // 写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏
    // 写在渲染之前MaterialApp组件会覆盖掉这个值。
    SystemUiOverlayStyle systemUiOverlayStyle =
        SystemUiOverlayStyle(statusBarColor: Colors.white);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  Widget _buildAboutPage(BuildContext context) {
    return BasicPage(
        title: "关于我们",
        backgroundColor: Colors.white,
        contentBuilder: (context) {
          return buildAppAbout(context);
        });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Module',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: _buildAboutPage(context),
      /*initialRoute: "/about",
      routes: {
        "/about": _buildAboutPage
      },*/
    );
  }
}
