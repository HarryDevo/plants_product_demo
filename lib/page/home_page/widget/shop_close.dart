import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ShopCloseWidget extends StatelessWidget {
  const ShopCloseWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.topLeft,
      width: _size.width * 0.86,
      height: _size.height,
      color: Colors.white,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 36),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Shop',
                      style:
                      GoogleFonts.lato(fontSize: 16, color: Colors.black54),
                    ),
                    Text(
                      'Close',
                      style: GoogleFonts.lato(
                          fontSize: 32,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
