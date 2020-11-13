import 'package:flutter/material.dart';
import 'package:flutter_tutofast/constants/app_colors.dart';

class MainButton extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final Widget child;
  final TextStyle textStyle;
  final Alignment alignment;
  final EdgeInsets padding;
  final Function onPressed;
  final ShapeBorder shapeBorder;

  const MainButton({
    Key key,
    this.width,
    this.height,
    this.color,
    this.textStyle,
    this.alignment,
    this.padding,
    this.onPressed,
    this.shapeBorder,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const _borderRadius = BorderRadius.all(Radius.circular(12));
    final _buttonTextStyle = textStyle ??
        Theme.of(context)
            .textTheme
            .bodyText2
            .copyWith(color: AppColors.white, fontSize: 20);
    return SizedBox(
      width: width,
      height: height,
      child: Material(
        color: Colors.transparent,
        shape: shapeBorder,
        elevation: 0,
        clipBehavior: Clip.antiAlias,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: _borderRadius,
            color: color
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: _borderRadius,
              onTap: onPressed,
              child: Container(
                padding: padding,
                child: Center(
                  child: DefaultTextStyle(
                    style: _buttonTextStyle,
                    child: child
                  )
                )
              )
            )
          )
        )
      )
    );
  }
}
