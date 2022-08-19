import 'package:flutter/material.dart';
import 'package:flutter_project_dust/components/category_card.dart';
import 'package:flutter_project_dust/components/hourly_card.dart';
import 'package:flutter_project_dust/components/main_app_bar.dart';
import 'package:flutter_project_dust/components/main_drawer.dart';
import 'package:flutter_project_dust/const/colors.dart';
import 'package:flutter_project_dust/const/regions.dart';
import 'package:flutter_project_dust/model/stat_and_status_model.dart';
import 'package:flutter_project_dust/model/stat_model.dart';
import 'package:flutter_project_dust/repository/stat_repository.dart';
import 'package:flutter_project_dust/utils/data_utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String region = regions[0];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<Map<ItemCode, List<StatModel>>> fetchData() async {
    Map<ItemCode, List<StatModel>> stats = {};
    List<Future> futures = [];

    for (ItemCode itemCode in ItemCode.values) {
      futures.add(StatRepository.fetchData(itemCode: itemCode));
    }

    final results = await Future.wait(futures);

    for (int i = 0; i < results.length; i++) {
      final key = ItemCode.values[i];
      final value = results[i];

      stats.addAll({key: value});
    }

    return stats;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Map<ItemCode, List<StatModel>>>(
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

            Map<ItemCode, List<StatModel>> stats = snapshot.data!;
            StatModel pm10RecentStat = stats[ItemCode.PM10]!.first;
            final status = DataUtils.getStatusFromItemCodeAndValue(
              itemCode: ItemCode.PM10,
              value: pm10RecentStat.seoul,
            );

            final ssModel = stats.keys.map((key) {
              final value = stats[key]!;
              final stat = value[0];
              return StatAndStatusModel(
                  itemCode: key,
                  status: DataUtils.getStatusFromItemCodeAndValue(
                      value: stat.getLevelFromModel(region), itemCode: key),
                  stat: stat);
            }).toList();

            return Scaffold(
              drawer: MainDrawer(
                darkColor: status.darkColor,
                lightColor: status.lightColor,
                selectedRegion: region,
                onRegionTap: (String region) {
                  setState(() {
                    this.region = region;
                    Navigator.of(context).pop();
                  });
                },
              ),
              body: Container(
                color: status.primaryColor,
                child: CustomScrollView(
                  slivers: [
                    MainAppBar(
                      region: region,
                      status: status,
                      stat: pm10RecentStat,
                    ),
                    SliverToBoxAdapter(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          CategoryCard(
                              darkColor: status.darkColor,
                              lightColor: status.lightColor,
                              region: region,
                              models: ssModel),
                          const SizedBox(height: 16),
                          ...stats.keys.map(
                            (itemCode) => Padding(
                              padding: const EdgeInsets.only(bottom: 16.0),
                              child: HourlyCard(
                                darkColor: status.darkColor,
                                lightColor: status.lightColor,
                                category:
                                    DataUtils.getItemCodeKrString(itemCode),
                                stats: stats[itemCode]!,
                                region: region,
                              ),
                            ),
                          ),
                          const SizedBox(height: 32),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
