import 'package:futurecoin/modules/main/portfolio/state/portfolio/portfolio_controller.dart';
import 'package:get/get.dart';

class DIPortfolio {
  static void injectDependencies() {
    Get.put<PortfolioController>(PortfolioController());
  }
}
