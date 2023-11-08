import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../domain/entities/nav_bar_item.dart';
import '../atoms/nav_bar_option_atom.dart';

class NavbarMolecule extends StatelessWidget {
  NavbarMolecule({
    super.key,
  });

  final navBarItems = Modular.get<List<NavBarItem>>();
  bool get shouldShowNavbar => navBarItems
      .map((navBarItem) => navBarItem.route)
      .contains(Modular.to.path);

  @override
  Widget build(BuildContext context) {
    return NavigationListener(
      builder: (context, child) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: shouldShowNavbar ? 80 : 0,
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 245, 248, 252),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              for (final navBarItem in navBarItems)
                Expanded(
                  child: NavBarOptionAtom(
                    isSelected: Modular.to.path.contains(navBarItem.route),
                    svgPath: navBarItem.svgPath,
                    onTap: navBarItem.navigation,
                    count: navBarItem.badgeCounter,
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
