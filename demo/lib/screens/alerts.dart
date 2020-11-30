import 'package:demo/models/device-params.dart';
import 'package:demo/widgets/bottom-sheet.dart';
import 'package:flutter/material.dart';

import '../drawer.dart';

class Alerts extends StatefulWidget {
  @override
  _AlertsState createState() => _AlertsState();
}

class _AlertsState extends State<Alerts> {
  bool panel1Expanded = false;
  bool panel2Expanded = true;

  @override
  Widget build(BuildContext context) {
    final DeviceParams deviceParams = ModalRoute.of(context).settings.arguments;
    final btnWidth = deviceParams.isSmallDevice
        ? deviceParams.containerWidth * 0.5
        : deviceParams.containerWidth * 0.3;
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text("Alerts & Panels"),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              decoration: !deviceParams.isSmallDevice
                  ? BoxDecoration(border: Border.all(color: Colors.red))
                  : null,
              padding: EdgeInsets.all(10),
              width: deviceParams.containerWidth,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text("Alerts",
                        style: Theme.of(context).textTheme.headline4),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: btnWidth,
                      child: RaisedButton(
                        child: Text("Show Alert Dialog"),
                        onPressed: () => _showActionDialog(context),
                      ),
                    ),
                    Container(
                      width: btnWidth,
                      child: RaisedButton(
                        child: Text("Show Simple Dialog"),
                        onPressed: () => _showSimpleDialog(context),
                      ),
                    ),
                    Container(
                      width: btnWidth,
                      child: RaisedButton(
                        child: Text("Show SnackBar"),
                        onPressed: () =>
                            _showSnackBar(context, deviceParams.isSmallDevice),
                      ),
                    ),
                    MyBottomSheet(width: btnWidth),
                    SizedBox(
                      height: 40,
                    ),
                    Text("Expansion Panel",
                        style: Theme.of(context).textTheme.headline4),
                    SizedBox(
                      height: 15,
                    ),
                    ExpansionPanelList(
                      expandedHeaderPadding: EdgeInsets.all(0),
                      dividerColor: Theme.of(context).accentColor,
                      expansionCallback: (i, isExpanded) {
                        setState(() {
                          if (i == 0) panel1Expanded = !panel1Expanded;
                          if (i == 1) panel2Expanded = !panel2Expanded;
                        });
                      },
                      children: [
                        _getExpantionPanel(1),
                        _getExpantionPanel(2),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  ExpansionPanel _getExpantionPanel(i) {
    return ExpansionPanel(
      canTapOnHeader: true,
      isExpanded: i == 1 ? panel1Expanded : panel2Expanded,
      headerBuilder: (ctx, isExpanded) {
        return ListTile(
          title: Text("Panel $i"),
        );
      },
      body: ListTile(
        leading: CircleAvatar(
          backgroundColor: Theme.of(context).accentColor,
          child: Icon(
            Icons.admin_panel_settings_rounded,
            color: Theme.of(context).primaryColor,
          ),
        ),
        title: Text(
          "Panel $i details",
        ),
        subtitle: Text("Panel $i subtitle"),
        trailing: Icon(
          Icons.delete,
          color: Theme.of(context).errorColor,
        ),
      ),
    );
  }

  Future<void> _showSimpleDialog(context) async {
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

  void _showSnackBar(context, isSmallDevice) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "Snack Bar",
        ),
        padding: isSmallDevice ? EdgeInsets.all(10) : EdgeInsets.all(30),
        backgroundColor: Theme.of(context).errorColor,
      ),
    );
  }

  Future<void> _showActionDialog(context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('AlertDialog Title'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('This is a demo alert dialog.'),
                Text('Would you like to approve of this message?'),
              ],
            ),
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextButton(
                child: Text('Approve'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        );
      },
    );
  }
}

enum Department { treasury, state }
