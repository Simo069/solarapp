import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:fl_chart/fl_chart.dart';
import 'component/CustomBottomNavBar.dart';

void main() {
  runApp(const StatisticsApp());
}

class StatisticsApp extends StatelessWidget {
  const StatisticsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const StatisticsScreen(),
    );
  }
}

class EnergyStats {
  final double electricityPercentage;
  final double electricityKWh;
  final double changeWh;
  final double changePercent;
  final List<FlSpot> chartData;

  EnergyStats({
    required this.electricityPercentage,
    required this.electricityKWh,
    required this.changeWh,
    required this.changePercent,
    required this.chartData,
  });
}

class StatisticsScreen extends StatefulWidget {
  const StatisticsScreen({super.key});

  @override
  _StatisticsScreenState createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen> {
  int _selectedIndex = 2;

  Map<int, EnergyStats> statsByTab = {
    0: EnergyStats(
      electricityPercentage: 0.55,
      electricityKWh: 12.345,
      changeWh: 500,
      changePercent: 8,
      chartData: [FlSpot(0, 10), FlSpot(1, 20), FlSpot(2, 25), FlSpot(3, 15)],
    ),
    1: EnergyStats(
      electricityPercentage: 0.65,
      electricityKWh: 20.654,
      changeWh: 1321,
      changePercent: 10,
      chartData: [FlSpot(0, 30), FlSpot(1, 70), FlSpot(2, 110), FlSpot(3, 180)],
    ),
    2: EnergyStats(
      electricityPercentage: 0.75,
      electricityKWh: 30.276,
      changeWh: 2131,
      changePercent: 14,
      chartData: [
        FlSpot(0, 40),
        FlSpot(1, 100),
        FlSpot(2, 150),
        FlSpot(3, 200),
      ],
    ),
    3: EnergyStats(
      electricityPercentage: 0.85,
      electricityKWh: 60.780,
      changeWh: 4021,
      changePercent: 19,
      chartData: [
        FlSpot(0, 100),
        FlSpot(1, 200),
        FlSpot(2, 400),
        FlSpot(3, 600),
      ],
    ),
  };

  @override
  Widget build(BuildContext context) {
    EnergyStats currentStats = statsByTab[_selectedIndex]!;

    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Statistics',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildCircularProgress(currentStats),
          const SizedBox(height: 16),
          _buildLineChart(currentStats),
        ],
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _buildCircularProgress(EnergyStats stats) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          const Text(
            'Electricity Saved',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                // 1. Affiche d'abord le fond rouge (électricité)
                SizedBox(
                  width: 200,
                  height: 200,
                  child: CircularProgressIndicator(
                    value: 1.0,
                    strokeWidth: 20,
                    backgroundColor: Colors.grey[300],
                    valueColor: const AlwaysStoppedAnimation<Color>(Colors.red),
                  ),
                ),
                // 2. Puis la partie verte (énergie solaire)
                SizedBox(
                  width: 200,
                  height: 200,
                  child: CircularProgressIndicator(
                    value: stats.electricityPercentage,
                    strokeWidth: 20,
                    backgroundColor: Colors.transparent,
                    valueColor: const AlwaysStoppedAnimation<Color>(
                      Colors.green,
                    ),
                  ),
                ),
                // 3. Et enfin le texte au centre
                Column(
                  children: [
                    const Icon(Icons.flash_on, size: 32, color: Colors.black),
                    Text(
                      '${(stats.electricityPercentage * 100).toInt()}%',
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      'Electricity',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LegendItem(color: Colors.red, label: 'Electricity'),
              SizedBox(width: 24),
              LegendItem(color: Colors.green, label: 'Solar Energy'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLineChart(EnergyStats stats) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          const Text('Energy generated', style: TextStyle(color: Colors.grey)),
          const SizedBox(height: 8),
          Text(
            '${stats.electricityKWh.toStringAsFixed(3)}KWh',
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.arrow_drop_up, color: Colors.green),
              Text(
                '${stats.changeWh.toStringAsFixed(0)}Wh (${stats.changePercent.toStringAsFixed(0)}%)',
                style: const TextStyle(color: Colors.green),
              ),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 200,
            child: LineChart(
              LineChartData(
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: false,
                  horizontalInterval: 50,
                  getDrawingHorizontalLine:
                      (value) =>
                          FlLine(color: Colors.grey[300], strokeWidth: 1),
                ),
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      interval: 50,
                      reservedSize: 40,
                      getTitlesWidget:
                          (value, meta) => Text('${value.toInt()}'),
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        return Text('T${value.toInt() + 1}');
                      },
                    ),
                  ),
                  topTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  rightTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                ),
                borderData: FlBorderData(show: false),
                lineBarsData: [
                  LineChartBarData(
                    spots: stats.chartData,
                    isCurved: true,
                    gradient: const LinearGradient(
                      colors: [Colors.red, Colors.orange, Colors.green],
                    ),
                    barWidth: 4,
                    dotData: FlDotData(show: false),
                    belowBarData: BarAreaData(
                      show: true,
                      gradient: LinearGradient(
                        colors: [
                          Colors.green.withOpacity(0.3),
                          Colors.transparent,
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              buildTab('Day', 0),
              buildTab('Week', 1),
              buildTab('Month', 2),
              buildTab('All time', 3),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildTab(String label, int index) {
    bool isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
        decoration: BoxDecoration(
          color: isSelected ? Colors.green : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.grey[700],
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _bottomNavItem(IconData icon, int index) {
    final bool isSelected = _selectedIndex == index;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: isSelected ? Colors.green[700] : Colors.transparent,
        borderRadius: BorderRadius.circular(16),
      ),
      child: IconButton(
        icon: Icon(
          icon,
          color: isSelected ? Colors.white : Colors.grey[500],
          size: isSelected ? 28 : 24,
        ),
        onPressed: () {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }

  Widget _buildBottomNavBar() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.green.withOpacity(0.3),
            blurRadius: 5,
            offset: const Offset(0, -17),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _bottomNavItem(Icons.home, 0),
          _bottomNavItem(Icons.bar_chart, 1),
          _bottomNavItem(Icons.credit_card, 2),
          _bottomNavItem(Icons.notifications_none, 3),
          _bottomNavItem(Icons.settings, 4),
        ],
      ),
    );
  }
}

class LegendItem extends StatelessWidget {
  final Color color;
  final String label;

  const LegendItem({super.key, required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(width: 14, height: 14, color: color),
        const SizedBox(width: 6),
        Text(label, style: const TextStyle(fontSize: 14)),
      ],
    );
  }
}
