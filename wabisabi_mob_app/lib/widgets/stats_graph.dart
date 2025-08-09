import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:wabisabi_mob_app/constants/colors_constants.dart';
import 'package:wabisabi_mob_app/controllers/theme_controller.dart';

class StatsGraph extends StatefulWidget {
  const StatsGraph({super.key});

  @override
  State<StatsGraph> createState() => _StatsGraphState();
}

class _StatsGraphState extends State<StatsGraph> {
  final List<Color> gradientColors = [Color(0xffFF7F50), Color(0x00FF7F50)];

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.70,
      child: LineChart(
        mainData(),
      ),
    );
  }

  LineChartData mainData() {
    return LineChartData(
      lineTouchData: LineTouchData(
        touchTooltipData: LineTouchTooltipData(
          // tooltipBgColor: const Color(0xffFF7F50),
          tooltipRoundedRadius: 10,
          getTooltipItems: (touchedSpots) {
            return touchedSpots.map((spot) {
              return LineTooltipItem(
                '\$ ${spot.y.toStringAsFixed(0)}',
                const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              );
            }).toList();
          },
        ),
        touchCallback: (FlTouchEvent event, LineTouchResponse? response) {
          // Handle touch interaction if needed
        },
        handleBuiltInTouches: true,
      ),
      gridData: FlGridData(
        show: false,
      ),
      titlesData: FlTitlesData(
        leftTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: (value, meta) {
              switch (value.toInt()) {
                case 0:
                  return Padding(
                    padding: EdgeInsets.only(left: 30.w),
                    child: Text('Mon', style: textstyle()),
                  );
                case 1:
                  return Text('Tues', style: textstyle());
                case 2:
                  return Text('Wed', style: textstyle());
                case 3:
                  return Text('Thurs',
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w500,
                      ));
                case 4:
                  return Text('Fri', style: textstyle());
                case 5:
                  return Text('Sat', style: textstyle());
                case 6:
                  return Padding(
                    padding: EdgeInsets.only(right: 25.w),
                    child: Text('Sun', style: textstyle()),
                  );
                default:
                  return Text('', style: textstyle());
              }
            },
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      minX: 0,
      maxX: 6,
      minY: 0,
      maxY: 5,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 2),
            FlSpot(1, 2.5),
            FlSpot(2, 2.1),
            FlSpot(3, 4),
            FlSpot(4, 3.8),
            FlSpot(5, 4.5),
            FlSpot(6, 3.9),
          ],
          isCurved: true,
          gradient: LinearGradient(
            colors: gradientColors,
          ),
          barWidth: 4.w,
          isStrokeCapRound: true,
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: gradientColors
                  .map((color) => color.withOpacity(0.4))
                  .toList(),
            ),
          ),
          dotData: FlDotData(
            show: true,
            checkToShowDot: (spot, barData) {
              return spot.x == 3; // Show the dot only on Thursday
            },
            getDotPainter: (spot, percent, barData, index) {
              return FlDotCirclePainter(
                radius: 6.w,
                color: gradientColors[0],
                strokeColor: Colors.white,
                strokeWidth: 2,
              );
            },
          ),
        ),
      ],
    );
  }
}

textstyle() {
  return TextStyle(
    fontSize: 13.sp,
    // color: Color(0xff747474),
  );
}
