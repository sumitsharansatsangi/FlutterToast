import 'package:fluttertoast_example/toast_context.dart';
import 'package:fluttertoast_example/toast_no_context.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() => runApp(
      MaterialApp(
        builder: FToastBuilder(),
        home: MyApp(),
        navigatorKey: navigatorKey,
      ),
    );

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Toast"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ToastNoContext(),
                ));
              },
              child: Text("Flutter Toast No Context"),
            ),
            SizedBox(
              height: 24.0,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ToastContext(),
                ));
              },
              child: Text("Flutter Toast Context"),
            ),
          ],
        ),
      ),
    );
  }
}
