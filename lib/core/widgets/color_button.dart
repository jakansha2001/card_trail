import 'package:flutter/material.dart';

class ColorButton extends StatelessWidget {
  final Function() onTap;
  final bool isSelected;
  final String img;
  const ColorButton({
    super.key,
    required this.onTap,
    required this.isSelected,
    required this.img,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: isSelected ? 70 : 55,
      width: 70,
      child: IconButton(
        onPressed: () {
          onTap();
        },
        icon: Image(
          image: AssetImage(
            img,
          ),
        ),
      ),
    );
  }
}
