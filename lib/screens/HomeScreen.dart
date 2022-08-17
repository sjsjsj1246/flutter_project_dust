import 'package:flutter/material.dart';
import 'package:flutter_project_dust/components/card_title.dart';
import 'package:flutter_project_dust/components/category_card.dart';
import 'package:flutter_project_dust/components/hourly_card.dart';
import 'package:flutter_project_dust/components/main_app_bar.dart';
import 'package:flutter_project_dust/components/main_card.dart';
import 'package:flutter_project_dust/components/main_drawer.dart';
import 'package:flutter_project_dust/components/mame_stat.dart';
import 'package:flutter_project_dust/const/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      backgroundColor: PRIMARY_COLOR,
      body: CustomScrollView(
        slivers: [
          MainAppBar(),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [CategoryCard(), SizedBox(height: 16), HourlyCard()],
            ),
          )
        ],
      ),
    );
  }
}
