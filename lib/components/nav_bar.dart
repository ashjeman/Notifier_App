import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  int currentPageIndex;

  NavBar({
    super.key,
    required this.currentPageIndex
  });

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {

  @override
  Widget build(BuildContext context) {
    return NavigationBarTheme(
        data: const NavigationBarThemeData(
            height: 70,
            backgroundColor: Color(0xFF011272),
            labelTextStyle: WidgetStatePropertyAll(TextStyle(color: Colors.white))
        ),
        child: NavigationBar(
          selectedIndex: widget.currentPageIndex,
          onDestinationSelected: (int index) {
            setState(() {
              widget.currentPageIndex = index;
              switch(widget.currentPageIndex){
                case 0: Navigator.pushNamed(context, '/homepage'); break;
                case 1: Navigator.pushNamed(context, '/dashboardpage'); break;
                case 2: Navigator.pushNamed(context, '/alarmlistpage'); break;
                case 3: Navigator.pushNamed(context, '/chathistorypage'); break;
              }

            });
          },
          destinations: const [
            NavigationDestination(
              selectedIcon: Icon(
                Icons.home,
                color: Color(0xFFF6C601),
                size: 35,
              ),
              icon: Icon(
                Icons.home_outlined,
                color: Colors.white,
              ),
              label: 'Home Page',
            ),
            NavigationDestination(
                selectedIcon: Icon(
                    Icons.dashboard,
                    color: Color(0xFFF6C601),
                    size: 35
                ),
                icon: Icon(
                  Icons.dashboard,
                  color: Colors.white,
                ),
                label: 'Dashboard'
            ),
            NavigationDestination(
                selectedIcon: Icon(
                    Icons.notifications_active,
                    color: Color(0xFFF6C601),
                    size: 35
                ),
                icon: Icon(
                  Icons.notifications_active,
                  color: Colors.white,
                ),
                label: 'Alarm'
            ),
            NavigationDestination(
                selectedIcon: Icon(
                    Icons.forum,
                    color: Color(0xFFF6C601),
                    size: 35
                ),
                icon: Icon(
                  Icons.forum_rounded,
                  color: Colors.white,
                ),
                label: 'Chat'
            ),
          ]
        )

    );
  }
}
