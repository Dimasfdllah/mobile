import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/login_screen.dart';
import 'package:flutter_application_1/widgets/home_nav_bar.dart';
import 'package:flutter_application_1/widgets/items_widget_burger.dart';
import 'package:flutter_application_1/widgets/items_widget_chicken.dart';
import 'package:flutter_application_1/widgets/items_widget_coffee.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ThemeModel extends ChangeNotifier {
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  void toggleDarkMode() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }

  void logout(BuildContext context) {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => LoginPage()), (route) => false);
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedCategory = 'Burger';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeModel(),
      child: Consumer<ThemeModel>(
        builder: (context, theme, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: theme.isDarkMode ? ThemeData.light() : ThemeData.dark(),
            home: MyHomePage(
                title: 'Explore', selectedCategory: selectedCategory),
          );
        },
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  final String selectedCategory;

  const MyHomePage(
      {Key? key, required this.title, required this.selectedCategory})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModel>(
      builder: (context, theme, child) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              title,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                ListTile(
                  title: Row(
                    children: [
                      Text(
                        'Log Out',
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            color:
                                theme.isDarkMode ? Colors.black : Colors.white,
                            fontSize: 18,
                            letterSpacing: 1.3,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                      Spacer(),
                      Switch(
                        value: theme.isDarkMode,
                        onChanged: (value) {
                          theme.logout(context);
                        },
                      ),
                    ],
                  ),
                  onTap: () {},
                ),
              ],
            ),
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 30),
                  Text(
                    "Order your",
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        color: theme.isDarkMode ? Colors.black : Colors.white,
                        fontSize: 25,
                        letterSpacing: 1.3,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "favourite food",
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        color: theme.isDarkMode ? Colors.black : Colors.white,
                        letterSpacing: 1.1,
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  SizedBox(height: 25),
                  Wrap(
                    spacing: 10,
                    children: [
                      for (String category in [
                        'Burger',
                        'Chicken',
                        'Coffee',
                        'Drinks'
                      ])
                        ChoiceChip(
                          label: Text(category),
                          selected: selectedCategory == category,
                          onSelected: (selected) {
                            if (selected) {
                              Navigator.of(context)
                                  .pushReplacement(MaterialPageRoute(
                                builder: (context) => MyHomePage(
                                    title: 'Explore',
                                    selectedCategory: category),
                              ));
                            }
                          },
                        ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Expanded(
                    child: selectedCategory == 'Burger'
                        ? ItemsWidgetBurger()
                        : selectedCategory == 'Chicken'
                            ? ItemsWidgetChicken()
                            : selectedCategory == 'Coffee'
                                ? ItemsWidgetCoffee()
                                : selectedCategory == 'Drinks'
                                    ? ItemsWidgetCoffee()
                                    : SizedBox(),
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: HomeNavBar(),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              theme.toggleDarkMode();
            },
            child: const Icon(Icons.lightbulb),
          ),
        );
      },
    );
  }
}

// void main() {
//   runApp(HomeScreen());
// }
