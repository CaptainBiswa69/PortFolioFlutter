import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'package:myportforlio_flutter/data/skills_data.dart';

import 'package:myportforlio_flutter/utils/constants.dart';
import 'package:myportforlio_flutter/utils/dimesions.dart';
import 'package:myportforlio_flutter/utils/text_style.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class AboutMeWidget extends StatelessWidget {
  const AboutMeWidget({super.key});

  // Random random = Random();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimensions.screenHeight(context),
      width: Dimensions.screenWidth(context),
      padding: EdgeInsets.all(Dimensions.width10(context)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              padding: EdgeInsets.all(Dimensions.height10(context)),
              width: Dimensions.screenWidth(context) * 0.4,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "About Me",
                      style: MyTextStyle.label(context),
                    ),
                    // .animate(onPlay: (controller) => controller.repeat())
                    // .shimmer(duration: 1000.ms, color: AppColor.purple)
                    // .animate()
                    // .fadeIn(duration: 1200.ms, curve: Curves.easeOutQuad)
                    // .slide(),
                    SizedBox(
                      height: Dimensions.height15(context),
                    ),
                    Text(
                      AppConstant.introductionText2,
                      style: MyTextStyle.normalsmall(context),
                      textAlign: TextAlign.justify,
                    )
                  ])),
          SizedBox(
            width: Dimensions.width30(context),
          ),
          VerticalDivider(
            color: Colors.white,
            endIndent: Dimensions.height40(context) * 2,
            indent: Dimensions.height40(context) * 2,
          ),
          SizedBox(
            width: Dimensions.width30(context),
          ),
          SizedBox(
            width: Dimensions.screenWidth(context) * 0.4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: Dimensions.height10(context),
                ),
                Text(
                  "Navigating Expertise",
                  style: MyTextStyle.label(context),
                ),
                // .animate(onPlay: (controller) => controller.repeat())
                // .shimmer(duration: 1000.ms, color: AppColor.purple)
                // .animate()
                // .fadeIn(duration: 1200.ms, curve: Curves.easeOutQuad)
                // .slide(),
                Center(
                  child: SizedBox(
                    height: Dimensions.screenHeight(context) * 0.25,
                    width: Dimensions.screenWidth(context) * 0.25,
                    child: LottieBuilder.asset(
                      "assets/animations/development.json",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  height: Dimensions.height40(context) * 1.5,
                ),
                Expanded(
                    child: GridView.builder(
                        itemCount: skillsData.length,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisExtent: Dimensions.height40(context) * 3,
                            crossAxisCount: 3),
                        itemBuilder: (contex, index) {
                          return SizedBox(
                            height: Dimensions.height40(context) * 2,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: Dimensions.height10(context),
                                  ),
                                  Container(
                                      margin: EdgeInsets.only(
                                          bottom: Dimensions.height10(context)),
                                      height: Dimensions.height30(context),
                                      width: Dimensions.height40(context),
                                      padding: index == skillsData.length - 1
                                          ? const EdgeInsets.all(3)
                                          : EdgeInsets.zero,
                                      child: Image.asset(
                                        skillsData[index]["image"],
                                        height: Dimensions.height40(context),
                                        width: Dimensions.height40(context),
                                      )),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: Dimensions.width30(context) * 2,
                                        child: Text(
                                          skillsData[index]["name"],
                                          style:
                                              MyTextStyle.normalBold(context),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      CircularPercentIndicator(
                                        radius:
                                            Dimensions.height15(context) * 1.1,
                                        lineWidth: 4,
                                        circularStrokeCap:
                                            CircularStrokeCap.round,
                                        curve: Curves.bounceIn,
                                        animation: true,
                                        center: Text(
                                          "${skillsData[index]["percent"]}%",
                                          style:
                                              MyTextStyle.smallestText(context)
                                                  .copyWith(
                                                      fontSize:
                                                          Dimensions.font12(
                                                                  context) *
                                                              0.7),
                                        ),
                                        percent: skillsData[index]["process"],
                                        progressColor: processColor(
                                            process: skillsData[index]
                                                ["process"]),
                                      )
                                    ],
                                  )
                                ]),
                          );
                        }))
              ],
            ),
          )
        ],
      ),
    );
  }

  Color processColor({required double process}) {
    var color = Colors.transparent;
    if (process <= 0.3) {
      color = Colors.red;
    } else if (process <= 0.5) {
      color = Colors.amber;
    } else {
      color = Colors.green;
    }

    return color;
  }
}
