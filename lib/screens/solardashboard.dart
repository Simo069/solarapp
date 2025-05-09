import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';
import 'package:intl/intl.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:provider/provider.dart';
import 'package:solarapp/Models/UserModel.dart';
import 'package:solarapp/component/CustomBottomNavBar.dart';
import 'package:solarapp/components/bottomNavBar.dart';
import 'package:solarapp/services/fireAuth/UserProvider.dart';



class solardashboard extends StatefulWidget {
  solardashboard({super.key});

  @override
  State<solardashboard> createState() => _solardashboardState();
}

class _solardashboardState extends State<solardashboard> {
 



  int _selectedIndex = 0;
  final today = DateTime.now();
  final formattedDate = DateFormat('EEEE d, yyyy').format(DateTime.now());



  double solarPowerUsage = 30.276;
  int usagePercentage = 50;
  double totalEnergy = 36.2;
  double consumed = 28.2;
  double capacity = 42.0;
  double co2Reduction = 28.2;
  double generatedSolar = 140.65;
<<<<<<< HEAD
  bool isMainElectricity = false;

  // Chart data
=======
  bool isMainElectricity = true;

  // Chart dataisMainElectricity
>>>>>>> db5cc08d650675734ec3be40f1d9ebf5774903ee
  List<FlSpot> chartData = [];

  // Timer for simulating live data
  late Timer _timer;
  @override
  void initState() {
    super.initState();
    _generateInitialChartData();

    // Simulate live data updates
    _timer = Timer.periodic(const Duration(seconds: 10), (timer) {
      _updateSimulatedData();
    });
  }

