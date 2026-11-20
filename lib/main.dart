import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'theme/app_theme.dart';
import 'screens/home/home_screen.dart';
import 'screens/announcements/announcements_screen.dart';
import 'screens/events/events_screen.dart';
import 'screens/clubs/clubs_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ),
  );
  runApp(const CampusConnectApp());
}

class CampusConnectApp extends StatelessWidget {
  const CampusConnectApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CampusConnect',
      theme: AppTheme.theme,
      debugShowCheckedModeBanner: false,
      home: const MainNavigation(),
    );
  }
}

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _selectedIndex = 0;

  final List<_NavItem> _navItems = const [
    _NavItem(
      label: 'Home',
      icon: Icons.home_outlined,
      activeIcon: Icons.home_rounded,
    ),
    _NavItem(
      label: 'Announcements',
      icon: Icons.campaign_outlined,
      activeIcon: Icons.campaign_rounded,
    ),
    _NavItem(
      label: 'Events',
      icon: Icons.event_outlined,
      activeIcon: Icons.event_rounded,
    ),
    _NavItem(
      label: 'Clubs',
      icon: Icons.groups_outlined,
      activeIcon: Icons.groups_rounded,
    ),
  ];

  String get _pageTitle {
    switch (_selectedIndex) {
      case 0:
        return 'CampusConnect';
      case 1:
        return 'Announcements';
      case 2:
        return 'Events';
      case 3:
        return 'Clubs & Communities';
      default:
        return 'CampusConnect';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            if (_selectedIndex == 0) ...[
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Center(
                  child: Text('🎓', style: TextStyle(fontSize: 16)),
                ),
              ),
              const SizedBox(width: 10),
            ],
            Text(_pageTitle),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: CircleAvatar(
              radius: 16,
              backgroundColor: Colors.white.withValues(alpha: 0.2),
              child: Text(
                'S',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          HomeScreen(onNavigate: (i) => setState(() => _selectedIndex = i)),
          const AnnouncementsScreen(),
          const EventsScreen(),
          const ClubsScreen(),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (i) => setState(() => _selectedIndex = i),
        destinations: _navItems
            .map(
              (item) => NavigationDestination(
                icon: Icon(item.icon),
                selectedIcon: Icon(item.activeIcon, color: AppTheme.primary),
                label: item.label,
              ),
            )
            .toList(),
        animationDuration: const Duration(milliseconds: 300),
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
      ),
    );
  }
}

class _NavItem {
  final String label;
  final IconData icon;
  final IconData activeIcon;
  const _NavItem(
      {required this.label, required this.icon, required this.activeIcon});
}
