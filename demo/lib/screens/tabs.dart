import 'package:demo/drawer.dart';
import 'package:demo/models/device-params.dart';
import 'package:demo/widgets/datatable.dart';
import 'package:demo/widgets/list.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Tabs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final DeviceParams deviceParams = ModalRoute.of(context).settings.arguments;
    final List<Car> data = Car.getCars();
    final AppBar appBar = AppBar(
      title: Text("Tabs, Lists & Tables"),
    );
    return Scaffold(
      appBar: appBar,
      drawer: AppDrawer(),
      body: Center(
          child: Container(
        decoration: !deviceParams.isSmallDevice
            ? BoxDecoration(border: Border.all(color: Colors.red))
            : null,
        width: deviceParams.containerWidth,
        child: Column(
          children: [
            DefaultTabController(
              length: 3,
              initialIndex: 0,
              child: Column(
                children: [
                  _tabBar(),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      "Cars",
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height -
                        appBar.preferredSize.height -
                        _tabBar(sizeFlag: true).height -
                        MediaQuery.of(context).padding.top -
                        100,
                    child: TabBarView(
                      children: [
                        DataList(
                          data: data,
                        ),
                        AppDataTable(data: data),
                        kIsWeb
                            ? AppDataTable(data: data)
                            : DataList(data: data),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }

  dynamic _tabBar({bool sizeFlag = false}) {
    var bar = TabBar(
      tabs: [
        Tab(text: "List"),
        Tab(text: "Table"),
        Tab(text: "Adaptive"),
      ],
    );
    return sizeFlag ? bar.preferredSize : bar;
  }
}

class Car {
  int id;
  String name;
  int model;
  double price;

  Car({this.id, this.name, this.model, this.price});

  static List<Car> getCars() {
    return [
      Car(id: 1, name: "Honda", model: 2015, price: 50000),
      Car(id: 2, name: "Toyota", model: 2016, price: 60000),
      Car(id: 3, name: "Suzuki", model: 2017, price: 30000),
      Car(id: 4, name: "KIA", model: 2017, price: 80000),
      Car(id: 5, name: "Hyundai", model: 2018, price: 40000),
      Car(id: 6, name: "Honda", model: 2015, price: 50000),
      Car(id: 7, name: "Toyota", model: 2016, price: 60000),
      Car(id: 8, name: "Suzuki", model: 2017, price: 30000),
      Car(id: 9, name: "KIA", model: 2017, price: 80000),
      Car(id: 10, name: "Hyundai", model: 2018, price: 40000),
      Car(id: 11, name: "Honda", model: 2015, price: 50000),
      Car(id: 12, name: "Toyota", model: 2016, price: 60000),
      Car(id: 13, name: "Suzuki", model: 2017, price: 30000),
      Car(id: 14, name: "KIA", model: 2017, price: 80000),
      Car(id: 15, name: "Hyundai", model: 2018, price: 40000),
    ];
  }
}
