import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBarWithBack extends StatelessWidget
    implements PreferredSizeWidget {
  final VoidCallback? onMenuTap;

  const CustomAppBarWithBack({
    Key? key,
    this.onMenuTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Color(0xFFE7E7E7),
            image: DecorationImage(
              image: AssetImage('assets/pattern.png'),
              fit: BoxFit.cover,
              repeat: ImageRepeat.repeat,
              colorFilter: ColorFilter.mode(
                Colors.grey.shade300.withOpacity(0.5),
                BlendMode.srcATop,
              ),
            ),
          ),
        ),
        AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Builder(
            builder: (context) => InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/');
              },
              // Default behavior
              borderRadius: BorderRadius.circular(30),
              child: Container(
                margin: const EdgeInsets.all(8),
                width: 51,
                height: 51,
                decoration: const BoxDecoration(
                  color: Color(0xFF90010A),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.arrow_back, color: Colors.white),
              ),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: InkWell(
                onTap: onMenuTap ?? () => Scaffold.of(context).openEndDrawer(),
                // Default behavior
                borderRadius: BorderRadius.circular(30),
                child: Container(
                  width: 51,
                  height: 51,
                  decoration: const BoxDecoration(
                    color: Color(0xFF90010A),
                    shape: BoxShape.circle,
                  ),
                  padding: const EdgeInsets.all(12),
                  child: SvgPicture.asset(
                    'assets/icons/menu.svg',
                    width: 22,
                    height: 22,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
