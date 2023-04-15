import 'package:demo/values/colors.dart';
import 'package:flutter/material.dart';

class CustomActionButton extends StatelessWidget {
  final IconData iconData;
  final String label;
  final Color color;
  final Function() onPressed;
  final bool isLoading;
  const CustomActionButton({
    super.key,
    required this.iconData,
    this.color = primaryColor,
    required this.onPressed,
    required this.label,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color.withOpacity(.1),
      borderRadius: BorderRadius.circular(2),
      child: InkWell(
        onTap: onPressed,
        hoverColor: color.withOpacity(.15),
        focusColor: color.withOpacity(.15),
        highlightColor: color.withOpacity(.15),
        splashColor: color.withOpacity(.2),
        borderRadius: BorderRadius.circular(2),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 10,
            right: 10,
            top: 10,
            bottom: 10,
          ),
          child: isLoading
              ? SizedBox(
                  width: 50,
                  child: ClipRRect(
                    borderRadius:
                        BorderRadius.circular(30), //TODO:BORDER RADIUS
                    child: LinearProgressIndicator(
                      color: color,
                      backgroundColor: color.withOpacity(.2),
                    ),
                  ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      label,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: color,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                    const SizedBox(width: 5),
                    Icon(
                      iconData,
                      color: color,
                      size: 16,
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}