import 'package:flutter/material.dart';
import 'package:flutter_dashboard/screens/Dashboard.dart';
import 'package:flutter_dashboard/screens/PushNoti.dart';
import 'Email.dart';
import 'SMS.dart';
import 'Settings.dart';
import 'Whatsapp.dart';

class SideBarPage extends StatefulWidget {
  const SideBarPage({super.key});

  @override
  State<SideBarPage> createState() => _SideBarPageState();
}

class _SideBarPageState extends State<SideBarPage> with WidgetsBindingObserver {
  late PageController _pageController;
  int selectedItemIndex = 0;
  bool isSidebarVisible = true;
  bool isSidebarCollapsed = false;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    final bool isNarrow = MediaQuery.of(context).size.width < 600;
    setState(() {
      isSidebarVisible = !isNarrow;
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  void _navigateToPage(int index) {
    setState(() {
      selectedItemIndex = index;
      _pageController.jumpToPage(index);
    });
  }

  void _toggleSidebarVisibility() {
    setState(() {
      isSidebarVisible = !isSidebarVisible;
    });
  }

  void _toggleSidebarCollapse() {
    setState(() {
      isSidebarCollapsed = !isSidebarCollapsed;
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool isNarrow = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white30,
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: Colors.black,
            size: 24,
          ),
          onPressed: () {
            if (isNarrow) {
              _toggleSidebarVisibility();
            } else {
              _toggleSidebarCollapse();
            }
          },
        ),
        title: LayoutBuilder(
          builder: (context, constraints) {
            return Stack(
              children: [
                Container(
                  height: 40,
                  margin: EdgeInsets.only(left: isSidebarCollapsed ? 0 : 50),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 5.0,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      children: [
                        Icon(Icons.search, color: Colors.black),
                        SizedBox(width: 8),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Search...',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    child: Image.asset('assets/imain.png', fit: BoxFit.cover),
                    radius: 20,
                  ),
                ),
              ],
            );
          },
        ),
        actions: [
          SizedBox(width: 8),
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.black, size: 24),
            onPressed: () {
              // Handle notification icon press
            },
          ),
          SizedBox(width: 16),
          CircleAvatar(
            backgroundColor: Colors.blue,
            child: Icon(Icons.person, color: Colors.white, size: 24),
            radius: 20,
          ),
          SizedBox(width: 16),
        ],
      ),
      body: Row(
        children: [
          AnimatedContainer(
            duration: Duration(milliseconds: 300),
            width: isSidebarVisible ? (isSidebarCollapsed ? 60 : 250) : 0,
            color: Colors.white30,
            child: Offstage(
              offstage: !isSidebarVisible,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ListView(
                      padding: EdgeInsets.zero,
                      children: [
                        MenuTile(
                          title: isSidebarCollapsed ? '' : 'Dashboard',
                          icon: Icons.home,
                          isSelected: selectedItemIndex == 0,
                          onPressed: () => _navigateToPage(0),
                          isCollapsed: isSidebarCollapsed,
                        ),
                        MenuTile(
                          title: isSidebarCollapsed ? '' : "Email",
                          icon: Icons.email,
                          isSelected: selectedItemIndex == 1,
                          onPressed: () => _navigateToPage(1),
                          children: [
                            MenuTile(
                              title: isSidebarCollapsed ? '' : "Item 1",
                              icon: Icons.mail_outline,
                              isSelected: selectedItemIndex == 1,
                              onPressed: () {},
                              isCollapsed: isSidebarCollapsed,
                            ),
                            MenuTile(
                              title: isSidebarCollapsed ? '' : "Item 2",
                              icon: Icons.mail_outline,
                              isSelected: selectedItemIndex == 1,
                              onPressed: () {},
                              isCollapsed: isSidebarCollapsed,
                            ),
                            MenuTile(
                              title: isSidebarCollapsed ? '' : "Item 3",
                              icon: Icons.mail_outline,
                              isSelected: selectedItemIndex == 1,
                              onPressed: () {},
                              isCollapsed: isSidebarCollapsed,
                            ),
                          ],
                        ),
                        MenuTile(
                          title: isSidebarCollapsed ? '' : "SMS",
                          icon: Icons.chat,
                          isSelected: selectedItemIndex == 2,
                          onPressed: () => _navigateToPage(2),
                          children: [
                            MenuTile(
                              title: isSidebarCollapsed ? '' : "Item 1",
                              icon: Icons.sms,
                              isSelected: selectedItemIndex == 2,
                              onPressed: () {},
                              isCollapsed: isSidebarCollapsed,
                            ),
                            MenuTile(
                              title: isSidebarCollapsed ? '' : "Item 2",
                              icon: Icons.sms,
                              isSelected: selectedItemIndex == 2,
                              onPressed: () {},
                              isCollapsed: isSidebarCollapsed,
                            ),
                            MenuTile(
                              title: isSidebarCollapsed ? '' : "Item 3",
                              icon: Icons.sms,
                              isSelected: selectedItemIndex == 2,
                              onPressed: () {},
                              isCollapsed: isSidebarCollapsed,
                            ),
                          ],
                        ),
                        MenuTile(
                          title: isSidebarCollapsed ? '' : "WhatsApp",
                          icon: Icons.message,
                          isSelected: selectedItemIndex == 3,
                          onPressed: () => _navigateToPage(3),
                          children: [
                            MenuTile(
                              title: isSidebarCollapsed ? '' : "Item 1",
                              icon: Icons.message,
                              isSelected: selectedItemIndex == 3,
                              onPressed: () {},
                              isCollapsed: isSidebarCollapsed,
                            ),
                            MenuTile(
                              title: isSidebarCollapsed ? '' : "Item 2",
                              icon: Icons.message,
                              isSelected: selectedItemIndex == 3,
                              onPressed: () {},
                              isCollapsed: isSidebarCollapsed,
                            ),
                            MenuTile(
                              title: isSidebarCollapsed ? '' : "Item 3",
                              icon: Icons.message,
                              isSelected: selectedItemIndex == 3,
                              onPressed: () {},
                              isCollapsed: isSidebarCollapsed,
                            ),
                          ],
                        ),
                        MenuTile(
                          title: isSidebarCollapsed ? '' : "Push Notifications",
                          icon: Icons.notifications,
                          isSelected: selectedItemIndex == 4,
                          onPressed: () => _navigateToPage(4),
                          isCollapsed: isSidebarCollapsed,
                        ),
                        MenuTile(
                          title: isSidebarCollapsed ? '' : "Settings",
                          icon: Icons.settings,
                          isSelected: selectedItemIndex == 5,
                          onPressed: () => _navigateToPage(5),
                          isCollapsed: isSidebarCollapsed,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: PageView(
               controller: _pageController,
              children: const [
                DashBoardScreen(),
                EmailScreen(),
                SmsScreen(),
                WhatsappScreen(),
                PushNotifications(),
                SettingScreen(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MenuTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onPressed;
  final List<Widget>? children;
  final bool isCollapsed;

  const MenuTile({
    required this.title,
    required this.icon,
    required this.isSelected,
    required this.onPressed,
    this.children,
    this.isCollapsed = false,
  });

  @override
  Widget build(BuildContext context) {
    bool hasChildren = children != null && children!.isNotEmpty;

    return hasChildren
        ? ExpansionTile(
      leading: Icon(
        icon,
        color: isSelected ? Colors.blue : Colors.grey,
      ),
      title: Visibility(
        visible: !isCollapsed,
        child: Text(
          title,
          style: TextStyle(
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
      children: children!,
      onExpansionChanged: (expanded) {
        if (expanded) {
          onPressed();
        }
      },
    )
        : ListTile(
      leading: Icon(
        icon,
        color: isSelected ? Colors.blue : Colors.grey,
      ),
      title: Visibility(
        visible: !isCollapsed,
        child: Container(
          width: double.infinity,
          child: Text(
            title,
            style: TextStyle(
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ),
      onTap: onPressed,
    );
  }
}
