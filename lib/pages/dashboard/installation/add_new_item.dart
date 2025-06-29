import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ziewnic_loyalty_points/components/constants.dart';
import 'package:ziewnic_loyalty_points/components/custom_input_textfield.dart';
import 'package:ziewnic_loyalty_points/components/custom_primary_button.dart';
import 'package:ziewnic_loyalty_points/pages/dashboard/installation/item_added_successfully.dart';
import 'package:ziewnic_loyalty_points/pages/dashboard/sidemenu/side_menu.dart';

class AddNewItem extends StatefulWidget {
  const AddNewItem({super.key});

  @override
  State<AddNewItem> createState() => _AddNewItemState();
}

class _AddNewItemState extends State<AddNewItem> {
  final TextEditingController addNameController = TextEditingController();
  final TextEditingController addMobileController = TextEditingController();
  final TextEditingController addItemController = TextEditingController();
  final TextEditingController addCityController = TextEditingController();
  final TextEditingController addAddressController = TextEditingController();
  final TextEditingController addFilesController = TextEditingController();
  final TextEditingController addRemarksController = TextEditingController();

  bool isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    addNameController.addListener(_updateButtonState);
    addMobileController.addListener(_updateButtonState);
    addItemController.addListener(_updateButtonState);
    addCityController.addListener(_updateButtonState);
    addAddressController.addListener(_updateButtonState);
    addFilesController.addListener(_updateButtonState);
    addRemarksController.addListener(_updateButtonState);
  }

  void _updateButtonState() {
    setState(() {
      isButtonEnabled = addNameController.text.isNotEmpty &&
          addMobileController.text.isNotEmpty &&
          addItemController.text.isNotEmpty &&
          addCityController.text.isNotEmpty &&
          addAddressController.text.isNotEmpty &&
          addFilesController.text.isNotEmpty;
    });
  }

  @override
  void dispose() {
    addNameController.dispose();
    addMobileController.dispose();
    addItemController.dispose();
    addCityController.dispose();
    addAddressController.dispose();
    addFilesController.dispose();
    addRemarksController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
        backgroundColor: kPrimaryColor,
        elevation: 1,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); // 👈 goes back
          },
        ),
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
                      Expanded(
                        child: SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CustomInputField(
                                controller: addNameController,
                                headingText: "Name",
                                hintText: 'Enter your name',
                                isRequired: true,
                                textHeight: 57,
                              ),
                              CustomInputField(
                                controller: addMobileController,
                                headingText: "Mobile",
                                hintText: 'Enter your mobile number',
                                isRequired: true,
                                textHeight: 57,
                              ),
                              CustomInputField(
                                controller: addItemController,
                                headingText: "Items",
                                hintText: 'Please select items',
                                isRequired: true,
                                textHeight: 57,
                              ),
                              CustomInputField(
                                controller: addCityController,
                                headingText: "City",
                                hintText: 'Enter your city name',
                                isRequired: true,
                                textHeight: 57,
                              ),
                              CustomInputField(
                                controller: addAddressController,
                                headingText: "Address",
                                hintText: 'Enter your address',
                                isRequired: true,
                                textHeight: 90,
                              ),
                              CustomInputField(
                                controller: addFilesController,
                                headingText: "Upload pics of installation site",
                                hintText: '',
                                isRequired: true,
                                textHeight: 57,
                              ),
                              CustomInputField(
                                controller: addRemarksController,
                                headingText: "Remarks",
                                hintText: 'Enter your name',
                                isRequired: false,
                                textHeight: 90,
                              )
                            ],
                          ),
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
      bottomNavigationBar: Container(
        color: Colors.white,
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 50),
        child: CustomPrimaryButton(
          text: 'Next',
          isDisabled: isButtonEnabled,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ItemAddedSuccessfully(),
              ),
            );
          },
          showImage: false,
        ),
      ),
    );
  }
}
