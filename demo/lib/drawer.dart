import 'package:flutter/material.dart';

import 'models/device-params.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final containerWidth = getContainerWidht(context);
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            child: Text(
              'Drawer Header',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.dynamic_form),
            title: Text('Form Controls'),
            onTap: () {
              Navigator.of(context)
                  .pushNamed("forms", arguments: containerWidth);
            },
          ),
          ListTile(
            leading: Icon(Icons.contacts),
            title: Text('Contact Form'),
            onTap: () {
              Navigator.of(context)
                  .pushNamed("contact", arguments: containerWidth);
            },
          ),
          ListTile(
            leading: Icon(Icons.grid_on),
            title: Text('Layouts'),
            onTap: () {
              Navigator.of(context)
                  .pushNamed("cards", arguments: containerWidth);
            },
          ),
          ListTile(
            leading: Icon(Icons.warning),
            title: Text('Alerts & Panels'),
            onTap: () {
              Navigator.of(context)
                  .pushNamed("alerts", arguments: containerWidth);
            },
          ),
          ListTile(
            leading: Icon(Icons.source_outlined),
            title: Text('Tabs, Lists & Tables'),
            onTap: () {
              Navigator.of(context)
                  .pushNamed("tabs", arguments: containerWidth);
            },
          ),
          ListTile(
            leading: Icon(Icons.more_vert),
            title: Text('Stepper'),
            onTap: () {
              Navigator.of(context)
                  .pushNamed("steppers", arguments: containerWidth);
            },
          ),
        ],
      ),
    );
  }

  DeviceParams getContainerWidht(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    // Media Query x-large & large devices breakpoint
    if (width >= 1200) {
      return DeviceParams(containerWidth: width * 0.6, isSmallDevice: false);
    } else if (width >= 992) {
      return DeviceParams(containerWidth: width * 0.7, isSmallDevice: false);
    } else if (width >= 768) {
      return DeviceParams(containerWidth: width * 0.8, isSmallDevice: false);
    } else {
      return DeviceParams(containerWidth: width, isSmallDevice: true);
    }
  }
}
