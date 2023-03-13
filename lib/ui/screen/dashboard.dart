import 'package:demo/values/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/noticication_icon_box.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: secondaryColor,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 1000,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    spacing: 20,
                    runSpacing: 20,
                    children: const [
                      NotificationIconBox(
                        iconData: Icons.person_outline,
                        label: "Total users",
                        amount: "13,200",
                      ),
                      NotificationIconBox(
                        iconData: Icons.volunteer_activism,
                        label: "Total request",
                        amount: "762",
                      ),
                      NotificationIconBox(
                        iconData: Icons.trending_up,
                        label: "Total funded",
                        amount: "\$ 5,200",
                      ),
                      NotificationIconBox(
                        iconData: Icons.pending_actions,
                        label: "Pending request",
                        amount: "10",
                      ),
                      NotificationIconBox(
                        iconData: Icons.av_timer,
                        label: "Active Request",
                        amount: "5",
                      ),
                      NotificationIconBox(
                        iconData: Icons.groups,
                        label: "Organizations",
                        amount: "17",
                      ),
                      NotificationIconBox(
                        iconData: Icons.assignment_turned_in,
                        label: "Funded Request",
                        amount: "7",
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Wrap(
                    children: [
                      Material(
                        borderRadius: BorderRadius.circular(10),
                        color: graphBgColor,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Text(
                                "Donation",
                                style: GoogleFonts.roboto(
                                  color: graphTextColor,
                                  textStyle:
                                      Theme.of(context).textTheme.bodyLarge,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 300,
                              width: 600,
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: _LineChart(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      SizedBox(
                        width: 350,
                        height: 450,
                        child: Material(
                          borderRadius: BorderRadius.circular(10),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 10,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Notification",
                                  style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    textStyle:
                                        Theme.of(context).textTheme.bodyLarge,
                                    fontWeight: FontWeight.w600,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LineChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LineChart(
      sampleData1,
    );
  }

  LineChartData get sampleData1 => LineChartData(
        backgroundColor: graphBgColor,
        lineTouchData: lineTouchData1,
        gridData: gridData,
        titlesData: titlesData1,
        borderData: borderData,
        lineBarsData: lineBarsData1,
        minX: 0,
        maxX: 14,
        maxY: 5,
        minY: 0,
      );

  LineTouchData get lineTouchData1 => LineTouchData(
        handleBuiltInTouches: true,
        touchTooltipData: LineTouchTooltipData(
          tooltipBgColor: Colors.blueGrey.withOpacity(0.8),
        ),
      );

  FlTitlesData get titlesData1 => FlTitlesData(
        bottomTitles: AxisTitles(
          sideTitles: bottomTitles,
        ),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        leftTitles: AxisTitles(
          sideTitles: leftTitles(),
        ),
      );

  List<LineChartBarData> get lineBarsData1 => [
        lineChartBarData1_1,
        lineChartBarData1_2,
        lineChartBarData1_3,
      ];

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: graphTextColor,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    String text;
    switch (value.toInt()) {
      case 1:
        text = '1m';
        break;
      case 2:
        text = '2m';
        break;
      case 3:
        text = '3m';
        break;
      case 4:
        text = '4m';
        break;
      case 5:
        text = '5m';
        break;
      case 6:
        text = '6m';
        break;
      case 7:
        text = '7m';
        break;

      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.center);
  }

  SideTitles leftTitles() => SideTitles(
        getTitlesWidget: leftTitleWidgets,
        showTitles: true,
        interval: 1,
        reservedSize: 40,
      );

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: graphTextColor,
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );
    Widget text;
    switch (value.toInt()) {
      case 2:
        text = const Text('SEPT', style: style);
        break;
      case 7:
        text = const Text('OCT', style: style);
        break;
      case 12:
        text = const Text('DEC', style: style);
        break;
      default:
        text = const Text('');
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 10,
      child: text,
    );
  }

  SideTitles get bottomTitles => SideTitles(
        showTitles: true,
        reservedSize: 32,
        interval: 1,
        getTitlesWidget: bottomTitleWidgets,
      );

  FlGridData get gridData => FlGridData(
        show: true,
        drawVerticalLine: false,
      );

  FlBorderData get borderData => FlBorderData(
        show: true,
        border: Border(
          bottom: BorderSide(color: Colors.purple.withOpacity(0.2), width: 4),
          left: BorderSide.none,
          right: BorderSide.none,
          top: BorderSide.none,
        ),
      );

  LineChartBarData get lineChartBarData1_1 => LineChartBarData(
        isCurved: true,
        color: Colors.green,
        barWidth: 8,
        isStrokeCapRound: true,
        dotData: FlDotData(show: false),
        belowBarData: BarAreaData(show: false),
        spots: const [
          FlSpot(1, 1),
          FlSpot(3, 1.5),
          FlSpot(5, 1.4),
          FlSpot(7, 3.4),
          FlSpot(10, 2),
          FlSpot(12, 2.2),
          FlSpot(13, 1.8),
        ],
      );

  LineChartBarData get lineChartBarData1_2 => LineChartBarData(
        isCurved: true,
        color: Colors.pink,
        barWidth: 8,
        isStrokeCapRound: true,
        dotData: FlDotData(show: false),
        belowBarData: BarAreaData(
          show: false,
          color: Colors.pink.withOpacity(0),
        ),
        spots: const [
          FlSpot(1, 1),
          FlSpot(3, 2.8),
          FlSpot(7, 1.2),
          FlSpot(10, 2.8),
          FlSpot(12, 2.6),
          FlSpot(13, 3.9),
        ],
      );

  LineChartBarData get lineChartBarData1_3 => LineChartBarData(
        isCurved: true,
        color: Colors.cyan,
        barWidth: 8,
        isStrokeCapRound: true,
        dotData: FlDotData(show: false),
        belowBarData: BarAreaData(show: false),
        spots: const [
          FlSpot(1, 2.8),
          FlSpot(3, 1.9),
          FlSpot(6, 3),
          FlSpot(10, 1.3),
          FlSpot(13, 2.5),
        ],
      );
}
