import 'package:demo/widgets/widget-container.dart';
import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  final double widht;
  final double spaceBelowElementHeading;

  Buttons({this.widht, this.spaceBelowElementHeading});

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
              Text("Raised"),
              SizedBox(height: spaceBelowElementHeading),
              RaisedButton(
                child: Text("Button"),
                onPressed: () {},
              ),
            ],
          ),
        ),
        WidgetContainer(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Outline",
              ),
              SizedBox(height: spaceBelowElementHeading),
              OutlineButton(
                onPressed: () {},
                child: Text(
                  'Button',
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
              ),
            ],
          ),
        ),
        WidgetContainer(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Flat"),
              SizedBox(height: spaceBelowElementHeading),
              FlatButton(
                child: Text(
                  "Button",
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
        WidgetContainer(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Icon"),
              SizedBox(height: spaceBelowElementHeading),
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {},
              ),
            ],
          ),
        ),
        WidgetContainer(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Dropdown"),
              SizedBox(height: spaceBelowElementHeading - 3),
              DropdownButton<String>(
                value: "Option 1",
                iconSize: 15,
                icon: Icon(Icons.arrow_downward),
                onChanged: (String newValue) {},
                items: <String>['Option 1', 'Option 2', 'Option 3']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              )
            ],
          ),
        ),
        WidgetContainer(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Popup"),
              SizedBox(height: 20),
              PopupMenuButton(
                child: Icon(Icons.more_vert),
                itemBuilder: (ctx) {
                  return [
                    PopupMenuItem(
                      value: 1,
                      child: Text(
                        "Menu Item 1",
                      ),
                    ),
                    PopupMenuItem(
                      value: 2,
                      child: Text(
                        "Menu Item 2",
                      ),
                    ),
                  ];
                },
              ),
            ],
          ),
        ),
        WidgetContainer(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Floating"),
              SizedBox(height: spaceBelowElementHeading),
              FloatingActionButton(
                mini: true,
                child: Icon(Icons.add),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}
