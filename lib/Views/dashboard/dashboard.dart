import 'package:feather_icons/feather_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:general_counsel/Providers/splash_provider.dart';
import 'package:general_counsel/Utils/exports.dart';
import 'package:general_counsel/Views/home/home.dart';
import 'package:general_counsel/Views/profile/profile.dart';

class DashBoardView extends ConsumerWidget {
  DashBoardView({super.key});
  int _currentIndex = 0;

  final List pages = [
    HomeView(),
    const Center(
      child: Text("2"),
    ),
    ProfileView()
  ];
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _currentIndex = ref.watch(currentIndexProvider);

    return Scaffold(
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: ColorTheme.primaryColor,
          unselectedItemColor: ColorTheme.greyColor,
          iconSize: 20,
          currentIndex: _currentIndex,
          onTap: (value) => ref
              .read(currentIndexProvider.notifier)
              .update((state) => state = value),
          items: const [
            BottomNavigationBarItem(
                icon: Icon(FeatherIcons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: CircleAvatar(
                    backgroundColor: ColorTheme.secondaryColor,
                    child: Icon(FeatherIcons.menu)),
                label: "Feeds"),
            BottomNavigationBarItem(
                icon: Icon(FeatherIcons.user), label: "Profile"),
          ]),
    );
  }
}
