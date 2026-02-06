import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final IconData? leading;
  final void Function()? onLeadingPressed;
  final Widget? title;
  final List<Widget>? actions;

  const CustomAppbar({
    super.key,
    this.leading,
    this.onLeadingPressed,
    this.title,
    this.actions,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(onPressed: onLeadingPressed, icon: Icon(leading)),
      centerTitle: true,
      title: title,
      actions: actions,
    );
  }
}
