import 'package:demo/models/device-params.dart';
import 'package:demo/widgets/buttons.dart';
import 'package:demo/widgets/inputs.dart';
import 'package:flutter/material.dart';

import '../drawer.dart';

class Forms extends StatefulWidget {
  @override
  _FormsState createState() => _FormsState();
}

class _FormsState extends State<Forms> {
  bool isButtonsExpanded;
  bool isInputsExpanded;
  @override
  void initState() {
    isButtonsExpanded = true;
    isInputsExpanded = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const double spaceBelowHeading = 30;
    const double spaceBelowSection = 70;
    const double spaceBelowElementHeading = 10;
    final DeviceParams deviceParams = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text("Form Controls"),
      ),
      drawer: AppDrawer(),
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: deviceParams.containerWidth,
          decoration: !deviceParams.isSmallDevice
              ? BoxDecoration(border: Border.all(color: Colors.red))
              : null,
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text("Buttons", style: Theme.of(context).textTheme.headline4),
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                      0, spaceBelowHeading, 0, spaceBelowSection),
                  child: Buttons(
                    spaceBelowElementHeading: spaceBelowElementHeading,
                  ),
                ),
                Text("Inputs", style: Theme.of(context).textTheme.headline4),
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                      0, spaceBelowHeading, 0, spaceBelowSection),
                  child: Inputs(
                    spaceBelowElementHeading: spaceBelowElementHeading,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
