import 'package:flutter/material.dart';
import 'package:general_counsel/Components/common_button.dart';
import 'package:general_counsel/Utils/app_dimentions.dart';
import 'package:general_counsel/Utils/colors.dart';
import 'package:general_counsel/Utils/constants.dart';
import 'package:general_counsel/Utils/images.dart';
import 'package:go_router/go_router.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final PageController _pageController = PageController();

  final List pages = [
    {
      // "img": Images.delivery,
      "title": "Legal counselling",
      "description":
          "Access a full recognized counsellors with your legal applications for assitance ",
    },
    {
      // "img": Images.food,
      "title": "How well do you know the Constitution?",
      "description":
          "Access the full constitution of the Republic Ghana locally on yout phone.",
    },
    {
      // "img": Images.payment,
      "title": "Have Questions on legal issues?",
      "description":
          "Have a feel of most asked legal questions with answers on the go."
    },
  ];

  int index = 0;

  List images = [AssetImages.lawyer, AssetImages.logo, AssetImages.lawyer];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          // color: Colors.red,
          image: DecorationImage(
            image: AssetImage(images[index]),
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: linearGradient,
          ),
          child: SafeArea(
            child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: AppDimentions.paddingMedium),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      onbordingButtons(
                        title: "Back",
                        onTap: () => _pageController.previousPage(
                            duration: const Duration(seconds: 1),
                            curve: Curves.ease),
                      ),
                      onbordingButtons(
                        title: index == pages.length - 1 ? "" : "Skip",
                        onTap: () =>
                            _pageController.jumpToPage(pages.length - 1),
                      ),
                    ],
                  ),
                  Expanded(
                    child: SafeArea(
                      child: PageView.builder(
                        itemBuilder: (context, index) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: AppDimentions.paddingMedium),
                                child: Text(
                                  pages[index]['title'],
                                  style: TextStyle(
                                      fontSize: AppDimentions.fontSizeLarge,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Cairo",
                                      color: ColorTheme.whiteColor),
                                ),
                              ),
                              Text(
                                pages[index]['description'],
                                style: const TextStyle(
                                    fontFamily: "Cairo",
                                    color: Color(0xffE2E4E7)),
                              ),
                            ],
                          );
                        },
                        controller: _pageController,
                        itemCount: pages.length,
                        physics: const BouncingScrollPhysics(),
                        onPageChanged: (value) {
                          setState(() {
                            index = value;
                          });
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: AppDimentions.paddingMedium),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Wrap(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: _pageIndicators(
                              pages: pages, context: context, index: index),
                        ),
                        index == pages.length - 1
                            ? const Wrap()
                            : GestureDetector(
                                onTap: () => index == pages.length - 1
                                    ? null
                                    : _pageController.nextPage(
                                        duration: const Duration(seconds: 1),
                                        curve: Curves.ease),
                                child: const CircleAvatar(
                                  backgroundColor: ColorTheme.secondaryColor,
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    color: ColorTheme.whiteColor,
                                  ),
                                ),
                              )
                      ],
                    ),
                  ),
                  SizedBox(height: index == pages.length - 1 ? 10 : 50),
                  index == pages.length - 1
                      ? Padding(
                          padding: const EdgeInsets.only(bottom: 50),
                          child: Row(
                            children: [
                              Expanded(
                                child: CommonButton(
                                  title: "Sign In",
                                  onPressed: () {},
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: CommonButton(
                                    backgroundColor: ColorTheme.secondaryColor,
                                    title: "Sign Up",
                                    onPressed: () =>
                                        context.goNamed("register")),
                              ),
                            ],
                          ),
                        )
                      : const Wrap()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  GestureDetector onbordingButtons({void Function()? onTap, String? title}) {
    return GestureDetector(
        onTap: onTap,
        child: Text(
          title!,
          style: const TextStyle(color: ColorTheme.whiteColor),
        ));
  }
}

List<Widget> _pageIndicators({pages, index, BuildContext? context}) {
  List<Container> indicators = [];

  for (int i = 0; i < pages.length; i++) {
    indicators.add(
      Container(
        width: i == index ? 30 : 10,
        height: 10,
        margin: const EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          color: i == index ? ColorTheme.secondaryColor : ColorTheme.greyColor,
          borderRadius: i == index
              ? BorderRadius.circular(50)
              : BorderRadius.circular(25),
        ),
      ),
    );
  }
  return indicators;
}
