/**
 * @描述 flultter channel与原生交互通道
 * @author chessluo
 * @email superluo666@gmail.com
 * @github https://github.com/ChessLuo
 * @date 2019-08-10
 *
 */
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ChannelDemo extends StatefulWidget{





  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ChannelState();
  }

}

class ChannelState extends State<ChannelDemo> {

  static const EventChannel eventChannel =
  EventChannel('samples.flutter.io/charging');
  static const platform = const MethodChannel('samples.flutter.io/battery');
  String _batteryLevel = 'Battery level: unknown.';
  String _chargingStatus = 'Battery status: unknown.';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    eventChannel.receiveBroadcastStream().listen(_onEvent, onError: _onError);
  }

  void _onEvent(Object event) {
    setState(() {
      _chargingStatus =
      "Battery status: ${event == 'charging' ? '' : 'dis'}charging.";
    });
  }

  void _onError(Object error) {
    setState(() {
      _chargingStatus = 'Battery status: unknown.';
    });
  }
  ///获取电池电量的channel通道方法
  Future<Null> _getBatteryLevel() async {
    String batteryLevel;
    try {
      final int result = await platform.invokeMethod('getBatteryLevel');
      batteryLevel = 'Battery level at $result % .';
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }

    setState(() {
      _batteryLevel = batteryLevel;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Channel"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            RaisedButton(
              child: Text('Battery level label'),
              onPressed: _getBatteryLevel,
            ),
            new Text(_batteryLevel),
            Text(_chargingStatus),
          ],
        ),

      ),
    );
  }

}