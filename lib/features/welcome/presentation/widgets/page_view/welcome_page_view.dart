import 'package:YourThings/features/welcome/presentation/widgets/page_view/welcome_page_view_scroll_behavior.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WelcomePageView extends StatefulWidget {
  final List<Widget> children;

  const WelcomePageView({super.key, required this.children});

  @override
  State<WelcomePageView> createState() => _WelcomePageViewState();
}

class _WelcomePageViewState extends State<WelcomePageView>
    with TickerProviderStateMixin {
  late final PageController _pageViewController;
  late final TabController _tabController;
  late final List<Widget> children;
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageViewController = PageController();
    children = widget.children;
    _tabController = TabController(length: children.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            scrollDirection: Axis.vertical,
            scrollBehavior: WelcomePageViewScrollBehavior(),
            controller: _pageViewController,
            onPageChanged: _handlePageViewChanged,
            children: children,
          ),
          _currentPageIndex == children.length - 1
              ? Container()
              : Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Ink(
                    height: 45,
                    width: 45,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.transparent),
                    child: InkWell(
                      onTap: () {
                        _updateCurrentPageIndex(++_currentPageIndex);
                      },
                      borderRadius: BorderRadius.circular(36),
                      child: Container(
                        height: 45,
                        width: 45,
                        alignment: Alignment.center,
                        child: SvgPicture.asset(
                            'assets/icons/angle-down_white.svg',
                            height: 40,
                            width: 40,
                            allowDrawingOutsideViewBox: true),
                      ),
                    ),
                  ))
        ],
      ),
    );
  }

  void _handlePageViewChanged(int currentPageIndex) {
    _tabController.index = currentPageIndex;
    setState(() {
      _currentPageIndex = currentPageIndex;
    });
  }

  void _updateCurrentPageIndex(int index) {
    _tabController.index = index;
    _pageViewController.animateToPage(
      index,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
    );
  }
}
