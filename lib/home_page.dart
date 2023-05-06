// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, this.args});
  final ScreenArgument? args;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController search = TextEditingController();
  bool isSearchFocused = false;

  late final List<bool> _likedStatus;
  @override
  void initState() {
    super.initState();
    _likedStatus = List.filled(productVertical.length,
        false); // khởi tạo danh sách trạng thái với kích thước bằng số lượng sản phẩm
  }

  void _onIconPressed(int index) {
    setState(() {
      _likedStatus[index] = !_likedStatus[index];
    });
  }

  List<Category> categoryHorizontal = [
    Category(food: 'assets/images/fruit.png', nameoffood: 'Fruit'),
    Category(food: 'assets/images/cake.png', nameoffood: 'Cake'),
    Category(food: 'assets/images/juice.png', nameoffood: 'Juice'),
    Category(food: 'assets/images/vegetable.png', nameoffood: 'Vegetable'),
    Category(food: 'assets/images/meat.png', nameoffood: 'Meat'),
    Category(food: 'assets/images/humbergur.png', nameoffood: 'Fast Food'),
    Category(food: 'assets/images/milk.png', nameoffood: 'Milk'),
  ];

  List<Product> productVertical = [
    Product(
        product: 'assets/images/orange.png',
        nameofproduct: 'Orange',
        price: '\$ 15.00'),
    Product(
        product: 'assets/images/watermelon-juice.png',
        nameofproduct: 'Watermelon juice',
        price: '\$ 14.00'),
    Product(
        product: 'assets/images/corn.png',
        nameofproduct: 'Corns',
        price: '\$ 14.00'),
    Product(
        product: 'assets/images/humbergur.png',
        nameofproduct: 'Humbergur',
        price: '\$ 14.30'),
    Product(
        product: 'assets/images/matcha-cake.png',
        nameofproduct: 'Matcha cake',
        price: '\ 8.00'),
    Product(
        product: 'assets/images/eggs.png',
        nameofproduct: 'Eggs',
        price: '\$ 9.30'),
    Product(
        product: 'assets/images/beef.png',
        nameofproduct: 'Beef',
        price: '\$ 12.00'),
    Product(
        product: 'assets/images/icream.png',
        nameofproduct: 'I-cream',
        price: '\$ 14.30'),
    Product(
        product: 'assets/images/cauliflower.png',
        nameofproduct: 'Cauliflower',
        price: '\$ 11.00'),
    Product(
        product: 'assets/images/pineapple.png',
        nameofproduct: 'Pineapple',
        price: '\$ 11.30'),
  ];

  int _selectedIndex = 0;
  void _onTabSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 66, left: 18, right: 18),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 18),
                        width: 44,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xff000000).withOpacity(0.08),
                              offset: const Offset(0, 0),
                              blurRadius: 4,
                              spreadRadius: 0,
                            )
                          ],
                        ),
                        padding: const EdgeInsets.all(2),
                        child: const CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/images/avatar.jpg'),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 134),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Hello,',
                              style:
                                  TextStyle(fontSize: 15, letterSpacing: -0.02),
                            ),
                            Text(
                              'Pham Quang',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w700),
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color:
                                    const Color(0xffA2A2A2).withOpacity(0.58),
                                width: 1),
                            borderRadius: BorderRadius.circular(8)),
                        child: SvgPicture.asset('assets/icons/bell.svg'),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 23, bottom: 26),
                    height: 50,
                    width: double.infinity,
                    child: TextField(
                      controller: search,
                      onChanged: (valueInput) => setState(() {
                        for (var item in productVertical) {
                          if (valueInput.isNotEmpty) {
                            productVertical = productVertical
                                .where((item) => item.nameofproduct
                                    .toLowerCase()
                                    .contains(valueInput.toLowerCase()))
                                .toList();
                          } else {
                            productVertical;
                          }
                        }
                      }),
                      onTap: () => setState(() {
                        isSearchFocused = true;
                      }),
                      onSubmitted: (value) => setState(() {
                        isSearchFocused = false;
                      }),
                      decoration: InputDecoration(
                          filled: true,
                          prefixIcon: Padding(
                            padding: const EdgeInsets.only(left: 21, right: 21),
                            child: SizedBox(
                              width: 28,
                              height: 29,
                              child: SvgPicture.asset(
                                'assets/icons/search.svg',
                                color: isSearchFocused
                                    ? const Color(0xff404041)
                                    : null,
                              ),
                            ),
                          ),
                          hintText: 'Search...',
                          hintStyle: TextStyle(
                              fontSize: 16,
                              color: const Color(0xff969595).withOpacity(0.84)),
                          fillColor: const Color(0xffD9D9D9).withOpacity(0.74),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide.none)),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 18, left: 18, bottom: 16),
                      child: Container(
                        height: 146,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            'assets/images/banner.jpg',
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 18, left: 18, bottom: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Categories',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Color(0xff4B4B4B)),
                          ),
                          Text(
                            'See more',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: 13,
                              color: Color(0xff4B4B4B),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 18),
                      height: 104,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: categoryHorizontal.length,
                          itemBuilder: (context, index) => Container(
                                margin: const EdgeInsets.only(right: 10),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: 72,
                                      width: 72,
                                      decoration: BoxDecoration(
                                          color: const Color(0xffFF6B00)
                                              .withOpacity(0.4),
                                          shape: BoxShape.circle),
                                      padding: const EdgeInsets.all(16),
                                      child: ClipRect(
                                        child: Image.asset(
                                          categoryHorizontal[index].food,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      categoryHorizontal[index].nameoffood,
                                      style: const TextStyle(
                                          fontSize: 13,
                                          color: Color(0xff4B4B4B)),
                                    )
                                  ],
                                ),
                              )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 18, left: 18, top: 13, bottom: 19),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Popular',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Color(0xff4B4B4B)),
                          ),
                          Text(
                            'See more',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: 13,
                              color: Color(0xff4B4B4B),
                            ),
                          )
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        GridView.builder(
                          padding: const EdgeInsets.symmetric(horizontal: 18),
                          shrinkWrap: true,
                          itemCount: productVertical.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisSpacing: 20,
                                  mainAxisSpacing: 20,
                                  crossAxisCount: 2,
                                  childAspectRatio: 160 / 219),
                          itemBuilder: (context, index) => Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: [
                                      BoxShadow(
                                          color: const Color(0xff000000)
                                              .withOpacity(0.19),
                                          offset: const Offset(0, 0),
                                          blurRadius: 16)
                                    ]),
                              ),
                              Positioned(
                                  top: 10,
                                  left: 17,
                                  child: Image.asset(
                                    productVertical[index].product,
                                    height: 126,
                                    width: 126,
                                  )),
                              Positioned(
                                top: 16,
                                right: 16,
                                child: SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: InkWell(
                                        onTap: () {
                                          _onIconPressed(index);
                                        },
                                        child: SvgPicture.asset(
                                          'assets/icons/heart.svg',
                                          color: _likedStatus[index]
                                              ? Color(0xffE54C3C)
                                              : Color(0xffC3C3C3),
                                        ))),
                              ),
                              Positioned(
                                left: 16,
                                bottom: 57,
                                child: Text(
                                  productVertical[index].nameofproduct,
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xff4B4B4B)),
                                ),
                              ),
                              Positioned(
                                left: 16,
                                bottom: 38,
                                child:
                                    SvgPicture.asset('assets/icons/stars.svg'),
                              ),
                              Positioned(
                                left: 16,
                                bottom: 12,
                                child: Row(
                                  children: [
                                    Text(
                                      productVertical[index].price,
                                      style: const TextStyle(
                                          fontSize: 12,
                                          color: Color(0xffFE9901)),
                                    ),
                                    const SizedBox(width: 67),
                                    SizedBox(
                                      width: 20,
                                      height: 20,
                                      child: SvgPicture.asset(
                                        'assets/icons/shopping-bag.svg',
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            BottomNavigationBar(
              items: [
                BottomNavigationBarItem(
                  icon: InkWell(
                    onTap: () {
                      setState(() {
                        _selectedIndex = 0;
                      });
                    },
                    child: SvgPicture.asset(
                      'assets/icons/home.svg',
                      color: _selectedIndex == 0
                          ? const Color(0xffFF6C00)
                          : const Color(0xffC3C3C3),
                    ),
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: InkWell(
                    onTap: () {
                      setState(() {
                        _selectedIndex = 1;
                      });
                    },
                    child: SvgPicture.asset(
                      'assets/icons/trolley.svg',
                      color: _selectedIndex == 1
                          ? const Color(0xffFF6C00)
                          : const Color(0xffC3C3C3),
                    ),
                  ),
                  label: 'Cart',
                ),
                BottomNavigationBarItem(
                  icon: InkWell(
                    onTap: () {
                      setState(() {
                        _selectedIndex = 2;
                      });
                    },
                    child: SvgPicture.asset(
                      'assets/icons/list.svg',
                      color: _selectedIndex == 2
                          ? const Color(0xffFF6C00)
                          : const Color(0xffC3C3C3),
                    ),
                  ),
                  label: 'Favorite',
                ),
                BottomNavigationBarItem(
                  icon: InkWell(
                    onTap: () {
                      setState(() {
                        _selectedIndex = 3;
                      });
                    },
                    child: SvgPicture.asset(
                      'assets/icons/account.svg',
                      color: _selectedIndex == 3
                          ? const Color(0xffFF6C00)
                          : const Color(0xffC3C3C3),
                    ),
                  ),
                  label: 'Account',
                ),
              ],
              showSelectedLabels: true,
              currentIndex: _selectedIndex,
              onTap: _onTabSelected,
              selectedItemColor: const Color(0xffFF6C00),
              unselectedItemColor: const Color(0xffC3C3C3),
              unselectedLabelStyle: const TextStyle(fontSize: 9),
              selectedIconTheme: const IconThemeData(color: Color(0xffFF6C00)),
              unselectedIconTheme:
                  const IconThemeData(color: Color(0xffC3C3C3)),
            )
          ],
        ),
      ),
    );
  }
}

class ScreenArgument {
  final String userName;
  final String passWord;

  ScreenArgument({required this.userName, required this.passWord});
}

class Category {
  final String food;
  final String nameoffood;

  Category({required this.food, required this.nameoffood});
}

class Product {
  final String product;
  final String nameofproduct;
  final String price;

  Product(
      {required this.product,
      required this.nameofproduct,
      required this.price});
}
