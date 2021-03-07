import 'package:flutter/material.dart';

import 'package:truck_load_demo/Models/ChartDataConsumtion.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import 'CategoriesRow.dart';

class DataChart extends StatelessWidget {
  final List<ChartDataConsumtion> data;

  const DataChart({Key key, this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<charts.Series<ChartDataConsumtion, String>> series = [
      charts.Series(
          data: data,
          id: "ChartDataConsumtion",
          domainFn: (ChartDataConsumtion series, _) => series.title,
          measureFn: (ChartDataConsumtion series, _) => series.data,
          colorFn: (ChartDataConsumtion series, _) => series.barColor),
    ];
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [
            Expanded(child: charts.BarChart(series, animate: true)),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  CategoriesRow(
                    text: 'Order Placed',
                    color: Colors.green,
                  ),
                  CategoriesRow(
                    text: 'Details Collected',
                    color: Color(0xffFCAE00),
                  ),
                  CategoriesRow(
                    text: 'Order Confirmed',
                    color: Color(0xffE80000),
                  ),
                  CategoriesRow(
                    text: 'Load Completed',
                    color: Color(0xffFA80FA),
                  ),
                ]), //1st colum End here
                SizedBox(
                  width: 20,
                ),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  CategoriesRow(
                    text: 'In transit',
                    color: Color(0xff8613C3),
                  ),
                  CategoriesRow(
                    text: 'Upload Completed',
                    color: Color(0xff00BDE0),
                  ),
                  CategoriesRow(
                    text: 'Consignment done',
                    color: Color(0xff316BED),
                  ),
                ]),
              ]),
            ),
          ],
        ));
  }
}
