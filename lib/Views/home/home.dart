import 'package:feather_icons/feather_icons.dart';
import 'package:general_counsel/Utils/exports.dart';
import 'package:go_router/go_router.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  List<IconData> icons = [
    FeatherIcons.bookOpen,
    FeatherIcons.activity,
    FeatherIcons.activity,
    FeatherIcons.activity,
    FeatherIcons.activity,
    FeatherIcons.activity,
  ];
  List categories = [
    "ordinary criminal cases",
    "Commercial cases",
    "The Constitution",
    "Law Courts",
    "List of Chief Justices",
    "Righ to Information (RTI) manual",
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "GENERAL\nCOUNSEL",
                      style: TextStyle(
                          color: ColorTheme.secondaryColor,
                          fontFamily: "Cairo",
                          fontSize: 10,
                          fontWeight: FontWeight.w800),
                    ),
                    Image(
                        image: AssetImage(AssetImages.logo),
                        height: 40,
                        width: 40),
                  ],
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 15),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: MediaQuery.sizeOf(context).height / 4.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: ColorTheme.primaryColor,
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Daily Legal Tips",
                          style: TextStyle(
                            color: ColorTheme.secondaryColor,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          "Access the workbooks categories below to expand the your legal knowledge",
                          style: TextStyle(
                            color: ColorTheme.whiteColor,
                          ),
                        )
                      ],
                    ),
                  ),
                  Image(
                      image: AssetImage(AssetImages.logo),
                      height: 100,
                      width: 100),
                ],
              ),
            ),
            const Text(
              "Protected workbooks",
              style: TextStyle(fontSize: 25),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 8, bottom: 15),
              child: Text(
                "Access the workbooks categories below to expand the your legal knowledge",
                textAlign: TextAlign.center,
                style: TextStyle(color: ColorTheme.greyColor),
              ),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 170,
                    mainAxisExtent: 135,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15),
                itemBuilder: (context, index) {
                  return CategoryCard(
                    title: categories[index],
                    icon: icons[index],
                    onTap: () => context.goNamed("cases"),
                  );
                },
                itemCount: 6,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard(
      {super.key, this.title, this.icon, this.onTap, this.description});
  final String? title;
  final String? description;
  final IconData? icon;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: ColorTheme.secondaryColor, width: 0.5),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(icon, color: ColorTheme.secondaryColor, size: 30),
              Text(
                textAlign: TextAlign.center,
                title!,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
