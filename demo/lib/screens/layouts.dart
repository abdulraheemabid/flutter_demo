import 'package:demo/drawer.dart';
import 'package:demo/models/device-params.dart';
import 'package:flutter/material.dart';

class Layouts extends StatelessWidget {
  static const colors = [
    Color(0xff673ab7),
    Colors.amber,
    Colors.blue,
    Colors.lightGreen,
    Colors.red,
    Colors.indigo,
    Colors.cyanAccent,
    Colors.brown,
    Colors.orange,
    Colors.pink,
    Colors.indigoAccent,
    Colors.purple,
  ];
  static const List<double> multiplier = [
    0.5,
    0.9,
    0.7,
    1.1,
    0.7,
    0.5,
    0.8,
    1,
    0.6,
    1.1,
    0.5
  ];

  @override
  Widget build(BuildContext context) {
    final DeviceParams deviceParams = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("Layouts"),
      ),
      drawer: AppDrawer(),
      body: Center(
          child: SingleChildScrollView(
        child: Container(
          width: deviceParams.containerWidth,
          decoration: !deviceParams.isSmallDevice
              ? BoxDecoration(border: Border.all(color: Colors.red))
              : null,
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Text(
                "Row",
                style: Theme.of(context).textTheme.headline4,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ..._getWrappedContainers(context, count: 3),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Column",
                style: Theme.of(context).textTheme.headline4,
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  ..._getWrappedContainers(context, count: 3),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Flex",
                style: Theme.of(context).textTheme.headline4,
              ),
              SizedBox(
                height: 20,
              ),
              Flex(
                direction: Axis.horizontal,
                children: [
                  ..._getFlexContainers(context, count: 3),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Wrap",
                style: Theme.of(context).textTheme.headline4,
              ),
              SizedBox(
                height: 20,
              ),
              Wrap(
                direction: Axis.horizontal,
                children: [
                  ..._getWrappedContainers(context, count: 10),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Grid View",
                style: Theme.of(context).textTheme.headline4,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                //height: 400,
                child: GridView.count(
                  crossAxisCount: 3,
                  shrinkWrap: true,
                  children: [..._getGridContainers(context, count: 8)],
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }

  List<Container> _getWrappedContainers(context, {count = 1}) {
    return List.generate(
      count,
      (index) => Container(
        height: 120 * multiplier[index],
        width: 120 * (multiplier[index] + 0.2),
        color: colors[index],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: Colors.black38,
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Text(
                "${index + 1}",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText1.copyWith(
                      color: Colors.white,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Expanded> _getFlexContainers(context, {count = 1}) {
    return List.generate(
      count,
      (index) => Expanded(
        flex: index + 1,
        child: Container(
          height: 120,
          color: colors[index],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                color: Colors.black38,
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: Text(
                  "Flex: ${index + 1}",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyText1.copyWith(
                        color: Colors.white,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Container> _getGridContainers(context, {count = 1}) {
    return List.generate(
      count,
      (index) => Container(
        height: 20,
        width: 20,
        color: colors[index],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: Colors.black38,
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Text(
                (index + 1).toString(),
                style: Theme.of(context).textTheme.bodyText1.copyWith(
                      color: Colors.white,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
