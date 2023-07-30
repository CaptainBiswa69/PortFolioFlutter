import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:myportforlio_flutter/data/project_data.dart';
import 'package:myportforlio_flutter/screens/home_screen/home_controller.dart';
import 'package:myportforlio_flutter/utils/constants.dart';
import 'package:myportforlio_flutter/utils/dimesions.dart';
import 'package:myportforlio_flutter/utils/text_style.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';

class MobileProjectWidget extends StatefulWidget {
  const MobileProjectWidget({super.key});

  @override
  State<MobileProjectWidget> createState() => _MobileProjectWidgetState();
}

class _MobileProjectWidgetState extends State<MobileProjectWidget> {
  late int selectedPage;
  late final PageController _pageController;
  @override
  void initState() {
    selectedPage = 0;
    _pageController = PageController(initialPage: selectedPage);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        builder: (controller) => SizedBox(
              width: Dimensions.screenWidth(context) * 0.9,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "As A Flutter Developer",
                      style: MyTextStyle.label(context),
                    ),
                    // .animate(onPlay: (controller) => controller.repeat())
                    // .shimmer(duration: 1000.ms, color: AppColor.purple)
                    // .animate()
                    // .fadeIn(duration: 1200.ms, curve: Curves.easeOutQuad)
                    // .slide(),
                    Text(
                      "(With over 2 year experience)",
                      style: MyTextStyle.normalsmall(context),
                    ),
                    SizedBox(
                      height: Dimensions.height10(context),
                    ),
                    Text(AppConstant.projectText,
                        style: MyTextStyle.normalsmall(context)),
                    SizedBox(
                      height: Dimensions.height10(context),
                    ),
                    Text(
                      "Some Of My Project Mile-Stones",
                      style: MyTextStyle.label(context),
                    ),
                    SizedBox(
                      height: Dimensions.height10(context),
                    ),
                    SizedBox(
                      height: Dimensions.screenHeight(context) * 0.525,
                      child: PageView(
                          controller: _pageController,
                          onPageChanged: (page) {
                            setState(() {
                              selectedPage = page;
                            });
                          },
                          children: [
                            Row(
                              children: List.generate(
                                  2,
                                  (index) => projectItems(
                                      context,
                                      projectData[index]["image"],
                                      projectData[index]["name"],
                                      projectData[index]["Source"],
                                      projectData[index]["Description"],
                                      controller)),
                            ),
                            Row(
                              children: List.generate(
                                  2,
                                  (index) => projectItems(
                                      context,
                                      projectData[index + 2]["image"],
                                      projectData[index + 2]["name"],
                                      projectData[index + 2]["Source"],
                                      projectData[index + 2]["Description"],
                                      controller)),
                            ),
                            projectItems(
                                context,
                                projectData[4]["image"],
                                projectData[4]["name"],
                                projectData[4]["Source"],
                                projectData[4]["Description"],
                                controller)
                          ]),
                    ),
                    SizedBox(
                      height: Dimensions.height10(context),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: PageViewDotIndicator(
                        currentItem: selectedPage,
                        count: 3,
                        unselectedColor: Colors.grey,
                        selectedColor: Colors.white,
                        duration: const Duration(milliseconds: 200),
                        boxShape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.height20(context),
                    )
                  ]),
            ));
  }
}

Widget projectItems(BuildContext context, String image, String name, String url,
    String desc, HomeController controller) {
  return SizedBox(
    width: Dimensions.screenWidth(context) * 0.45,
    height: Dimensions.screenHeight(context) * 5,
    child: Card(
        color: Colors.white12,
        elevation: 5,
        shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(Dimensions.radius15(context) / 2)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: Dimensions.height15(context),
            ),
            Image.asset(
              image,
              height: Dimensions.height40(context) * 3,
              fit: BoxFit.fitWidth,
              width: Dimensions.height40(context) * 8,
            ),
            SizedBox(
              height: Dimensions.height10(context),
            ),
            Text(
              name,
              style: MyTextStyle.normalBold(context),
              textAlign: TextAlign.center,
            ),
            Text(
              "March 2023",
              style: MyTextStyle.normalsmall(context),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: Dimensions.height10(context),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                desc,
                style: MyTextStyle.normalsmall(context),
                textAlign: TextAlign.center,
              ),
            ),
            const Spacer(),
            TextButton.icon(
                icon: const Icon(Icons.arrow_outward_rounded),
                onPressed: () => controller.launchWeb(link: url),
                label: const Text("View Source")),
            SizedBox(
              height: Dimensions.height15(context),
            ),
          ],
        )),
  );
}

Widget _projectItems({
  required String name,
  required String img,
  required int index,
  required BuildContext context,
}) {
  return GetBuilder<HomeController>(
      builder: (controller) => SizedBox(
            // height: Dimensions.screenHeight(context) * 0.4,
            width: Dimensions.screenWidth(context),
            child: Container(
              foregroundDecoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(Dimensions.radius15(context)),
                  gradient: LinearGradient(colors: [
                    Colors.black.withOpacity(0.8),
                    Colors.black.withOpacity(0.5),
                    Colors.black.withOpacity(0.4),
                    Colors.black.withOpacity(0),
                    Colors.black.withOpacity(0),
                    Colors.black.withOpacity(0),
                    Colors.black.withOpacity(0),
                    Colors.black.withOpacity(0),
                    Colors.black.withOpacity(0),
                    Colors.black.withOpacity(0),
                  ], begin: Alignment.centerRight, end: Alignment.centerLeft)),
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(Dimensions.radius15(context)),
                image: DecorationImage(
                  image: AssetImage(
                    img,
                  ),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ));
}
