import 'package:flutter/material.dart';
import 'package:flutter_news/core/router/route_const.dart';
import 'package:go_router/go_router.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final String location = GoRouterState.of(context).matchedLocation;

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            child: Text(
              'Drawer Header',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          ListTile(
            leading: Icon(Icons.system_security_update_warning),
            title: Text('Early Warning System'),
            onTap: () {
              Navigator.pop(context);
              context.go(RouteConst.earlyWarningSystemPage);
            },
            selected: location == RouteConst.earlyWarningSystemPage,
          ),
        ],
      ),
    );
  }
}
