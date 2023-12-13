import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:general_counsel/Utils/exports.dart';
import 'package:go_router/go_router.dart';

class CasesView extends StatelessWidget {
  const CasesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("smndf"),
        backgroundColor: ColorTheme.primaryColor,
        leading: IconButton(
            onPressed: () {
              context.goNamed("dashboard");
            },
            icon: Icon(Icons.arrow_back_ios_new)),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: ExpansionTile(
              children: [
                Text("skdjfjdksf"),
                Text("skdjfjdksf"),
                Text("skdjfjdksf"),
                Text("skdjfjdksf"),
                Text("skdjfjdksf"),
                Text("skdjfjdksf"),
              ],
              collapsedShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6)),
              collapsedBackgroundColor: ColorTheme.primaryColor,
              collapsedTextColor: ColorTheme.primaryColor,
              // backgroundColor: ColorTheme.primaryColor,
              textColor: Colors.black,
              tilePadding: EdgeInsets.symmetric(horizontal: 6),
              shape: Border.all(color: Colors.transparent),
              title: Text(
                "Counter $index",
                style: const TextStyle(color: ColorTheme.whiteColor),
              ),
            )

            // ListTile(
            //   tileColor: ColorTheme.primaryColor,
            //   title: Text(
            //     "Counter $index",
            //     style: TextStyle(color: ColorTheme.whiteColor),
            //   ),
            // ),
            ),
      ),
    );
  }
}
