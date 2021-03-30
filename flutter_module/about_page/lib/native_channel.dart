import 'package:flutter/services.dart';
import 'package:package_info/package_info.dart';

const _channel_name_about = "com.yeahka.shoufubei/about";

const String defaultServiceNumber = "0755-2633 9288";

class NativeChannel {
  static NativeChannel instance = NativeChannel._();

  NativeChannel._() {
    _channel.setMethodCallHandler(_handleMessage);
    _getPackageInfo();
  }

  final _channel = MethodChannel(_channel_name_about);

  String _appName = "收付贝";

  String _version = "V1.0.0";

  String get appName => _appName;

  String get version => _version;

  Future<String> get serviceNumber async {
    try {
      return await _channel.invokeMethod("getServiceNumber");
    } catch (e) {
      print(e);
    }
    return defaultServiceNumber;
  }

  Future<dynamic> _handleMessage(MethodCall call) async {
    switch (call.method) {
      case "onGetAppIcon":
        break;
      case "onGetServiceNumber":
        break;
    }
    return null;
  }

  void invokeNativeMethod(String methodMame, {Map<String, dynamic> param}) {
    _channel.invokeMethod(methodMame, param);
  }

  void _getPackageInfo() async {
    var packageInfo = await PackageInfo.fromPlatform();
    _appName = packageInfo.appName;
    _version = "V${packageInfo.version}";
  }
}
