import 'package:flutter/material.dart';
import 'package:flutter_project_dust/const/colors.dart';
import 'package:flutter_project_dust/const/regions.dart';

typedef OnRegionTap = void Function(String region);

class MainDrawer extends StatelessWidget {
  final OnRegionTap onRegionTap;
  final String selectedRegion;

  const MainDrawer(
      {required this.onRegionTap, required this.selectedRegion, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: DARK_COLOR,
      child: ListView(
        children: [
          DrawerHeader(
            child: Text('Drawer Header'),
          ),
          ...regions
              .map((e) => ListTile(
                  selectedTileColor: LIGHT_COLOR,
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
