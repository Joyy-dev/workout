import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

enum TimeFrame {daily, monthly, yearly}

class WorkoutChart extends StatefulWidget {
  const WorkoutChart({super.key});

  @override
  State<WorkoutChart> createState() => _WorkoutChartState();
}

class _WorkoutChartState extends State<WorkoutChart> {
  TimeFrame selectedTimeFrame = TimeFrame.monthly;

  List<double> chartData = [];
  double getMaxY() {
    return chartData.reduce((a, b) => a > b ? a : b) + 2;
  }

  @override
  void initState() {
    super.initState();
    loadChartData();
  }

  void loadChartData() {
    if (selectedTimeFrame == TimeFrame.daily) {
      chartData = [2, 5, 4,6, 3, 8, 6, 3];
    } else if (selectedTimeFrame == TimeFrame.monthly) {
      chartData = [20, 35, 28, 10, 30, 45, 38, 25, 50, 42, 30, 48];
    } else {
      chartData = [200, 350, 280, 400, 300,];
    }
    setState(() {
      //
    });
  }

  List<String> getBottomTiles() {
    if (selectedTimeFrame == TimeFrame.daily) {
      return ['Sun','Mon','Tue', 'Wed', 'Thu','Fri','Sat'];
    } else if (selectedTimeFrame == TimeFrame.monthly) {
      return ['Jan','Feb','Mar', 'Apr', 'May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'];
    } else {
      int currentYear = DateTime.now().year;
      return List.generate(5, (index) => (currentYear - 4 + index).toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.bolt_outlined),
                    Text(
                      'Healtnes'
                    )
                  ],
                ),
                DropdownButton<TimeFrame>(
                  value: selectedTimeFrame,
                  items: const [
                    DropdownMenuItem(
                      value: TimeFrame.daily,
                      child: Text('Daily')
                    ),
                    DropdownMenuItem(
                      value: TimeFrame.monthly,
                      child: Text('Monthly')
                    ),
                    DropdownMenuItem(
                      value: TimeFrame.yearly,
                      child: Text('Yearly')
                    )
                  ], 
                  onChanged: (value) {
                    selectedTimeFrame = value!;
                    loadChartData();
                  }
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: SizedBox(
              height: 230,
              child: BarChart(
                BarChartData(
                  maxY: getMaxY(),
                  borderData: FlBorderData(show: false),
                  alignment: BarChartAlignment.spaceAround,
                  gridData: FlGridData(show: false),
                  titlesData: FlTitlesData(
                    topTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false)
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false)
                    ),
                    rightTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false)
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          final titles = getBottomTiles();
              
                          if (value.toInt() < 0 || value.toInt() >= titles.length) {
                            return const SizedBox.shrink();
                          }
              
                          return Text(
                            titles[value.toInt()],
                            style: TextStyle(
                              fontSize: 12
                            ),
                          );
                        },
                      )
                    )
                  ),
                  barGroups: List.generate(chartData.length, (index) {
                    return BarChartGroupData(
                      x: index,
                      barRods: [
                        BarChartRodData(
                          toY: chartData[index],
                          color: Color(0xFF12005F), 
                          width: 15,
                          borderRadius: BorderRadius.circular(10),
                          backDrawRodData: BackgroundBarChartRodData(
                            color: Color(0xFFEEEEFC),
                            show: true,
                            toY: getMaxY()
                          )
                        )
                      ]
                    );
                  })
                )
              ),
            ),
          )
        ],
      ),
    );
  }
}