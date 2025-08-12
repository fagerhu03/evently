import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:evently/screens/add_event/add_event_screen.dart';
import 'package:evently/screens/add_event/chip_item.dart';
import 'package:evently/screens/home/tabs/events_tab.dart';
import 'package:evently/screens/home/tabs/fav_tab.dart';
import 'package:evently/screens/home/tabs/map_tab.dart';
import 'package:evently/screens/home/tabs/profile_tab.dart';
import 'package:evently/screens/register/login_screen.dart';

import '../../providers/app_provider.dart';
import '../../providers/theme_provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "Home";

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  int selectedCategoryIndex = 0;
  List<Widget> tabs = [];

  List<String> categories = [
    "All",
    "meeting",
    "holiday",
    "workshop",
    "sport",
    "book_club",
    "eating",
    "birthday",
    "gaming",
    "exhibition",
  ];

  @override
  Widget build(BuildContext context) {
    var appProvider = Provider.of<AppProvider>(context);

    tabs = [
      EventsTab(category: categories[selectedCategoryIndex]),
      MapTab(),
      FavTab(),
      ProfileTab(),
    ];
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: false,
        toolbarHeight: 174.h,
        leadingWidth: 0.w,
        actions: [
          Column(
            children: [
              IconButton(icon: Icon(
                // Switch icon based on current theme
                Theme.of(context).brightness == Brightness.dark
                    ? Icons.light_mode
                    : Icons.dark_mode,
                color: Theme.of(context).colorScheme.primary,
              ),
                onPressed: () {
                  final provider = context.read<ThemeProvider>();
                  if (provider.themeMode == ThemeMode.dark) {
                    provider.changeTheme(ThemeMode.light);
                  } else {
                    provider.changeTheme(ThemeMode.dark);
                  }
                },),
              Container(
                width: 50.w,
                margin: EdgeInsets.symmetric(horizontal: 8),
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text("EN"),

                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    LoginScreen.routeName,
                    (route) => false,
                  );
                },
                icon: Icon(Icons.logout_outlined),
              ),
            ],
          ),
        ],
        shape: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(24.r),
            bottomRight: Radius.circular(24.r),
          ),
        ),
        backgroundColor: Color(0xFF5669FF),
        leading: SizedBox(),
        title: Column(
          spacing: 8.h,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome Back ✨",
              style: GoogleFonts.inter(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
            Text(
              "${appProvider.userModel?.username??""}",
              style: GoogleFonts.inter(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Row(
              children: [
                Icon(Icons.location_on_outlined, color: Colors.white),

                Text(
                  "Cairo , Egypt",
                  style: GoogleFonts.inter(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Container(
              height: 40.h,
              child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(width: 10),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return ChipItem(
                    title: categories[index],
                    bg: index == selectedCategoryIndex
                        ? Colors.white
                        : Colors.transparent,
                    textColor: index == selectedCategoryIndex
                        ? Color(0xFF5669FF)
                        : Colors.white,
                    borderColor: Colors.white,
                    isSelected: selectedCategoryIndex == index,
                    onTap: () {
                      selectedCategoryIndex = index;
                      setState(() {});
                    },
                  );
                },
                itemCount: 9,
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AddEventScreen.routeName);
        },
        child: Icon(Icons.add, size: 45, color: Colors.white),
        backgroundColor: Color(0xFF5669FF),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
          side: BorderSide(color: Colors.white, width: 4),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color(0xFF5669FF),
        padding: EdgeInsets.zero,
        notchMargin: 12,
        shape: CircularNotchedRectangle(),
        child: BottomNavigationBar(
          onTap: (value) {
            selectedIndex = value;
            setState(() {});
          },
          elevation: 0,
          backgroundColor: Colors.transparent,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
            BottomNavigationBarItem(
              icon: Icon(Icons.location_on_outlined),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border),
              label: "",
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
          ],
        ),
      ),
      body: tabs[selectedIndex],
    );
  }
}
