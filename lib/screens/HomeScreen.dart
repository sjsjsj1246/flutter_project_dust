import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_dust/components/card_title.dart';
import 'package:flutter_project_dust/components/category_card.dart';
import 'package:flutter_project_dust/components/hourly_card.dart';
import 'package:flutter_project_dust/components/main_app_bar.dart';
import 'package:flutter_project_dust/components/main_card.dart';
import 'package:flutter_project_dust/components/main_drawer.dart';
import 'package:flutter_project_dust/components/mame_stat.dart';
import 'package:flutter_project_dust/const/colors.dart';
import 'package:flutter_project_dust/const/env.dart';
import 'package:flutter_project_dust/const/status_level.dart';
import 'package:flutter_project_dust/model/stat_model.dart';
import 'package:flutter_project_dust/repository/stat_repository.dart';
import 'package:flutter_project_dust/utils/data_utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<List<StatModel>> fetchData() async {
    final statModels = await StatRepository.fetchData();
    return statModels;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      backgroundColor: PRIMARY_COLOR,
      body: FutureBuilder<List<StatModel>>(
          future: fetchData(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text("에러가 있습니다."),
              );
            }

            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            }

            List<StatModel> stats = snapshot.data!;
            StatModel recentStat = stats[0];
            final status = DataUtils.getStatusFromItemCodeAndValue(
              itemCode: ItemCode.PM10,
              value: recentStat.seoul,
            );

            return CustomScrollView(
              slivers: [
                MainAppBar(
                  status: status,
                  stat: recentStat,
                ),
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      CategoryCard(),
                      SizedBox(height: 16),
                      HourlyCard()
                    ],
                  ),
                )
              ],
            );
          }),
    );
  }
}
