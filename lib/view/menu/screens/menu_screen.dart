import 'package:carousel_slider/carousel_slider.dart';
import 'package:esmartpms/utils/helper/helper.dart';
import 'package:esmartpms/utils/size/constant_height.dart';
import 'package:esmartpms/view/menu/widgets/menu_card_widget.dart';
import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Choice> displayedChoices = isDeveloper
        ? choices
        : [
            // choices[10], // Announcement
            choices[11], // Events
            choices[8], // Parking Code
            // choices[9], // Access Control Code
            choices[5], // Complaints
            choices[6], // Visitors
          ];

    return Padding(
      padding: const EdgeInsets.all(6),
      child: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSlider(
              items: [
                Container(
                  margin: const EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(8.0),
                    image: const DecorationImage(
                      image: AssetImage("assets/images/slider_one.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(8.0),
                    image: const DecorationImage(
                      image: AssetImage("assets/images/slidertwo.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height * 0.24,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                viewportFraction: 0.8,
              ),
            ),
            const KHeight(size: 0.04),
            // Center(
            //   child: ElevatedButton(
            //     onPressed: () {},
            //     style: ElevatedButton.styleFrom(
            //       backgroundColor: secondaryColor,
            //       shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(10),
            //       ),
            //     ),
            //     child: const CustomText(
            //       text: "CON_2025/1290",
            //       color: blackColor,
            //     ),
            //   ),
            // ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10.0),
              child: GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                crossAxisCount: 3,
                mainAxisSpacing: 0,
                crossAxisSpacing: 0,
                children: List.generate(displayedChoices.length, (index) {
                  return Center(
                    child: MenuCardWidget(choice: displayedChoices[index]),
                  );
                }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
