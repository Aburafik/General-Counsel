import 'package:feather_icons/feather_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:general_counsel/Utils/exports.dart';

class ProfileView extends ConsumerWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        ClipPath(
          clipper: ImageClipper(),
          child: Container(
            height: 300,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  AssetImages.logo,
                ),
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                gradient: linearGradient,
              ),
              child: const Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // SizedBox(height: 150),
                  Text(
                    "Profile",
                    style:
                        TextStyle(color: ColorTheme.whiteColor, fontSize: 25),
                  ),
                ],
              )),
            ),
          ),
        ),
        CircleAvatar(
          radius: 50,
        ),
        settingsTile(title: "My Profile", icon: FeatherIcons.user),
        settingsTile(title: "About", icon: FeatherIcons.alertCircle),
        settingsTile(title: "Share", icon: FeatherIcons.share2),
        settingsTile(title: "Logout", icon: FeatherIcons.logOut),
      ],
    );
  }

  Card settingsTile({String? title, IconData? icon}) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10),
      surfaceTintColor: ColorTheme.whiteColor,
      elevation: .5,
      shape: RoundedRectangleBorder(),
      child: ListTile(
        title: Text(title!),
        trailing: Icon(
          icon,
          size: 20,
          color: ColorTheme.secondaryColor,
        ),
      ),
    );
  }
}
