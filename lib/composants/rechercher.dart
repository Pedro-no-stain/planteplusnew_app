import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Recherche extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              onChanged: (value) {},
              decoration: InputDecoration(
                hintText: "Search",
                hintStyle: TextStyle(
                  color:Colors.lightGreen.withOpacity(0.5),
                ),
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            ),
          ),
          SvgPicture.asset("img/search.svg"),
        ],
      ),
    );
  }
}
