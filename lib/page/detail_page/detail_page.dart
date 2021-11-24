import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:product/model/plants_model.dart';

class DetailPage extends StatefulWidget {
  final PlantsModel plants;
  const DetailPage({Key? key, required this.plants}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
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
      elevation: 0,
      backgroundColor: Colors.transparent,
      iconTheme: const IconThemeData(
        color: Colors.black,
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            CupertinoIcons.shopping_cart,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  Widget get _buildBody {
    final _size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Positioned(
          top: 0,
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            alignment: Alignment.bottomCenter,
            height: _size.height,
            width: _size.width,
            color: Colors.green,
            child: Column(
              children: [
                SizedBox(
                  height: _size.height * 0.80,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          const Icon(
                            CupertinoIcons.arrow_up_arrow_down,
                            color: Colors.white,
                            size: 26,
                          ),
                          Text(
                            'Height',
                            style: GoogleFonts.lato(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            widget.plants.height,
                            style: GoogleFonts.lato(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const Icon(
                            CupertinoIcons.cloud_sun,
                            color: Colors.white,
                            size: 28,
                          ),
                          Text(
                            'Temperature',
                            style: GoogleFonts.lato(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            widget.plants.temp,
                            style: GoogleFonts.lato(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Image.asset('asset/icon/pot.png', height: 36, width: 36, fit: BoxFit.cover,),
                          Text(
                            'Pot',
                            style: GoogleFonts.lato(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            widget.plants.waterPot, maxLines: 2,
                            style: GoogleFonts.lato(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 0,
          bottom: _size.height * 0.24,
          left: 0,
          right: 0,
          child: Container(
            alignment: Alignment.center,
            height: _size.height,
            width: _size.width,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(190),
              ),
            ),
            child: SafeArea(
              child: Column(
                children: [
                  SizedBox(
                    height: _size.width * 0.76,
                    width: _size.width * 0.76,
                    child: Hero(
                      tag: widget.plants.id,
                      child: Image.asset(
                        widget.plants.image,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          widget.plants.name,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.lato(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 22,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          widget.plants.desc,
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.lato(
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              widget.plants.price,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.lato(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Container(
                              alignment: Alignment.center,
                              height: 36,
                              width: 36,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(90),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 4.0,
                                    spreadRadius: 1.0,
                                    offset: Offset(
                                      0.0,
                                      2.0,
                                    ),
                                  ),
                                ],
                              ),
                              child: const Icon(
                                Icons.add,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 26,
                        ),
                        Row(
                          children: [
                            const Spacer(),
                            Container(
                              alignment: Alignment.center,
                              height: 56,
                              width: 56,
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(90),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 4.0,
                                    spreadRadius: 1.0,
                                    offset: Offset(
                                      0.0,
                                      2.0,
                                    ),
                                  ),
                                ],
                              ),
                              child: const Icon(
                                CupertinoIcons.heart,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
