import 'package:flutter/material.dart';

class MyBottomSheet extends StatelessWidget {
  final double width;
  MyBottomSheet({this.width});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: RaisedButton(
        child: Text("Show BottomSheet"),
        onPressed: () => _showBottomSheet(context),
      ),
    );
  }

  void _showBottomSheet(context) {
    Scaffold.of(context).showBottomSheet(
      (BuildContext context) {
        return Container(
          height: 200,
          color: Colors.amber,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  'Bottom Sheet',
                  style: Theme.of(context).textTheme.headline4,
                ),
                ElevatedButton(
                  child: const Text('Close BottomSheet'),
                  onPressed: () => Navigator.pop(context),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
