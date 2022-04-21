import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:income_expense_tracker_app/data/transactions.dart';
import 'package:income_expense_tracker_app/utils/currency_format.dart';

class StatisticScreen extends StatefulWidget {
  const StatisticScreen({Key? key}) : super(key: key);

  @override
  State<StatisticScreen> createState() => _StatisticScreenState();
}

class _StatisticScreenState extends State<StatisticScreen> {
  final _times = ['Day', 'Week', 'Month', 'Year'];

  String times = 'Day';

  int spendingIndex = 0;
  String chooseFilter = 'Income';

  @override
  Widget build(BuildContext context) {
    final gradientColors = [
      Theme.of(context).colorScheme.primary,
      Theme.of(context).colorScheme.primary.withOpacity(0.5),
    ];
    return Theme(
      data: Theme.of(context).copyWith(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          titleTextStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.background,
              ),
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {},
          ),
          title: const Text('Statistics'),
          actions: [
            IconButton(
              icon: const Icon(Icons.file_download_outlined),
              onPressed: () {},
            ),
          ],
        ),
        body: ListView(
          padding: const EdgeInsets.all(10),
          children: [
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: _times
                    .map((time) => ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            elevation: 0,
                            primary: times.contains(time)
                                ? Theme.of(context).colorScheme.primary
                                : Colors.transparent,
                          ),
                          onPressed: () {
                            debugPrint(time);
                            setState(() {
                              times = time;
                            });
                          },
                          child: Text(
                            time,
                            style: TextStyle(
                              color: times.contains(time)
                                  ? Colors.white
                                  : Colors.grey,
                            ),
                          ),
                        ))
                    .toList(),
              ),
            ),
            Row(
              children: [
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      isExpanded: false,
                      items: ['Income', 'Expense']
                          .map(
                            (val) => DropdownMenuItem<String>(
                              child: Text(
                                val,
                              ),
                              value: val,
                            ),
                          )
                          .toList(),
                      value: chooseFilter,
                      onChanged: (value) {
                        setState(() {
                          chooseFilter = value!;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: ScreenUtil().setHeight(30),
            ),
            SizedBox(
              height: ScreenUtil().setHeight(250),
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
                    touchTooltipData: LineTouchTooltipData(
                      tooltipBgColor: Theme.of(context)
                          .colorScheme
                          .primary
                          .withOpacity(0.3),
                    ),
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
                          case 100:
                            return 'Mon';
                          case 350:
                            return 'Tue';
                          case 600:
                            return 'Wed';
                          case 850:
                            return 'Thu';
                          default:
                            return '';
                        }
                      },
                      margin: 10,
                    ),
                  ),
                  minX: 0,
                  minY: 0,
                  maxX: 1000,
                  maxY: 1000,
                  lineBarsData: [
                    LineChartBarData(
                      spots: const [
                        FlSpot(0, 300),
                        FlSpot(200, 500),
                        FlSpot(350, 300),
                        FlSpot(500, 400),
                        FlSpot(800, 200),
                        FlSpot(900, 400),
                        FlSpot(1000, 300),
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
            ),
            ListTile(
              title: Text(
                'Top Spending',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
              ),
              trailing: IconButton(
                icon: const Icon(Icons.filter_list),
                onPressed: () {},
              ),
            ),
            Column(
              children: transactions
                  .map(
                    (tx) => Container(
                      decoration: spendingIndex == transactions.indexOf(tx)
                          ? BoxDecoration(boxShadow: [
                              BoxShadow(
                                color: Theme.of(context)
                                    .colorScheme
                                    .primary
                                    .withOpacity(0.2),
                                offset: const Offset(10, 20),
                                blurRadius: 50,
                              ),
                              BoxShadow(
                                color: Theme.of(context)
                                    .colorScheme
                                    .primary
                                    .withOpacity(0.2),
                                offset: const Offset(-10, 20),
                                blurRadius: 20,
                              ),
                            ])
                          : null,
                      child: ListTile(
                        selected: spendingIndex == transactions.indexOf(tx),
                        enabled: true,
                        selectedTileColor:
                            Theme.of(context).colorScheme.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        onTap: () {
                          setState(() {
                            spendingIndex = transactions.indexOf(tx);
                          });
                          debugPrint(spendingIndex.toString());
                        },
                        leading: SizedBox(
                          width: ScreenUtil().setWidth(50),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: CircleAvatar(
                              backgroundColor: Colors.transparent,
                              backgroundImage: NetworkImage(tx['image']!),
                            ),
                          ),
                        ),
                        title: Text(
                          tx['title']!,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1
                              ?.copyWith(
                                fontWeight: FontWeight.w500,
                                color: spendingIndex == transactions.indexOf(tx)
                                    ? Colors.white
                                    : Colors.black,
                              ),
                        ),
                        subtitle: Text(
                          tx['date']!,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2
                              ?.copyWith(
                                color: spendingIndex == transactions.indexOf(tx)
                                    ? Colors.white
                                    : Colors.grey,
                                fontWeight: FontWeight.w400,
                              ),
                        ),
                        trailing: Text(
                          tx['type']! == 'income'
                              ? "+ " + currencyDollarFormat(tx['amount']!)
                              : "- " + currencyDollarFormat(tx['amount']!),
                          style: TextStyle(
                            color: tx['type']! == 'income'
                                ? spendingIndex == transactions.indexOf(tx)
                                    ? Colors.white
                                    : Colors.green
                                : spendingIndex == transactions.indexOf(tx)
                                    ? Colors.white
                                    : Colors.red,
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            )
          ],
        ),
      ),
    );
  }
}
