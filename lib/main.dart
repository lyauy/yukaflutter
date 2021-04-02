import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yuka/scanner.dart';
import 'package:yuka/caracteristiques.dart';
import 'package:yuka/fiche.dart';
import 'package:yuka/nutrition.dart';
import 'package:yuka/res/app_colors.dart';
import 'package:yuka/res/app_images.dart';
import 'package:yuka/res/app_icons.dart';
import 'package:yuka/res/app_vectorial_images.dart';
import 'package:yuka/tableau.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: AppColors.blue,
          primaryColorDark: AppColors.blueDark,
          accentColor: AppColors.yellow,
          appBarTheme: AppBarTheme(
              elevation: 0.0,
              backgroundColor: AppColors.white,
              titleTextStyle: TextStyle(color: AppColors.blue),
              actionsIconTheme: IconThemeData(color: AppColors.blue)),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
              selectedItemColor: AppColors.blue,
              unselectedItemColor: AppColors.gray2)),
      home: EmptyListScreen(),
    );
  }
}

class EmptyListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Mes scans',
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
        actions: [
          IconButton(
            icon: Icon(AppIcons.barcode),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Scanner()),
              );
            },
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(AppVectorialImages.illEmpty),
            SizedBox(height: screenHeight * 0.1),
            FractionallySizedBox(
              widthFactor: 0.3,
              child: Text(
                'Vous n\'avez pas encore scanné de produit',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.blue,
                  height: 1.7,
                  fontSize: 17.0,
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.1),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Navbar()),
                );
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    'Commencer'.toUpperCase(),
                  ),
                  const SizedBox(width: 20.0),
                  Icon(Icons.arrow_right_alt),
                ],
              ),
              style: OutlinedButton.styleFrom(
                padding: EdgeInsets.symmetric(
                  vertical: 18.0,
                  horizontal: 25.0,
                ),
                primary: AppColors.blue,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(22.0),
                  ),
                ),
                backgroundColor: AppColors.yellow,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class Body extends StatelessWidget {
  const Body({
    Key? key,
    required this.themeData,
  }) : super(key: key);

  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(16.0),
              topRight: const Radius.circular(16.0))),
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 30.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 2 textes
          Text(
            'Petit pois et carotte',
            style: themeData.textTheme.headline5,
          ),
          Text(
            'Cassegrain',
            style: themeData.textTheme.headline6!.copyWith(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

class Navbar extends StatefulWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  _Navbar createState() => _Navbar();
}

/// This is the private State class that goes with MyStatefulWidget.
class _Navbar extends State<Navbar> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  final List<Widget> _widgetOptions = <Widget>[
    Fiche(),
    Caracteristiques(),
    Nutrition(),
    Tableau(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var themeData = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mes scans'),
      ),
      body: SizedBox.expand(
        child: Stack(
          children: [
            Image(
              image: AssetImage(AppImages.pancake),
              height: 400,
              fit: BoxFit.cover,
            ),
            Positioned(
                child: Body(themeData: themeData),
                left: 0,
                right: 0,
                top: 350)
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Fiche',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Caractéristiques',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Nutrition',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Tableau',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}

/*
class Banner extends StatelessWidget {
  const Banner({
    Key? key,
    required this.themeData,
  }) : super(key: key);

  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        FractionallySizedBox(
          widthFactor: 0.44,
          child: Nutriscore(themeData: themeData),
        )
      ],
    );
  }
}

class Body extends StatelessWidget {
  const Body({
    Key? key,
    required this.themeData,
  }) : super(key: key);

  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [Header(themeData: themeData), Text('Lorem ipsum')],
      ),
    );
  }
}



class Nutriscore extends StatelessWidget {
  const Nutriscore({
    Key? key,
    required this.themeData,
  }) : super(key: key);

  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        FractionallySizedBox(
          widthFactor: 0.44,
          child: Nutriscore(themeData: themeData),
        )
      ],
    );
  }
} */