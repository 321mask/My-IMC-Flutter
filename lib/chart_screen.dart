import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'services/imc_storage.dart';

class ChartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('IMC History Chart')),
      body: FutureBuilder(
        future: IMCStorage.getIMCHistory(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return Center(child: CircularProgressIndicator());

          final data = snapshot.data as List<Map<String, dynamic>>;

          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: LineChart(
              LineChartData(
                lineBarsData: [
                  LineChartBarData(
                    spots: data.asMap().entries.map((e) {
                      return FlSpot(e.key.toDouble(), (e.value['imc'] as num).toDouble());
                    }).toList(),
                    isCurved: true,
                    color: Colors.teal,
                    barWidth: 3,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
