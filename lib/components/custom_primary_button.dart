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
        ),
        child: Row(
          mainAxisAlignment: showImage
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.center,
          children: [
            const SizedBox(width: 24),
            Text(
              text,
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(fontSize: 24),
              ),
            ),
            if (showImage)
              Image.asset(
                '${kIconFolder}forward_arrow.png',
                height: 24,
                width: 24,
              ),
          ],
        ),
      ),
    );
  }
}
