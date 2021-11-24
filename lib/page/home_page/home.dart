import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:product/page/home_page/widget/green_plants.dart';
import 'package:product/page/home_page/widget/indoor_plants.dart';
import 'package:product/page/home_page/widget/shop_close.dart';
import 'package:product/page/search_page/search.dart';

class HomePage extends StatefulWidget {
  final String? barTitle;
  const HomePage({Key? key, this.barTitle}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController();

  int _currentPage = 0;

  bool _isFullScreen = false;
  bool _isShopClose = false;
  bool _isIndoorPlants = false;
  bool _isGreenPlants = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: _buildAppBar,
      body: _buildBody,
    );
  }

  AppBar get _buildAppBar {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        onPressed: () {},
        icon: Icon(
          CupertinoIcons.color_filter,
          color: _isFullScreen ? Colors.black : Colors.white,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(14.0),
          child: OpenContainer(
            closedElevation: 0,
            closedColor: Colors.white,
            openElevation: 0,
            openShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            closedShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            transitionType: ContainerTransitionType.fadeThrough,
            transitionDuration: const Duration(milliseconds: 400),
            closedBuilder: (context, fun) => const Icon(
              CupertinoIcons.search,
              color: Colors.black,
            ),
            openBuilder: (context, fun) => const SearchPage(),
          ),
        ),
      ],
    );
  }

  Widget get _buildBody {
    final _size = MediaQuery.of(context).size;
    return Stack(
      children: [
        //Tab Bar at the left of screen
        AnimatedPositioned(
          top: 0,
          left: 0,
          bottom: 0,
          right: _isFullScreen ? _size.width : _size.width * 0.86,
          duration: const Duration(milliseconds: 200),
          child: RotatedBox(
            quarterTurns: 3,
            child: Container(
              alignment: Alignment.center,
              color: Colors.green,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //Shop Close
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _isGreenPlants = false;
                        _isIndoorPlants = false;
                        _isShopClose = true;
                        _currentPage = 2;
                        _pageController.animateToPage(_currentPage,
                            duration: const Duration(milliseconds: 150),
                            curve: Curves.bounceIn);
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: _isShopClose ? Colors.white : Colors.green,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Text(
                        'Shop Close',
                        maxLines: 1,
                        style: GoogleFonts.lato(
                            fontSize: 16,
                            color: _isShopClose ? Colors.black : Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),

                  //Indoor Plants
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _isGreenPlants = false;
                        _isIndoorPlants = true;
                        _isShopClose = false;
                        _currentPage = 1;
                        _pageController.animateToPage(_currentPage,
                            duration: const Duration(milliseconds: 150),
                            curve: Curves.bounceIn);
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: _isIndoorPlants ? Colors.white : Colors.green,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Text(
                        'Indoor Plants',
                        maxLines: 1,
                        style: GoogleFonts.lato(
                            fontSize: 16,
                            color:
                                _isIndoorPlants ? Colors.black : Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),

                  //Green Plants
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _isGreenPlants = true;
                        _isIndoorPlants = false;
                        _isShopClose = false;
                        _currentPage = 0;
                      });
                      _pageController.animateToPage(_currentPage,
                          duration: const Duration(milliseconds: 150),
                          curve: Curves.bounceIn);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: _isGreenPlants ? Colors.white : Colors.green,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Text(
                        'Green Plants',
                        maxLines: 1,
                        style: GoogleFonts.lato(
                            fontSize: 16,
                            color:
                                _isGreenPlants ? Colors.black : Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        //List of green plants at the right screen
        AnimatedPositioned(
          top: 0,
          left: _isFullScreen ? 0 : _size.width * 0.14,
          bottom: 0,
          right: 0,
          duration: const Duration(milliseconds: 200),
          child: PageView(
            physics: const NeverScrollableScrollPhysics(),
            pageSnapping: false,
            children: [
              GreenPlantsWidget(),
              const IndoorPlantsWidget(),
              const ShopCloseWidget(),
            ],
            controller: _pageController,
          ),
        ),

        //Full Screen Button
        Positioned(
          bottom: 8,
          left: 8,
          child: IconButton(
            onPressed: () {
              if (_isFullScreen == false) {
                setState(() {
                  _isFullScreen = true;
                });
              } else {
                setState(() {
                  _isFullScreen = false;
                });
              }
            },
            icon: _isFullScreen
                ? const Icon(
                    CupertinoIcons.list_bullet,
                    color: Colors.black,
                  )
                : const Icon(
                    CupertinoIcons.square,
                    color: Colors.white,
                  ),
          ),
        ),
      ],
    );
  }
}
