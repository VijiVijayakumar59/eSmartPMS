import 'package:esmartpms/utils/color/colors.dart';
import 'package:esmartpms/utils/size/constant_height.dart';
import 'package:esmartpms/utils/text/custom_text.dart';
import 'package:esmartpms/view/my_deals/widgets/text_with_icon_widget.dart';
import 'package:flutter/material.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: blackColor,
            )),
        backgroundColor: whiteColor,
        elevation: 2,
        automaticallyImplyLeading: false,
        title: Center(
          child: Image.asset(
            "assets/images/PMSlogo.png",
            fit: BoxFit.contain,
            height: size.height * 0.064,
            width: double.infinity,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(13.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const CustomText(
                text: "MESSAGES",
                fontSize: 21,
                color: themeColor,
                fontWeight: FontWeight.bold,
              ),
              const KHeight(size: 0.01),
              ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 12,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    Color containerColor = index % 2 == 0 ? secondaryColor : lightGreen;

                    return Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Container(
                          width: double.infinity,
                          height: size.height * 0.21,
                          decoration: BoxDecoration(
                            color: containerColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              // mainAxisAlignment: MainAxisAlignment.space,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const CustomText(
                                  text: "Mr. Lost and Found Office",
                                  fontSize: 19,
                                ),
                                const Divider(
                                  thickness: 1.22,
                                ),
                                const CustomText(
                                  text:
                                      "Lorem ipsum is simply dummy text of the In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available.",
                                  color: greyColor,
                                  fontSize: 12,
                                ),
                                const KHeight(size: 0.02),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    TextWithIconWidget(
                                        onPressed: () {},
                                        text: "View",
                                        icon: Icons.arrow_forward,
                                        iconColor: blackColor,
                                        iconSize: 15,
                                        textColor: blackColor,
                                        fontSize: 12,
                                        width: 0.2,
                                        height: 0.02,
                                        bgColor: containerColor)
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
    ));
  }
}
