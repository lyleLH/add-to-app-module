import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'native_channel.dart';

Widget _buildPhoneInk(String number) {
  return InkWell(
      child: _buildText(number),
      onTap: () {
        launch("tel:$number");
      });
}

Widget _buildText(String text) {
  return Text(
    text,
    style: TextStyle(
        color: Color(0xFF1B1E29), fontSize: 16, fontWeight: FontWeight.w500),
  );
}

Widget _buildRow(String label, Widget right, [double marginTop = 15]) {
  return Container(
      color: Colors.white,
      margin: EdgeInsets.only(top: marginTop),
      height: 60,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(label, style: TextStyle(fontSize: 16, color: Color(0xFF383F4F))),
        right
      ]));
}

Widget buildAppAbout(BuildContext context) {
  return Container(
    color: Color(0xFFF8F8F8),
    child: Column(
      children: [
        Container(
            height: 214,
            color: Colors.white,
            alignment: Alignment.center,
            child: Column(
              children: [
                Container(
                    margin: EdgeInsets.only(top: 20),
                    child:
                        Image.asset("images/logo.png", width: 80, height: 80)),
                Container(
                    margin: EdgeInsets.only(top: 30),
                    child: Text(
                      NativeChannel.instance.appName,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF1B1E29)),
                    )),
              ],
            )),
        _buildRow(
            "客服热线",
            FutureBuilder(
                future: NativeChannel.instance.serviceNumber,
                initialData: defaultServiceNumber,
                builder: (context, snapshot) => _buildPhoneInk(snapshot.data))),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Divider(color: Color(0xFFF3F3F3), height: 1)),
        _buildRow("微信公众号", _buildText(NativeChannel.instance.appName), 0),
        _buildRow("版本号", _buildText(NativeChannel.instance.version)),
      ],
    ),
  );
}
