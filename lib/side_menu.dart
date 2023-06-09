import 'package:animatedsidebarmenu/side_menu_title.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

import 'RiveAssets/rive_asset.dart';
import 'RiveAssets/rive_utils.dart';
import 'info_card.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 288,
        height: double.infinity,
        color: const Color(0xff17203A),
        child: SafeArea(
          child: Column(
            children: [
              const InfoCard(
                name: 'Tahe Ben Said',
                profession: 'Flutter | Swift Developer',
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24, top: 32, bottom: 16),
                child: Text("Browse".toUpperCase(),
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: Colors.white70)),
              ),
              // const SideMenuTile(),
              ...sideMenus.map(
                (menu) => SideMenuTile(
                  menu: menu,
                  riveonInit: (artboard) {
                    StateMachineController controller =
                        RiveUtils.getRiveController(artboard,
                            stateMachineName: menu.stateMachineName);
                    menu.input = controller.findSMI("active") as SMIBool;
                  },
                  press: () {
                    menu.input!.change(true);
                    Future.delayed(const Duration(seconds: 1), () {
                      menu.input!.change(false);
                    });
                  },
                  isActive: false,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
