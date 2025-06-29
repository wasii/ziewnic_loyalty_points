import 'package:flutter/material.dart';
import 'package:ziewnic_loyalty_points/components/constants.dart';
import 'package:ziewnic_loyalty_points/pages/dashboard/sidemenu/side_menu.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomSidebarDrawer(),
      appBar: AppBar(
        title: Text(""),
        backgroundColor: Colors.black87,
        elevation: 0,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: 260,
              decoration: BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top Bar
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 16),
                ),

                // Title
                Center(
                  child: Text(
                    "LOYALTY PROGRAM",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Main Content Card
                Expanded(
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 24),
                    decoration: BoxDecoration(
                      color: Color(0xFFFFFFFF),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "MY CURRENT AVAILABLE",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Text(
                          "POINTS: 0",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        SizedBox(height: 20),
                        Expanded(
                          child: ListView(
                            children: [
                              _buildRewardImage("$kBGFolder/reward1.png"),
                              SizedBox(height: 30),
                              _buildRewardImage("$kBGFolder/reward1.png"),
                              SizedBox(height: 30),
                              _buildRewardImage("$kBGFolder/reward1.png"),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRewardImage(String assetPath) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(200),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          assetPath,
          fit: BoxFit.cover,
          height: 180,
          width: double.infinity,
        ),
      ),
    );
  }
}
