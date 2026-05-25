import 'package:fluttertoast_example/main.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastContext extends StatefulWidget {
  const ToastContext({super.key});

  @override
  ToastContextState createState() => ToastContextState();
}

class ToastContextState extends State<ToastContext> {
  late FToast fToast;

  Widget toast = Container(
    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(25.0),
      color: Colors.greenAccent,
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.check),
        SizedBox(width: 12.0),
        Text("This is a Custom Toast"),
      ],
    ),
  );

  void _showToast() {
    fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: Duration(seconds: 2),
    );
  }

  void _showCustomPositionMappingToast() {
    Positioned? customPositionMapping(child, gravity) {
      switch (gravity) {
        case ToastGravity.TOP:
          return Positioned(top: 150.0, left: 24.0, right: 24.0, child: child);
        case ToastGravity.BOTTOM:
          return Positioned(bottom: 200, left: 24.0, right: 24.0, child: child);
        default:
          return null;
      }
    }
    fToast.showToast(
      child: Text("This is the custom ToastGravity.BOTTOM"),
      gravity: ToastGravity.BOTTOM,
      toastDuration: Duration(seconds: 2),
      customPositionMapping: customPositionMapping,
    );

    fToast.showToast(
      child: Text("This is the default ToastGravity.BOTTOM"),
      gravity: ToastGravity.BOTTOM,
      toastDuration: Duration(seconds: 2),
    );
  }

  void _showBuilderToast() {
    fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: Duration(seconds: 2),
      positionedToastBuilder: (context, child) {
        return Positioned(top: 16.0, left: 16.0, child: child);
      },
    );
  }

  void _showToastCancel() {
    Widget toastWithButton = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.redAccent,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Text(
              "This is a Custom Toast This is a Custom Toast This is a Custom Toast This is a Custom Toast This is a Custom Toast This is a Custom Toast",
              softWrap: true,
              style: TextStyle(color: Colors.white),
            ),
          ),
          IconButton(
            icon: Icon(Icons.close),
            color: Colors.white,
            onPressed: () {
              fToast.removeCustomToast();
            },
          ),
        ],
      ),
    );
    fToast.showToast(
      child: toastWithButton,
      gravity: ToastGravity.CENTER,
      toastDuration: Duration(seconds: 50),
    );
  }

  void _queueToasts() {
    fToast.showToast(
      child: toast,
      gravity: ToastGravity.CENTER,
      toastDuration: Duration(seconds: 2),
    );
    fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: Duration(seconds: 2),
    );
    fToast.showToast(
      child: toast,
      gravity: ToastGravity.TOP,
      toastDuration: Duration(seconds: 2),
    );
    fToast.showToast(
      child: toast,
      gravity: ToastGravity.CENTER,
      toastDuration: Duration(seconds: 2),
    );
    fToast.showToast(
      child: toast,
      gravity: ToastGravity.TOP,
      toastDuration: Duration(seconds: 2),
    );
  }

  void _removeToast() {
    fToast.removeCustomToast();
  }

  void _removeAllQueuedToasts() {
    fToast.removeQueuedCustomToasts();
  }

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(navigatorKey.currentContext!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Custom Toasts")),
      body: Center(
        child: Column(
          spacing: 24.0,
          children: [
            ElevatedButton(
              child: Text("Show Custom Toast"),
              onPressed: () {
                _showToast();
              },
            ),

            ElevatedButton(
              child: Text("Show Custom Toast via PositionedToastBuilder"),
              onPressed: () {
                _showBuilderToast();
              },
            ),
            ElevatedButton(
              child: Text("Show Custom Toast via CustomPositionMapping"),
              onPressed: () {
                _showCustomPositionMappingToast();
              },
            ),
            ElevatedButton(
              child: Text("Custom Toast With Close Button"),
              onPressed: () {
                _showToastCancel();
              },
            ),
            ElevatedButton(
              child: Text("Queue Toasts"),
              onPressed: () {
                _queueToasts();
              },
            ),
            ElevatedButton(
              child: Text("Cancel Toast"),
              onPressed: () {
                _removeToast();
              },
            ),
            ElevatedButton(
              child: Text("Remove Queued Toasts"),
              onPressed: () {
                _removeAllQueuedToasts();
              },
            ),
          ],
        ),
      ),
    );
  }
}
