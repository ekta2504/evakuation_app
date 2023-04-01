import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/src/base/utils/constants/color_constant.dart';

class PrimaryButton extends StatelessWidget {
  final String? text;
  final bool? isDisable;
  final VoidCallback? onPressed;

  const PrimaryButton(this.text, this.onPressed, this.isDisable, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: 40,
          width: 10,
          child: ElevatedButton(
            onPressed: onPressed ?? () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: isDisable == true
                  ? const Color.fromARGB(255, 158, 199, 159)
                  : primaryColor,
              foregroundColor: isDisable == true ? Colors.black : Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
            child: Text(text ?? ''),
          ),
        ),
      ],
    );
  }
}
