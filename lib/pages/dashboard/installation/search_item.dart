import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ziewnic_loyalty_points/components/constants.dart';
import 'package:ziewnic_loyalty_points/components/custom_input_textfield.dart';
import 'package:ziewnic_loyalty_points/components/custom_primary_button.dart';
import 'package:ziewnic_loyalty_points/pages/dashboard/dashboard.dart';
import 'package:ziewnic_loyalty_points/pages/dashboard/installation/add_new_item.dart';
import 'package:ziewnic_loyalty_points/pages/dashboard/sidemenu/side_menu.dart';

class SearchNewItem extends StatefulWidget {
  const SearchNewItem({super.key});

  @override
  State<SearchNewItem> createState() => _SearchNewItemState();
}

class _SearchNewItemState extends State<SearchNewItem> {
  final TextEditingController addSerialNumberController =
      TextEditingController();

  bool isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    addSerialNumberController.addListener(_updateButtonState);
  }

  void _updateButtonState() {
    setState(() {
      isButtonEnabled = addSerialNumberController.text.length == 8;
    });
  }

  @override
  void dispose() {
    addSerialNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void handleMenuItemTap(String selectedTitle) {
      if (selectedTitle == "Home") {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => Dashboard()),
        );
      }
    }

    return Scaffold(
      drawer: CustomSidebarDrawer(
        currentScreen: "Installation",
        onMenuItemTap: handleMenuItemTap,
      ),
      appBar: AppBar(
        title: Text(""),
        backgroundColor: kPrimaryColor,
        elevation: 1,
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
              // Top Bar
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
              ),
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
                      Text(
                        "INSTALLATION, ADD NEW",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Column(
                        children: [
                          CustomInputField(
                              controller: addSerialNumberController,
                              headingText: "Serial Number",
                              hintText: 'Enter your 8-digits serial number',
                              isRequired: true,
                              textHeight: 57),
                          Text(
                            "Please scratch your loyalty card and enter the 8-digit serial number.",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  fontSize: 8, fontWeight: FontWeight.w400),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 50),
        child: CustomPrimaryButton(
          text: 'Search',
          isDisabled: isButtonEnabled,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddNewItem(),
              ),
            );
          },
          showImage: false,
        ),
      ),
    );
  }
}
