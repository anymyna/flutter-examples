import 'package:flutter/material.dart';

void main() => runApp(MainPage());

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePage createState() {
    return _HomePage(title: '简单对话框组件');
  }
}

enum Department { treasury, state }

class _HomePage extends State<HomePage> {
  _HomePage({Key key, @required this.title});

  final String title;

  ThemeData themeData = new ThemeData.light();
  Future<void> _askedToLead() async {
    switch (await showDialog<Department>(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: const Text('Select assignment'),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, Department.treasury);
                },
                child: const Text('Treasury department'),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, Department.state);
                },
                child: const Text('State department'),
              ),
            ],
          );
        })) {
      case Department.treasury:
      // Let's go.
      // ...
        break;
      case Department.state:
      // ...
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: this.title,
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text(this.title),
        ),
        body: null,
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.format_list_numbered),
          onPressed: _askedToLead,
        ),
      ),
      theme: themeData,
    );
  }
}