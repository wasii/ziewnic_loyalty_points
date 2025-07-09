import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ziewnic_loyalty_points/components/constants.dart';
import 'package:ziewnic_loyalty_points/components/custom_primary_button.dart';
import 'package:ziewnic_loyalty_points/pages/dashboard/dashboard.dart';
import 'package:ziewnic_loyalty_points/pages/dashboard/installation/search_item.dart';
import 'package:ziewnic_loyalty_points/pages/dashboard/sidemenu/side_menu.dart';

class ClaimPoints extends StatefulWidget {
  const ClaimPoints({super.key});

  @override
  State<ClaimPoints> createState() => _ClaimPointsState();
}

class _ClaimPointsState extends State<ClaimPoints> {
  void handleMenuItemTap(String selectedTitle) {
    if (selectedTitle == "Home") {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => Dashboard()));
    } else if (selectedTitle == "Installation") {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => SearchNewItem()));
    }
  }

  final List<List<String>> data = List.generate(
    10, // number of rows
    (_) => ['LKMOBIXA', 'MAX 1.6KW PV2500', '30'],
  );

  @override
  Widget build(BuildContext context) {
    int total = data.length * 30;
    return Scaffold(
      drawer: CustomSidebarDrawer(
        currentScreen: "Claim Points",
        onMenuItemTap: handleMenuItemTap,
      ),
      appBar: AppBar(
        title: Text(
          "Claim Points",
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        backgroundColor: kPrimaryColor,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Container(
            height: 260,
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
              ),

              //Title
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
              Expanded(
                child: Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                  decoration: BoxDecoration(
                    color: Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Table(
                      //   border: TableBorder.all(color: Colors.black),
                      //   columnWidths: const {
                      //     0: FlexColumnWidth(1),
                      //     1: FlexColumnWidth(2),
                      //     2: FlexColumnWidth(1),
                      //   },
                      //   children: [
                      //     TableRow(
                      //       decoration: BoxDecoration(
                      //         color: Colors.grey.shade300,
                      //       ),
                      //       children: [
                      //         tableCell('Product'),
                      //         tableCell("Description"),
                      //         tableCell("Quantity"),
                      //       ],
                      //     ),
                      //   ],
                      // ),
                      Expanded(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Table(
                            border: TableBorder.all(color: Colors.black),
                            columnWidths: const {
                              0: FlexColumnWidth(1),
                              1: FlexColumnWidth(2),
                              2: FlexColumnWidth(1),
                            },
                            children: [
                              for (int i = 0; i < data.length; i++)
                                TableRow(
                                  decoration: BoxDecoration(
                                    color: i % 2 == 0
                                        ? Colors.grey.shade100 // even rows
                                        : Colors.grey.shade300,
                                  ),
                                  children:
                                      data[i].map((e) => tableCell(e)).toList(),
                                ),
                              TableRow(
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade300,
                                ),
                                children: [
                                  tableCell(''),
                                  tableCell(''),
                                  tableCell('Total $total'),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 40), // screen side padding
        child: Builder(
          builder: (context) {
            int total = data.length * 30;
            final List<String> buttonTitles = [
              'Claim Cash',
              'Claim Bike',
              'Claim Umrah Package',
            ];

            List<Widget> buttons = List.generate(3, (index) {
              bool isEnabled = false;
              if (index == 0 && total >= 300) isEnabled = true;
              if (index == 1 && total >= 1500) isEnabled = true;
              if (index == 2 && total >= 3000) isEnabled = true;

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: IntrinsicWidth(
                  child: CustomPrimaryButton(
                    text: buttonTitles[index],
                    isDisabled: isEnabled,
                    onPressed: () {
                      showCustomPopup(context, buttonTitles[index]);
                    },
                    showImage: false,
                    buttonHeight: 40,
                    fontSize: 11,
                  ),
                ),
              );
            });

            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: buttons,
            );
          },
        ),
      ),
    );
  }

  Widget tableCell(String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(text,
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          textAlign: TextAlign.center),
    );
  }

  void showCustomPopup(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Text(
            message,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Are you sure you want to $message?'),
              const SizedBox(height: 20),
              Row(
                children: [
                  // Cancel Button (Left - 50%)
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            WidgetStateProperty.all<Color>(Colors.white),
                        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            side: BorderSide(color: kPrimaryColor),
                          ),
                        ),
                        foregroundColor:
                            WidgetStateProperty.all<Color>(kPrimaryColor),
                        padding: WidgetStateProperty.all<EdgeInsets>(
                          const EdgeInsets.symmetric(vertical: 12),
                        ),
                      ),
                      child: Text(
                        'Cancel',
                        style: GoogleFonts.poppins(fontSize: 14),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),

                  // OK Button (Right - 50%)
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            WidgetStateProperty.all<Color>(kPrimaryColor),
                        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        foregroundColor:
                            WidgetStateProperty.all<Color>(Colors.white),
                        padding: WidgetStateProperty.all<EdgeInsets>(
                          const EdgeInsets.symmetric(vertical: 12),
                        ),
                      ),
                      child: Text(
                        'OK',
                        style: GoogleFonts.poppins(fontSize: 14),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
