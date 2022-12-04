import 'package:coinfi/core/theme/colors.dart';
import 'package:coinfi/core/theme/text_styles.dart';
import 'package:coinfi/data/models/instrument_model.dart';
import 'package:coinfi/data/models/test_data/market_test_data.dart';
import 'package:coinfi/modules/global_widgets/buttons/button_primary_A.dart';
import 'package:coinfi/modules/global_widgets/buttons/button_primary_B.dart';
import 'package:coinfi/modules/global_widgets/buttons/button_secondary.dart';
import 'package:coinfi/modules/main/market/ui/widgets/instrument_bottom_sheet/widgets/market_depth.dart';
import 'package:coinfi/modules/main/market/ui/widgets/instrument_bottom_sheet/widgets/market_stats.dart';
import 'package:flutter/material.dart';

import '../../../../../global_widgets/divider/divider.dart';

class InstrumentBottomSheetLayout extends StatelessWidget {
  const InstrumentBottomSheetLayout({Key? key, required this.instrument})
      : super(key: key);

  final InstrumentModel instrument;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        ///Instrument main details
        instrumentTitle(),
        const Divider(
          color: AppColors.uiGray_40,
          height: 0,
        ),

        ///Instrument data components
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buySellSection(),
            dividerWithPadding(),
            marketDepthSection(),
            dividerWithPadding(),
            marketStatsSection(),
          ],
        ),
      ],
    );
  }
}

Widget instrumentTitle() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "BTC",
          style: AppTextStyles.h4,
        ),
        SizedBox(
          height: 8,
        ),
        Row(
          children: [
            Text(
              "16417",
              style: AppTextStyles.bodyRegular
                  .copyWith(color: AppColors.textGreen),
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              "+1.2%",
              style: AppTextStyles.bodySmall,
            )
          ],
        ),
      ],
    ),
  );
}

Widget marketDepthSection() {
  return MarketDepth(
    marketDepthData: MarketDepthTestData.marketDepthData,
  );
}

Widget dividerWithPadding() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 24.0),
    child: AppDivider.uiDividerGray,
  );
}

Widget buySellSection() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
    child: Column(
      children: [
        ///Buy Sell
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonPrimaryA(text: "Buy", onClick: () {}),
            SizedBox(
              width: 32,
            ),
            ButtonPrimaryB(text: "Sell", onClick: () {}),
          ],
        ),
        SizedBox(
          height: 32,
        ),

        ///View Chart
        ButtonSecondary(
          text: "View Chart",
          onClick: () {},
          iconLeft: Icons.bar_chart_rounded,
          iconRight: Icons.arrow_forward,
        ),
      ],
    ),
  );
}

Widget marketStatsSection() {
  return MarketStats(marketStatsModel: MarketDepthTestData.marketStatsData);
}