  void _updateSimulatedData() {
    if (!mounted) return;

    final rnd = Random();
    setState(() {
      // Update main values with small random changes
      solarPowerUsage += (rnd.nextDouble() - 0.5) * 2;
      solarPowerUsage = double.parse(solarPowerUsage.toStringAsFixed(3));

      usagePercentage = min(
        100,
        max(0, usagePercentage + (rnd.nextInt(5) - 2)),
      );

      totalEnergy += (rnd.nextDouble() - 0.4) * 0.5;
      totalEnergy = double.parse(totalEnergy.toStringAsFixed(1));

      consumed += (rnd.nextDouble() - 0.45) * 0.3;
      consumed = double.parse(consumed.toStringAsFixed(1));

      co2Reduction =
          consumed; // In this example, CO2 reduction equals consumption

      generatedSolar += (rnd.nextDouble() - 0.3) * 0.8;
      generatedSolar = double.parse(generatedSolar.toStringAsFixed(2));

      // Update chart by removing first point and adding a new one
      if (chartData.length > 30) {
        chartData.removeAt(0);
      }

      double lastX = chartData.isEmpty ? 0 : chartData.last.x + 1;
      double newY = 100 + rnd.nextDouble() * 50;
      chartData.add(FlSpot(lastX, newY));
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _generateInitialChartData() {
    // Generate 30 points for the chart (simulating a month)
    final rnd = Random();
    for (int i = 0; i < 30; i++) {
      double value = 100 + rnd.nextDouble() * 50;
      chartData.add(FlSpot(i.toDouble(), value));
    }
  }

  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    
    final today = DateTime.now();
    final formattedDate = DateFormat('EEEE d, yyyy').format(today);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.only(top: 50),

        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildfirstsection(user),
              // start second section of solar powwer usage
              SizedBox(height: 20),
              _buildsecondsection(),
              SizedBox(height: 20),
              _buildthirdsection(),
              SizedBox(height: 20),
              _buildChartSection(),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(selectedIndex: _selectedIndex,),
    );
<<<<<<< HEAD
  
    

=======
>>>>>>> db5cc08d650675734ec3be40f1d9ebf5774903ee
  }

  Widget _buildfirstsection(UserModel? user) {
    return Padding(
      padding:  EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // User greeting and date
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
              '${user?.firstName?? 'Guest'}',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Text(
                formattedDate,
                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
              ),
            ],
          ),
          // Toggle switch
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Switch(
                value: isMainElectricity,
                onChanged: (value) {
                  setState(() {
                    isMainElectricity = value;
                  });
                },
                activeColor: Colors.green,
              ),
              SizedBox(width: 8),
              Text(
                'Switch to main electricity',
                style: TextStyle(color: Colors.grey[600], fontSize: 14),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildsecondsection() {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 16.0),
      child: Card(
        elevation: 4, // Shadow for card effect
        color: Colors.white, // Background color
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding:  EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Solar icon with dynamic border color
                  Container(
                    padding:  EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color:
                            usagePercentage >= 60
                                ? Colors.green
                                : usagePercentage >= 30
                                ? Colors.orange
                                : Colors.red,
                        width: 2,
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.bolt,
                      color:
                          usagePercentage >= 60
                              ? Colors.green
                              : usagePercentage >= 30
                              ? Colors.orange
                              : Colors.red,
                      size: 24,
                    ),
                  ),
                  // kWh value
                  Text(
                    '${solarPowerUsage}kWh',
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2D3748),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Usage label and percentage
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Solar Power Usage',
                    style: TextStyle(fontSize: 18, color: Colors.grey[600]),
                  ),
                  Text(
                    '$usagePercentage%',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color:
                          usagePercentage >= 60
                              ? Colors.green
                              : usagePercentage >= 30
                              ? Colors.orange
                              : Colors.red,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              // Progress bar
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: LinearProgressIndicator(
                  value: usagePercentage / 100,
                  backgroundColor: Colors.grey[300],
                  color:
                      usagePercentage >= 60
                          ? Colors.green
                          : usagePercentage >= 30
                          ? Colors.orange
                          : Colors.red,
                  minHeight: 4,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildthirdsection() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              // Total Energy Card
              Expanded(
                child: Card(
                  color: Colors.white,
                  elevation: 4,
                  margin: const EdgeInsets.only(right: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.lightbulb_outline,
                          color: Colors.amber[400],
                          size: 30,
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'Total energy',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[600],
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              totalEnergy.toString(),
                              style: const TextStyle(
                                fontSize: 36,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF2D3748),
                              ),
                            ),
                            const SizedBox(width: 4),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 6),
                              child: Text(
                                'kWh',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // Consumed Energy Card
              Expanded(
                child: Card(
                  color: Colors.white,
                  elevation: 4,
                  margin: const EdgeInsets.only(left: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.flash_on,
                          color: Colors.orange[400],
                          size: 30,
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'Consumed',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[600],
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              consumed.toString(),
                              style: const TextStyle(
                                fontSize: 36,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF2D3748),
                              ),
                            ),
                            const SizedBox(width: 4),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 6),
                              child: Text(
                                'kWh',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        SizedBox(height: 20),
        // start second row of cards
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              // Capacity Card
              Expanded(
                child: Card(
                  color: Colors.white,
                  elevation: 4,
                  margin: const EdgeInsets.only(right: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.battery_charging_full,
                          color: Colors.amber[700],
                          size: 30,
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'Capacity',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[600],
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              capacity.toString(),
                              style: const TextStyle(
                                fontSize: 36,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF2D3748),
                              ),
                            ),
                            const SizedBox(width: 4),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 6),
                              child: Text(
                                'kWh',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // CO2 Reduction Card
              Expanded(
                child: Card(
                  color: Colors.white,
                  elevation: 4,
                  margin: const EdgeInsets.only(left: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.eco_outlined,
                          color: Colors.blue[400],
                          size: 30,
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'CO2 Reduction',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[600],
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              co2Reduction.toString(),
                              style: const TextStyle(
                                fontSize: 36,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF2D3748),
                              ),
                            ),
                            const SizedBox(width: 4),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 6),
                              child: Text(
                                'kWh',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildChartSection() {
    if (chartData == null || chartData.isEmpty) {
      return const Padding(
        padding: EdgeInsets.all(16.0),
        child: Text("No data available"),
      );
    }

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
      padding: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Electricity generated by solar',
                  style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                ),
                Row(
                  children: [
                    Container(
                      width: 10,
                      height: 10,
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Text(
                      'Live',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Icon(Icons.more_horiz),
                  ],
                ),
              ],
            ),
          ),

          // Value text
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              '${generatedSolar ?? 0}kWh',
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2D3748),
              ),
            ),
          ),

          const SizedBox(height: 8),

          // Chart (wrap in SizedBox to avoid nested Expanded issue)
          SizedBox(
            height: 200, // Set fixed height to avoid layout error
            child: Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: LineChart(
                LineChartData(
                  minX: chartData.first.x,
                  maxX: chartData.last.x,
                  minY: 100,
                  maxY: 200,
                  gridData: FlGridData(
                    show: true,
                    drawVerticalLine: true,
                    getDrawingHorizontalLine:
                        (value) => FlLine(
                          color: Colors.grey[300]!,
                          strokeWidth: 1,
                          dashArray: [5, 5],
                        ),
                    getDrawingVerticalLine:
                        (value) => FlLine(
                          color: Colors.grey[300]!,
                          strokeWidth: 1,
                          dashArray: [5, 5],
                        ),
                  ),
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        interval: 50,
                        getTitlesWidget:
                            (value, meta) => Text(
                              '${value.toInt()}kWh',
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 12,
                              ),
                            ),
                        reservedSize: 40,
                      ),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    rightTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    topTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                  ),
                  borderData: FlBorderData(show: false),
                  lineBarsData: [
                    LineChartBarData(
                      spots: chartData,
                      isCurved: true,
                      color: Colors.green[700],
                      barWidth: 3,
                      isStrokeCapRound: true,
                      dotData: FlDotData(show: false),
                      belowBarData: BarAreaData(
                        show: true,
                        gradient: LinearGradient(
                          colors: [
                            Colors.green.withOpacity(0.3),
                            Colors.green.withOpacity(0.01),
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
          ),
        ],
      ),
    );
  }

  
}
