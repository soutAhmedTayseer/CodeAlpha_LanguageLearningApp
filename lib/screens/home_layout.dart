import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_projects/management/cubit.dart';
import 'package:flutter_projects/management/states.dart';
import 'package:flutter_projects/screens/themes_screen.dart';
import 'about_screen.dart';
import 'languages_translation_screen.dart';
import 's1.dart'; // Importing screen s1
import 's2.dart'; // Importing screen s2
import 's3.dart'; // Importing screen s3

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        if (state is AppNavigateToThemesState) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ThemesScreen()),
          );
        } else if (state is AppNavigateToLanguagesState) {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const LanguagesTranslationScreen()),
          );
        } else if (state is AppNavigateToAboutState) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AboutScreen()),
          );
        }
      },
      builder: (context, state) {
        final appCubit = AppCubit.get(context);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: appCubit.currentTheme,
          home: Scaffold(
            appBar: AppBar(
              title: Text(
                tr('App'), // Use `tr()` for translation
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              centerTitle: true,
            ),
            body: Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(
                    'assets/images/background.jpeg',
                    fit: BoxFit.cover,
                  ),
                ),
                // Use IndexedStack to keep the state of the screens
                IndexedStack(
                  index: appCubit.currentIndex,
                  children: const [
                    S1(),  // Screen 1
                    S2(),  // Screen 2
                    S3(),  // Screen 3
                  ],
                ),
              ],
            ),
            drawer: Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  DrawerHeader(
                    decoration: const BoxDecoration(
                      color: Colors.cyan,
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.settings, size: 40, color: Colors.white),
                        const SizedBox(width: 16),
                        Text(
                          tr('Settings'), // Apply `tr()` for translation
                          style: const TextStyle(fontSize: 24, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.light_mode, color: Colors.cyan),
                    title: Text(tr('Themes')), // Use `tr()` for translation
                    onTap: () {
                      appCubit.navigateToThemes();
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.translate, color: Colors.cyan),
                    title: Text(tr('Languages')), // Use `tr()` for translation
                    onTap: () {
                      appCubit.navigateToLanguages();
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.info, color: Colors.cyan),
                    title: Text(tr('About')), // Use `tr()` for translation
                    onTap: () {
                      appCubit.navigateToAbout();
                    },
                  ),
                ],
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: appCubit.currentIndex,
              onTap: (index) => appCubit.changeIndex(index),
              items: [
                BottomNavigationBarItem(
                  icon: const Icon(Icons.looks_one),
                  label: tr('Screen 1'), // Use `tr()` for translation
                ),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.looks_two),
                  label: tr('Screen 2'), // Use `tr()` for translation
                ),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.looks_3),
                  label: tr('Screen 3'), // Use `tr()` for translation
                ),
              ],
              selectedItemColor: Colors.cyan,
            ),
          ),
        );
      },
    );
  }
}
