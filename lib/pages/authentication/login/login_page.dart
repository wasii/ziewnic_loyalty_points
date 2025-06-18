import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ziewnic_loyalty_points/components/constants.dart';
import 'package:ziewnic_loyalty_points/components/custom_input_textfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isButtonEnabled = false;
  bool rememberMe = false;

  @override
  void initState() {
    super.initState();
    usernameController.addListener(_updateButtonState);
    passwordController.addListener(_updateButtonState);
  }

  void _updateButtonState() {
    setState(() {
      isButtonEnabled = usernameController.text.isNotEmpty &&
          passwordController.text.isNotEmpty;
    });
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('${kLogoFolder}app_background.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            padding:
                const EdgeInsets.symmetric(horizontal: 24.0, vertical: 60.0),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height -
                    120, // adjust as needed
              ),
              child: IntrinsicHeight(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      '${kLogoFolder}ziewnic_vertical_logo.png',
                      height: 180,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "LOYALTY",
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 40,
                              height: 1.0, // Tight line height
                            ),
                          ),
                        ),
                        Text(
                          "PROGRAM",
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                              fontSize: 37,
                              height: 0.9, // Slightly tighter than default
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    CustomInputField(
                      controller: usernameController,
                      hintText: 'Username',
                      imageAssetPath: '${kIconFolder}user_icon.png',
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomInputField(
                      controller: passwordController,
                      hintText: 'Password',
                      imageAssetPath: '${kIconFolder}lock_icon.png',
                    ),
                    // Remember Me
                    Row(
                      children: [
                        Checkbox(
                          value: rememberMe,
                          onChanged: (value) =>
                              setState(() => rememberMe = value!),
                          activeColor: kPrimaryColor,
                          checkColor: Colors.white,
                        ),
                        Text(
                          "Remember me",
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: kDefaultTextFieldColor),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: ElevatedButton(
                        onPressed: isButtonEnabled ? () {} : null,
                        style: ButtonStyle(
                          backgroundColor:
                              WidgetStateProperty.resolveWith<Color>((states) {
                            if (states.contains(WidgetState.disabled)) {
                              return kPrimaryColor
                                  .withAlpha(100); // custom disabled color
                            }
                            return kPrimaryColor; // enabled color
                          }),
                          shape:
                              WidgetStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          foregroundColor:
                              WidgetStateProperty.resolveWith<Color>((states) {
                            if (states.contains(WidgetState.disabled)) {
                              return Colors
                                  .white; // text/icon color when disabled
                            }
                            return Colors.white;
                          }),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(
                                width:
                                    24), // left spacer to center "Login" text
                            Text(
                              "Login",
                              style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                  fontSize: 24,
                                ),
                              ),
                            ),
                            Image.asset(
                              '${kIconFolder}forward_arrow.png', // image on the right
                              height: 24,
                              width: 24,
                            ),
                          ],
                        ),
                      ),
                    ),

                    //Forget Password
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Forgot Password?",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: 16,
                              decoration: TextDecoration.underline,
                              color: Color(0xFF000000)),
                        ),
                      ), // TextStyle(decoration: TextDecoration.underline)),
                    ),

                    //Register Now
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don’t have account?",
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "REGISTER NOW",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: kPrimaryColor),
                            ),
                          ), // TextStyle(decoration: TextDecoration.underline)),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: EdgeInsets.only(top: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "UAN ",
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Text(
                              "021 111 000 666    |   www.ziewnic.com",
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
