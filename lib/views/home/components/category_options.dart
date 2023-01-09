import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_adoption/components/commonWidget/size_box.dart';
import 'package:pet_adoption/utils/constants.dart';
import 'package:pet_adoption/mock/sample_data_Pet.dart';
import 'package:pet_adoption/utils/spacing_widgets.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(
        children: categories
            .map(
              (category) => Container(
                  margin: const EdgeInsets.only(right: 25.0),
                  child: Column(
                    children: <Widget>[
                      BorderBox(
                        color:
                            category['active'] ? vPrimaryColor : Colors.white,
                        padding: const EdgeInsets.all(8.0),
                        width: 65.0,
                        height: 65.0,
                        child: Image(
                          image: AssetImage('${category["icon"]}'),
                          fit: BoxFit.contain,
                          color:
                              category['active'] ? Colors.white : vPrimaryColor,
                        ),
                      ),
                      addVerticalSpace(12.0),
                      Text(category['name'],
                          style: GoogleFonts.montserrat(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                            color: vPrimaryColor,
                          ))
                    ],
                  )),
            )
            .toList(),
      ),
    );
  }
}
