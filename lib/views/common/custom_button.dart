import 'package:flutter/material.dart';
import 'package:simple_login_screen/constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.child,
    required this.onPressed,
    this.isLoading = false,
  });

  final Widget child;
  final VoidCallback onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Constants.mainGreen,
              foregroundColor: Colors.white,
            ),
            onPressed: onPressed,
            child: isLoading
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 3,
                    ),
                  )
                : child,
          ),
        ),
      ],
    );
  }
}
