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
            height: 60,
            backgroundColor: Color(0xFF011272),
            labelTextStyle: WidgetStatePropertyAll(TextStyle(color: Colors.white))
        ),
        child: NavigationBar(
          selectedIndex: widget.currentPageIndex,
            onDestinationSelected: (int index) {
              if (index != widget.currentPageIndex) {
                setState(() {
                  widget.currentPageIndex = index;
                  switch(widget.currentPageIndex) {
                    case 0: Navigator.popUntil(context, ModalRoute.withName('/login'));
                            Navigator.pushNamed(context, '/homepage');
                            widget.currentPageIndex = 0;
                            break;
                    case 1: Navigator.popUntil(context, ModalRoute.withName('/homepage'));
                            Navigator.pushNamed(context, '/dashboardpage');
                            widget.currentPageIndex = 1;
                            break;
                    case 2: Navigator.popUntil(context, ModalRoute.withName('/homepage'));
                            Navigator.pushNamed(context, '/alarmlistpage');
                            widget.currentPageIndex = 2;
                            break;
                    case 3: Navigator.popUntil(context, ModalRoute.withName('/homepage'));
                            Navigator.pushNamed(context, '/messageoptionpage');
                            widget.currentPageIndex = 3;
                            break;
                  }
                });
              }
            },
          destinations: const [
            NavigationDestination(
              selectedIcon: ImageIcon(AssetImage('assets/icons/home-icon.png'), color: Color(0xFFF6C601)),
              icon: ImageIcon(AssetImage('assets/icons/home-icon.png'), color: Colors.white),
              label: 'Home',
            ),
            NavigationDestination(
                selectedIcon: ImageIcon(AssetImage('assets/icons/Dashboard.png'), color: Color(0xFFF6C601)),
                icon: ImageIcon(AssetImage('assets/icons/Dashboard.png'), color: Colors.white),
                label: 'Dashboard'
            ),
            NavigationDestination(
                selectedIcon: ImageIcon(AssetImage('assets/icons/Alarm.png'), color: Color(0xFFF6C601)),
                icon: ImageIcon(AssetImage('assets/icons/Alarm.png'), color: Colors.white),
                label: 'Alarm'
            ),
            NavigationDestination(
                selectedIcon: ImageIcon(AssetImage('assets/icons/Chat.png'), color: Color(0xFFF6C601)),
                icon: ImageIcon(AssetImage('assets/icons/Chat.png'), color: Colors.white),
                label: 'Chat'
            ),
          ]
        )

    );
  }
}
