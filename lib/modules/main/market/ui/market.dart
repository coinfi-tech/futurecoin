import 'package:flutter/material.dart';
import 'package:futurecoin/core/theme/colors.dart';
import 'package:futurecoin/core/theme/text_styles.dart';
import 'package:futurecoin/modules/main/market/state/market_data/market_data_controller.dart';
import 'package:get/get.dart';

import 'widgets/strategy_builder.dart';
import 'widgets/watchlist.dart';

class Market extends StatelessWidget {
  Market({Key? key}) : super(key: key);

  final MarketDataController marketDataController = Get.find();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          toolbarHeight: 64,
          title: Text(
            "Markets",
            style: AppTextStyles.appBarHeading
                .copyWith(color: AppColors.textWhite),
          ),
          backgroundColor: AppColors.appBarBackgroundColor,
          elevation: 0,
          bottom: TabBar(
            labelPadding: EdgeInsets.all(16),
            labelColor: AppColors.textWhite,
            indicatorColor: AppColors.uiWhite,
            indicatorPadding: EdgeInsets.symmetric(horizontal: 80, vertical: 8),
            unselectedLabelColor: AppColors.uiGray_40,
            tabs: [tab("Watchlist"), tab("Strategy Trading")],
          ),
        ),
        body: TabBarView(
          children: [
            Watchlist(),
            StrategyBuilder(),
          ],
        ),
      ),
    );
  }

  Widget tab(String tab) {
    return Text(
      tab,
      style: AppTextStyles.tabHeading,
    );
  }
}
