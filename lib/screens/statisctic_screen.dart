import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class StatisticScreen extends StatefulWidget {
  const StatisticScreen({Key? key}) : super(key: key);

  @override
  State<StatisticScreen> createState() => _StatisticScreenState();
}

class _StatisticScreenState extends State<StatisticScreen> {
  @override
  Widget build(BuildContext context) {
    final gradientColors = [
      Theme.of(context).colorScheme.primary,
      Theme.of(context).colorScheme.primary.withOpacity(0.5),
    ];
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 300,
            child: LineChart(
              LineChartData(
                lineTouchData: LineTouchData(
                  getTouchedSpotIndicator: (barData, spotIndexes) {
                    return [
                      TouchedSpotIndicatorData(
                          FlLine(dashArray: [8, 8], strokeWidth: 1),
                          barData.dotData)
                    ];
                  },
                ),
                gridData: FlGridData(
                  getDrawingHorizontalLine: (value) {
                    return FlLine(
                      color: Colors.transparent,
                    );
                  },
                  getDrawingVerticalLine: (value) {
                    return FlLine(
                      color: Colors.transparent,
                    );
                  },
                ),
                borderData: FlBorderData(
                  border: const Border(
                    bottom: BorderSide.none,
                  ),
                ),
                titlesData: FlTitlesData(
                  show: true,
                  rightTitles: SideTitles(showTitles: false),
                  leftTitles: SideTitles(showTitles: false),
                  topTitles: SideTitles(showTitles: false),
                  bottomTitles: SideTitles(
                    showTitles: true,
                    interval: 1,
                    getTextStyles: (context, value) => TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    getTitles: (value) {
                      switch (value.toInt()) {
                        case 2:
                          return 'MAR';
                        case 5:
                          return 'JUN';
                        case 8:
                          return 'SEP';
                      }
                      return '';
                    },
                    margin: 10,
                  ),
                ),
                minX: 0,
                minY: 0,
                maxX: 11,
                maxY: 6,
                lineBarsData: [
                  LineChartBarData(
                    spots: const [
                      FlSpot(0, 3),
                      FlSpot(2.6, 2),
                      FlSpot(4.9, 5),
                      FlSpot(6.8, 3.1),
                      FlSpot(8, 4),
                      FlSpot(9.5, 3),
                      FlSpot(11, 4),
                    ],
                    isCurved: true,
                    colors: gradientColors,
                    barWidth: 3,
                    // isStrokeCapRound: true,
                    dotData: FlDotData(
                      show: false,
                    ),

                    belowBarData: BarAreaData(
                      show: true,
                      colors: gradientColors
                          .map((color) => color.withOpacity(0.2))
                          .toList(),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
