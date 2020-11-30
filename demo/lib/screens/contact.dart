import 'package:demo/models/device-params.dart';
import 'package:flutter/material.dart';

import '../drawer.dart';

class Contact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final DeviceParams deviceParams = ModalRoute.of(context).settings.arguments;
    double textFieldWidth = deviceParams.containerWidth * 0.45 - 5;
    return Scaffold(
      appBar: AppBar(
        title: Text("Contact"),
      ),
      drawer: AppDrawer(),
      body: Center(
        child: Container(
          alignment: Alignment.topCenter,
          width: deviceParams.containerWidth,
          decoration: !deviceParams.isSmallDevice
              ? BoxDecoration(border: Border.all(color: Colors.red))
              : null,
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.person),
                    getTextField(
                      ctx: context,
                      label: "First Name",
                      width: textFieldWidth,
                    ),
                    getTextField(
                      ctx: context,
                      label: "Last Name",
                      width: textFieldWidth,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.phone),
                    getTextField(
                      ctx: context,
                      label: "Phone",
                      width: textFieldWidth * 1.25,
                    ),
                    getDropdownButton(
                      ctx: context,
                      label: "Area",
                      contWidht: textFieldWidth * 0.75,
                      btnWidth: (textFieldWidth * 0.5) - 40,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.email),
                    getTextField(
                      ctx: context,
                      label: "Email",
                      width: textFieldWidth * 2,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.location_city),
                    getDropdownButton(
                      ctx: context,
                      label: "Country",
                      contWidht: textFieldWidth,
                      btnWidth: (textFieldWidth * 0.5) - 10,
                    ),
                    getDropdownButton(
                      ctx: context,
                      label: "City",
                      contWidht: textFieldWidth,
                      btnWidth: (textFieldWidth * 0.5) - 10,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.location_pin),
                    getTextField(
                      ctx: context,
                      label: "Address",
                      width: textFieldWidth * 2,
                      maxLines: 2,
                    ),
                  ],
                ),
                if (deviceParams.isSmallDevice)
                  Container(
                    width: deviceParams.containerWidth * 0.9 + 20,
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      "Prefered method of contact:",
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ),
                Container(
                  width: deviceParams.containerWidth * 0.9 + 35,
                  padding: const EdgeInsets.only(bottom: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      if (!deviceParams.isSmallDevice)
                        Container(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(
                            "Prefered method of contact:",
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                        ),
                      ...getRadioButtons(
                        context: context,
                        grpValue: "Email",
                        label: "Email",
                        value: "Email",
                      ),
                      ...getRadioButtons(
                        context: context,
                        grpValue: "Email",
                        label: "Phone",
                        value: "Phone",
                      ),
                    ],
                  ),
                ),
                if (deviceParams.isSmallDevice)
                  Container(
                    width: deviceParams.containerWidth * 0.9 + 20,
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      "Which of the following products you have purchsed from us:",
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ),
                Container(
                  alignment: Alignment.center,
                  width: deviceParams.containerWidth * 0.9 + 35,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      if (!deviceParams.isSmallDevice)
                        Container(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(
                            "Which of the following products you have purchsed from us:",
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                        ),
                      ...getCheckBox(
                          context: context, label: "Product1", selected: false),
                      ...getCheckBox(
                        context: context,
                        label: "Product2",
                      ),
                      ...getCheckBox(
                        context: context,
                        label: "Product3",
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    getTextField(
                      ctx: context,
                      label: "Message",
                      width: deviceParams.containerWidth * 0.9 + 18,
                      maxLines: 4,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: RaisedButton(
                        child: Text("Submit"),
                        onPressed: () {},
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget getTextField({width, ctx, label, maxLines = 1}) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: width,
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          isDense: true,
          labelText: label,
        ),
        maxLines: maxLines,
        style: Theme.of(ctx).textTheme.bodyText2,
      ),
    );
  }

  Widget getDropdownButton({contWidht, btnWidth, ctx, label}) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: contWidht,
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black38),
          borderRadius: BorderRadius.circular(4),
        ),
        height: 45,
        child: DropdownButtonHideUnderline(
          child: DropdownButton(
            style: Theme.of(ctx).textTheme.bodyText2,
            hint: Container(
              width: btnWidth,
              child: Text(
                label,
              ),
            ),
            iconSize: 15,
            icon: Icon(Icons.arrow_downward),
            onChanged: (String newValue) {},
            items: <String>['01', '02', '03']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  List<Widget> getCheckBox({context, label, selected = true}) {
    return [
      Checkbox(
        value: selected,
        onChanged: (newValue) {},
        visualDensity: VisualDensity.compact,
      ),
      Text(
        label,
        style: Theme.of(context).textTheme.bodyText2,
      ),
    ];
  }

  List<Widget> getRadioButtons({context, value, grpValue, label}) {
    return [
      Radio(
        value: value,
        groupValue: grpValue,
        visualDensity: VisualDensity.compact,
        onChanged: (value) {},
      ),
      Text(
        label,
        style: Theme.of(context).textTheme.bodyText2,
      )
    ];
  }
}
