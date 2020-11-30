import 'package:demo/screens/tabs.dart';
import 'package:flutter/material.dart';

class DataList extends StatelessWidget {
  final List<Car> data;
  DataList({this.data});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ...data.map((item) {
          return ListTile(
            tileColor: (item.id % 2 != 0)
                ? Theme.of(context).primaryColor.withOpacity(0.1)
                : Colors.white10.withOpacity(0.1),
            leading: CircleAvatar(
              backgroundColor: Theme.of(context).primaryColor,
              child: Icon(
                Icons.car_rental,
                color: Colors.white,
              ),
            ),
            title:
                Text(item.name, style: Theme.of(context).textTheme.bodyText1),
            subtitle: Text(
              item.model.toString(),
              style: Theme.of(context).textTheme.overline,
            ),
            trailing: Text(
              "\$ ${item.price.toInt()}",
              style: Theme.of(context).textTheme.bodyText1.copyWith(
                    color: Theme.of(context).primaryColor,
                  ),
            ),
            dense: true,
            visualDensity: VisualDensity.comfortable,
          );
        }).toList()
      ],
    );
  }
}

// (item.id % 2 != 0)
//                         ? Theme.of(context).primaryColor
//                         : Theme.of(context).accentColor,
