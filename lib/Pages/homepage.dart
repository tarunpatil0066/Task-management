
import 'package:assignment/Commonfiles/Drawer.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final List<Map<String, dynamic>> todaysStats = [
    {"title": "Punched In", "count": "0/1", "color": Colors.blue},
    {"title": "Visits", "count": "0", "color": Colors.green},
    {"title": "Joint Visits", "count": "0", "color": Colors.orange},
    {"title": "Calls", "count": "0", "color": Colors.purple},
    {"title": "New Customers", "count": "0", "color": Colors.teal},
    {"title": "Opportunities", "count": "0", "color": Colors.red},
    {"title": "Expenses", "count": "0", "color": Colors.indigo},
  ];

  final List<Map<String, dynamic>> todaysTasks = [
    {"title": "Meet Client", "count": 2, "color": Colors.blue},
    {"title": "Pending Calls", "count": 5, "color": Colors.orange},
    {"title": "New Leads", "count": 3, "color": Colors.green},
    {"title": "Follow Ups", "count": 4, "color": Colors.purple},
  ];


  @override
  Widget build(BuildContext context) {
    final screenheight = MediaQuery.of(context).size.height;
    final screenwidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "Home Page",
          style: TextStyle(color: Colors.white),
        ),
      ),
      drawer: const CommonDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Today's Stats",
              style: TextStyle(
                  fontSize: screenwidth * 0.045, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: todaysStats.length,
                itemBuilder: (context, index) {
                  final stat = todaysStats[index];
                  return Container(
                    width: 120,
                    margin: const EdgeInsets.only(right: 10),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 1,
                            blurRadius: 5)
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(stat["count"],
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: stat["color"])),
                        const SizedBox(height: 6),
                        Text(stat["title"],
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 13, fontWeight: FontWeight.w500)),
                      ],
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 20),
            Text(
              "Statistics",
              style: TextStyle(
                  fontSize: screenwidth * 0.045, fontWeight: FontWeight.bold),
            ),
             SizedBox(height: screenheight*0.04),
            SizedBox(
              height: 250,
              child: LineChart(
                LineChartData(
                  gridData: FlGridData(show: false),
                  borderData: FlBorderData(
                    show: true,
                    border: const Border(
                      top: BorderSide.none,
                      right: BorderSide.none,
                      left: BorderSide(width: 1, color: Colors.black),   // ✅ keep left
                      bottom: BorderSide(width: 1, color: Colors.black), // ✅ keep bottom
                    ),
                  ),
                  titlesData: FlTitlesData(
                    show: true,
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
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 40,
                        interval: 0.5,
                      ),
                    ),
                  ),
                  lineBarsData: [
                    LineChartBarData(
                      isCurved: true,
                      color: Colors.blue,
                      barWidth: 3,
                      spots: const [
                        FlSpot(0, 0),
                        FlSpot(1, 1),
                        FlSpot(2, 0.8),
                        FlSpot(3, 1.2),
                        FlSpot(4, 0.9),
                        FlSpot(5, 1.5),
                        FlSpot(6, 1.0),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),
            Text(
              "Today's Task",
              style: TextStyle(
                  fontSize: screenwidth * 0.045, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 100,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                itemCount: todaysTasks.length,
                  itemBuilder: (BuildContext context, int index){
                    final todaytask = todaysTasks[index];
                    return Container(
                      // width: 120,
                      margin: const EdgeInsets.only(right: 10),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 1,
                              blurRadius: 5)
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            todaytask["count"].toString(),  // ✅ convert int → String
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: todaytask["color"],
                            ),
                          ),
                          Text(todaytask["title"],
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: todaytask["color"])),
                        ],
                      ),
                    );
                  }
              ),
            ),
          ],
        ),
      ),
    );
  }
}
