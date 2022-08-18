import 'package:flutter/material.dart';
import 'package:flutter_project_dust/const/colors.dart';
import 'package:flutter_project_dust/const/regions.dart';

typedef OnRegionTap = void Function(String region);

class MainDrawer extends StatelessWidget {
  final Color darkColor, lightColor;
  final OnRegionTap onRegionTap;
  final String selectedRegion;

  const MainDrawer(
      {required this.darkColor,
      required this.lightColor,
      required this.onRegionTap,
      required this.selectedRegion,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: darkColor,
      child: ListView(
        children: [
          DrawerHeader(
            child: Text('Drawer Header'),
          ),
          ...regions
              .map((e) => ListTile(
                  selectedTileColor: lightColor,
                  selectedColor: Colors.black,
                  selected: e == selectedRegion,
                  tileColor: Colors.white,
                  onTap: () {
                    onRegionTap(e);
                  },
                  title: Text(e)))
              .toList()
        ],
      ),
    );
  }
}
