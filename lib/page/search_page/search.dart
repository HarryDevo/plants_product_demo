import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:product/constant/data.dart';
import 'package:product/model/plants_model.dart';
import 'package:product/page/detail_page/detail_page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _data = DataPlants();

  List<PlantsModel> _searchList = [];
  bool _found = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        Navigator.of(context).pop();
      },
      child: Scaffold(
        appBar: _buildAppBar,
        body: _buildBody,
      ),
    );
  }

  AppBar get _buildAppBar {
    return AppBar(
      leading: const SizedBox(),
      leadingWidth: 0,
      backgroundColor: Colors.green,
      title: _buildSearchField,
    );
  }

  Widget get _buildSearchField {
    final _size = MediaQuery.of(context).size;
    return Container(
      height: 46,
      width: _size.width,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 14.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white70,
      ),
      child: TextField(
        textAlign: TextAlign.start,
        autofocus: true,
        onChanged: (value) {
          if (value.isEmpty ||
              value == ' ' ||
              value == '  ' ||
              value == '   ') {
            setState(() {
              _found = false;
              _searchList = [];
            });
          } else {
            setState(() {
              _found = true;
              _searchList = _data.plantsList
                  .where((element) =>
                      element.name.toLowerCase().contains(value.toLowerCase()))
                  .toList();
            });
          }
        },
        decoration: InputDecoration(
          hintStyle: GoogleFonts.lato(
            color: Colors.black54,
          ),
          hintText: 'Type here to search...',
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget get _buildBody {
    return _found? ListView.builder(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      itemCount: _searchList.length,
      itemBuilder: (context, index)=> _buildItemView(_searchList[index]),
    ) : Center(child: Text('No Result Found', style: GoogleFonts.lato(fontSize: 18, color: Colors.black54),),);
  }

  Widget _buildItemView(PlantsModel plant){
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> DetailPage(plants: plant),),);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: ListTile(
              leading: Image.asset(plant.image),
              title: Text(plant.name, style: GoogleFonts.lato(fontSize: 18, color: Colors.black),),
              subtitle: Text(plant.desc, style: GoogleFonts.lato(fontSize: 16, color: Colors.black54),),
            ),
          ),
        ),
      ),
    );
  }

}
