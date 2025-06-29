import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ziewnic_loyalty_points/components/constants.dart';

class CustomPrimaryButton extends StatelessWidget {
  final String text;
  final bool isDisabled;
  final VoidCallback? onPressed;
  final bool showImage;

  const CustomPrimaryButton({
    super.key,
    required this.text,
    required this.isDisabled,
    this.showImage = true,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton(
        onPressed: isDisabled ? onPressed : null,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
            if (states.contains(WidgetState.disabled)) {
              return kDefaultDisabledButtonColor;
            }
            return kPrimaryColor;
          }),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
          padding: WidgetStateProperty.all<EdgeInsets>(EdgeInsets.zero),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // 👈 Dummy left image (invisible to balance layout)
            showImage
                ? Opacity(
                    opacity: 0,
                    child: Image.asset(
                      '${kIconFolder}forward_arrow.png',
                      height: 24,
                      width: 24,
                    ),
                  )
                : SizedBox(width: 24),

            // 🔥 Centered Text
            Expanded(
              child: Center(
                child: Text(
                  text,
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(fontSize: 24),
                  ),
                ),
              ),
            ),

            // 👉 Real image on right
            showImage
                ? Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: Image.asset(
                      '${kIconFolder}forward_arrow.png',
                      height: 24,
                      width: 24,
                    ),
                  )
                : SizedBox(width: 24),
          ],
        ),
      ),
    );
  }
}
