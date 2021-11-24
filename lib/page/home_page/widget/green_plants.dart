import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:product/constant/data.dart';
import 'package:product/model/plants_model.dart';
import 'package:product/page/detail_page/detail_page.dart';


class GreenPlantsWidget extends StatelessWidget {
  GreenPlantsWidget({Key? key}) : super(key: key);

  final DataPlants _dataPlants = DataPlants();

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
                      'Green',
                      style: GoogleFonts.lato(
                          fontSize: 16, color: Colors.black54),
                    ),
                    Text(
                      'Plants',
                      style: GoogleFonts.lato(
                          fontSize: 32,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            _buildListOfItem,
          ],
        ),
      ),
    );
  }

  Widget get _buildListOfItem {
    List<PlantsModel> _plants = _dataPlants.plantsList.toList();
    return ListView.builder(
      itemCount: _plants.length,
      shrinkWrap: true,
      padding: const EdgeInsets.only(bottom: 36),
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => _buildItem(context, _plants[index]),
    );
  }

  Widget _buildItem(BuildContext context, PlantsModel plant) {
    final _size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> DetailPage(plants: plant),),);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: _size.width * 0.76,
              child: Hero(
                tag: plant.id,
                child: Image.asset(
                  plant.image,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            SizedBox(
              width: _size.width * 0.86,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      plant.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.lato(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      plant.desc,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.lato(
                        fontSize: 16,
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          plant.price,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.lato(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        Container(
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
                          child: const Icon(Icons.add, color: Colors.black,),
                        ),
                      ],
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
