import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/constants/constants.dart';
import 'package:movies/core/theme/app_colors.dart';
import 'package:movies/presentation/root/widgets/bottombar_item.dart';

class Root extends StatefulWidget {
  const Root({super.key});

  @override
  RootState createState() => RootState();
}

class RootState extends State<Root> with TickerProviderStateMixin {
  int activeTab = 0;
  List pages = rootBody;
  //====== set animation=====
  late final AnimationController _controller = AnimationController(
    duration: Duration(milliseconds: 500),
    vsync: this,
  );

  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
  );

  @override
  void initState() {
    super.initState();
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.stop();
    _controller.dispose();
    super.dispose();
  }

  animatedPage(page) {
    return FadeTransition(child: page, opacity: _animation);
  }

  void onPageChanged(int index) {
    _controller.reset();
    setState(() {
      activeTab = index;
    });
    _controller.forward();
  }

  //====== end set animation=====

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBgColor,
      body: getBarPage(),
      floatingActionButton: getBottomBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget getBarPage() {
    return IndexedStack(
      index: activeTab,
      children: List.generate(
        pages.length,
        (index) => animatedPage(pages[index]['page']),
      ),
    );
  }

  Widget getBottomBar() {
    return Container(
      height: 56.sp,
      width: 390.sp,
      decoration: BoxDecoration(
        color: AppColors.darkGray,
        borderRadius: BorderRadius.circular(16.sp),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowColor.withAlpha(200),
            blurRadius: 1,
            spreadRadius: 1,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: List.generate(
          pages.length,
          (index) => BottomBarItem(
            pages[index]["icon"],
            isActive: activeTab == index,
            onTap: () {
              onPageChanged(index);
            },
          ),
        ),
      ),
    );
  }
}
