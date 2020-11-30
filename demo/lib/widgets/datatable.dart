import 'package:flutter/material.dart';
import 'package:demo/screens/tabs.dart';

class AppDataTable extends StatelessWidget {
  final List<Car> data;
  AppDataTable({this.data});

  @override
  Widget build(BuildContext context) {
    var headerStyle =
        Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.white);
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).primaryColor.withOpacity(0.2),
          ),
        ),
        child: SingleChildScrollView(
          child: DataTable(
            showBottomBorder: true,
            showCheckboxColumn: false,
            columns: <DataColumn>[
              DataColumn(
                label: Text(
                  "ID",
                  style: headerStyle,
                ),
              ),
              DataColumn(
                label: Text(
                  "Name",
                  style: headerStyle,
                ),
              ),
              DataColumn(
                label: Text(
                  "Model",
                  style: headerStyle,
                ),
              ),
              DataColumn(
                label: Text(
                  "Price",
                  style: headerStyle,
                ),
              ),
            ],
            rows: List.generate(
              data.length,
              (i) {
                return DataRow(
                  color: MaterialStateProperty.resolveWith<Color>(
                    (_) => (i % 2 != 0)
                        ? Theme.of(context).primaryColor.withOpacity(0.1)
                        : Colors.white10.withOpacity(0.1),
                  ),
                  cells: <DataCell>[
                    DataCell(Text(data[i].id.toString())),
                    DataCell(Text(data[i].name.toString())),
                    DataCell(Text(data[i].model.toString())),
                    DataCell(Text("\$ ${data[i].price.toInt()}")),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
