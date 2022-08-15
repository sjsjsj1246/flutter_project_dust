import 'package:flutter/material.dart';
import 'package:flutter_project_dust/const/colors.dart';

const regions = [
  "서울",
  "경기",
  "대구",
  "충남",
  "인천",
  "대전",
  "경북",
  "세종",
  "광주",
  "전북",
  "강원",
  "울산",
  "전남",
  "부산",
  "제주",
  "충북",
  "경남",
];

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

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
                  selected: false,
                  tileColor: Colors.white,
                  onTap: () {},
                  title: Text(e)))
              .toList()
        ],
      ),
    );
  }
}
