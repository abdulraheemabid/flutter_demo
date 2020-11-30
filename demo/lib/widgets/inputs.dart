import 'package:demo/widgets/widget-container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Inputs extends StatelessWidget {
  final double spaceBelowElementHeading;

  Inputs({this.spaceBelowElementHeading});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.start,
      spacing: 30,
      runSpacing: 30,
      children: [
        WidgetContainer(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Text"),
              SizedBox(height: spaceBelowElementHeading),
              TextField(
                style: Theme.of(context).textTheme.bodyText2,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  isDense: false,
                  labelText: 'Name',
                ),
              ),
            ],
          ),
        ),
        WidgetContainer(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Number"),
              SizedBox(height: spaceBelowElementHeading),
              TextField(
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                ],
                keyboardType: TextInputType.number,
                style: Theme.of(context).textTheme.bodyText2,
                decoration: InputDecoration(
                  isDense: false,
                  //border: OutlineInputBorder(),
                  labelText: 'Age',
                ),
              ),
            ],
          ),
        ),
        WidgetContainer(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Switch"),
              SizedBox(height: spaceBelowElementHeading),
              Switch(
                value: true,
                onChanged: (val) {},
              ),
            ],
          ),
        ),
        WidgetContainer(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Date Picker"),
              SizedBox(height: spaceBelowElementHeading),
              IconButton(
                icon: Icon(Icons.calendar_today_outlined),
                onPressed: () {
                  showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2025),
                  );
                }, //  <-- leading Checkbox
              ),
            ],
          ),
        ),
        WidgetContainer(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Slider"),
              SizedBox(height: spaceBelowElementHeading),
              Slider(
                value: 40,
                min: 0,
                max: 100,
                divisions: 5,
                label: "40",
                onChanged: (double value) {},
              ),
            ],
          ),
        ),
        WidgetContainer(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Radio"),
              SizedBox(height: spaceBelowElementHeading),
              Column(
                children: <Widget>[
                  ListTile(
                    contentPadding: EdgeInsets.all(0),
                    title: const Text('Value 1'),
                    leading: Radio(
                      value: "value 1",
                      groupValue: "value 1",
                      onChanged: (value) {},
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        WidgetContainer(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Checkbox"),
              SizedBox(height: spaceBelowElementHeading),
              CheckboxListTile(
                contentPadding: EdgeInsets.only(left: 10),
                title: Text("Value 1"),
                value: true,
                onChanged: (newValue) {},
                controlAffinity:
                    ListTileControlAffinity.leading, //  <-- leading Checkbox
              ),
            ],
          ),
        ),
      ],
    );
  }
}
