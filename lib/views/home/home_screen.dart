import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '/providers/home_provider.dart';
import '/theme/color/color_schemes.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (_, pv, __) {
        return Scaffold(
          body: SafeArea(child: pv.navPages[pv.navIndex]),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: pv.navIndex,
            onTap: (idx) {
              pv.navIndex = idx;
            },
            elevation: 0,
            iconSize: 28,
            items: [
              BottomNavigationBarItem(
                icon: const Icon(Icons.home),
                label: AppLocalizations.of(context)!.home,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.person),
                label: AppLocalizations.of(context)!.profile,
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            backgroundColor: ColorSchemes.instance.black,
            child: Icon(
              Icons.add,
              color: ColorSchemes.instance.white,
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        );
      },
    );
  }
}
