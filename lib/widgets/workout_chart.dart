import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class WorkoutChart extends StatelessWidget {
  const WorkoutChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
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
                Row(
                  children: [
                    Text(
                      'Monthly'
                    ),
                    Icon(Icons.arrow_drop_down)
                  ],
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
                          const months = [
                            'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
                          ];
                          if (value.toInt() < 0 || value.toInt() >= months.length) {
                            return SizedBox.shrink();
                          }
                          return Text(
                            months[value.toInt()],
                            style: TextStyle(
                              fontSize: 12
                            ),
                          );
                        },
                      )
                    )
                  ),
                  barGroups: List.generate(12, (index) {
                    return BarChartGroupData(
                      x: index,
                      barRods: [
                        BarChartRodData(
                          toY: (5 + (index % 7)).toDouble(),
                          color: Color(0xFF12005F),
                          width: 15,
                          borderRadius: BorderRadius.circular(10),
                          backDrawRodData: BackgroundBarChartRodData(
                            color: Color(0xFFEEEEFC),
                            show: true,
                            toY: 10
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