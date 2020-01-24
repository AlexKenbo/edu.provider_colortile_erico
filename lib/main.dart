import 'package:flutter/material.dart';

import 'application_color.dart';

import 'package:provider/provider.dart';

/*
Tutorial Provider
https://www.youtube.com/watch?v=NNKKpECZUnw
*/

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider<ApplicationColor>(
          builder: (context) => ApplicationColor(), child: MyHomePage()),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Consumer<ApplicationColor>(
          builder: (context, applicationColor, _) => Text(
              'Provider State Management',
              style: TextStyle(color: applicationColor.color)),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Consumer<ApplicationColor>(
              builder: (context, applicationColor, _) => AnimatedContainer(
                margin: EdgeInsets.all(5),
                width: 100,
                height: 100,
                color: applicationColor.color,
                duration: Duration(milliseconds: 500),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text('Orange'),
                ),
                Consumer<ApplicationColor>(
                  builder: (context, applicationColor, _) => Switch(
                    value: applicationColor.isLightBlue,
                    onChanged: (newValue) {
                      applicationColor.isLightBlue = newValue;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text('Blue'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
