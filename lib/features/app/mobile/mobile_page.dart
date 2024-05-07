import 'package:flutter/material.dart';
import 'package:musicion/core/utils/presentation/app_colors.dart';
import 'package:musicion/features/app/mobile/widget/card/product_minimal_view.dart';
import 'package:musicion/features/app/mobile/widget/textfield/search_text_field_decoration.dart';

class MobileLayout extends StatefulWidget {
  @override
  State<MobileLayout> createState() => _MobileLayoutState();

  const MobileLayout({super.key});
}

class _MobileLayoutState extends State<MobileLayout> {
  int _selectedItem = 0;

  ontItemTapped(int index) {
    setState(() {
      _selectedItem = index;
      switch (index) {
        case 0:
          if (_selectedItem == index) {}
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const Padding(padding: EdgeInsets.symmetric(vertical: 8)), ConstrainedBox(
                      constraints:
                          MediaQuery.of(context).size.shortestSide < 700
                              ? const BoxConstraints(maxWidth: 400)
                              : const BoxConstraints(maxWidth: 1200),
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: AppColor.backgroundColorBlock),
                          child: const TextField(style: TextStyle(color: AppColor.searchTextFieldFont, fontSize: 16, fontWeight: FontWeight.w400),
                              decoration: SearchTextFieldDecoration('Поиск')))),
              const Padding(padding: EdgeInsets.symmetric(vertical: 8)),
              Expanded(
                child: ConstrainedBox(
                  constraints: MediaQuery.of(context).size.shortestSide < 700
                      ? BoxConstraints(maxWidth: 400)
                      : BoxConstraints(maxWidth: 1200),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: AppColor.backgroundColorBlock),
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 0),
                    child: GridView.count(
                      shrinkWrap: true,
                      crossAxisCount:
                          MediaQuery.of(context).size.shortestSide < 700
                              ? 2
                              : 4,
                      children: List<ProductMinimalView>.generate(
                          20,
                          (index) => ProductMinimalView('assets/images/f1.webp',
                              'Formula 1 product $index')),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Главная'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: 'Корзина')
        ],
        currentIndex: _selectedItem,
        selectedItemColor: AppColor.mainItemColor,
        onTap: ontItemTapped,
      ),
    );
  }
}
