import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ziewnic_loyalty_points/components/common_scaffold_layout.dart';
import 'package:ziewnic_loyalty_points/components/constants.dart';
import 'package:ziewnic_loyalty_points/components/table_cell.dart';
import 'package:ziewnic_loyalty_points/pages/dashboard/claim_points/claim_points.dart';
import 'package:ziewnic_loyalty_points/pages/dashboard/dashboard.dart';
import 'package:ziewnic_loyalty_points/pages/dashboard/installation/search_item.dart';
import 'package:ziewnic_loyalty_points/pages/dashboard/sidemenu/side_menu.dart';

class LoyaltyRewards extends StatefulWidget {
  const LoyaltyRewards({super.key});

  @override
  State<LoyaltyRewards> createState() => _LoyaltyRewardsState();
}

class _LoyaltyRewardsState extends State<LoyaltyRewards> {
  void handleMenuItemTap(String selectedTitle) {
    if (selectedTitle == "Home") {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => Dashboard()));
    } else if (selectedTitle == "Installation") {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => SearchNewItem()));
    } else if (selectedTitle == "Claim Points") {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => ClaimPoints()));
    }
  }

  final List<List<String>> data = List.generate(
    30, // number of rows
    (_) => ['31-Dec-2024', '1500', 'details', 'remarks', 'bike.jpeg'],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomSidebarDrawer(
        currentScreen: "Loyalty Rewards",
        onMenuItemTap: handleMenuItemTap,
      ),
      appBar: AppBar(
        title: SizedBox(
          height: 50,
          child: TextField(
            onChanged: (value) {
              print("Search: $value");
            },
            style: TextStyle(color: Colors.white),
            cursorColor: Colors.white,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
              hintText: 'Search...',
              hintStyle: TextStyle(color: Colors.white),
              filled: true,
              fillColor: kDefaultTextFieldColor.withAlpha(30),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide.none,
              ),
              prefixIcon: Icon(Icons.search, color: Colors.white),
            ),
          ),
        ),
        backgroundColor: kPrimaryColor,
        elevation: 1,
      ),
      body: CommonScaffoldLayout(
        title: "Loyalty Rewards",
        child: Column(
          children: [
            Table(
              border: TableBorder.all(color: Colors.black),
              columnWidths: const {
                0: FlexColumnWidth(1),
                1: FlexColumnWidth(1),
                2: FlexColumnWidth(1),
                3: FlexColumnWidth(1),
                4: FlexColumnWidth(1),
              },
              children: [
                TableRow(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                  ),
                  children: [
                    tableHeader('Date'),
                    tableHeader("Points"),
                    tableHeader("Details"),
                    tableHeader("Remarks"),
                    tableHeader("Files"),
                  ],
                ),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Table(
                  border: TableBorder.all(color: Colors.black),
                  columnWidths: const {
                    0: FlexColumnWidth(1),
                    1: FlexColumnWidth(1),
                    2: FlexColumnWidth(1),
                    3: FlexColumnWidth(1),
                    4: FlexColumnWidth(1),
                  },
                  children: [
                    for (int i = 0; i < data.length; i++)
                      TableRow(
                        decoration: BoxDecoration(
                          color: i % 2 == 0
                              ? Colors.grey.shade100 // even rows
                              : Colors.grey.shade300,
                        ),
                        children: List.generate(data[i].length, (index) {
                          final text = data[i][index];

                          // 👇 Last column special styling
                          if (index == data[i].length - 1) {
                            return GestureDetector(
                              onTap: () {
                                print("Link tapped in row $i: $text");
                                // Yahan navigate ya link action lagao
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(text,
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        fontSize: 12,
                                        color: Colors.blue,
                                        decoration: TextDecoration.underline,
                                      ),
                                    )),
                              ),
                            );
                          } else {
                            return tableCell(text); // normal cell
                          }
                        }),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
