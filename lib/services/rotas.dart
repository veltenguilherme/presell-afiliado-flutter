import 'package:get/get.dart';

import '../pages/home/pages/large_page.dart';
import '../pages/home/pages/medium_page.dart';
import '../pages/home/pages/small_page.dart';
import '../pages/widgets/progress_dialog.dart';
import '../pages/widgets/responsive_layout.dart';
import 'di_container.dart';

final rotas = DiContainer.resolve<RotasService>();

class RotasService {
  List<GetPage> getPages() => [
        GetPage(
            name: Rotas.home,
            page: () =>
                _getResponsivePage(SHomePage(), MHomePage(), LHomePage())),
      ];

  toPageOff(dynamic page,
      {Transition? transition,
      Duration? duration,
      String? routeName,
      String? arguments,
      closeProgressDialog = false}) {
    if (closeProgressDialog) progressDialog.closeDialog();

    Get.off(page,
        routeName: routeName,
        arguments: arguments,
        transition: transition ?? Transition.fadeIn,
        duration: duration ?? const Duration(milliseconds: 0));
  }

  toPage(dynamic page,
      {Transition? transition,
      Duration? duration,
      String? routeName,
      String? arguments,
      closeProgressDialog = false}) {
    if (closeProgressDialog) progressDialog.closeDialog();

    Get.to(page,
        transition: transition ?? Transition.fadeIn,
        routeName: routeName,
        arguments: arguments,
        duration: duration ?? const Duration(milliseconds: 0));
  }

  toPageNamed(String route,
      {Duration? duration,
      closeProgressDialog = false,
      Transition? transition}) {
    if (closeProgressDialog) progressDialog.closeDialog();

    Get.to(getPages().where((element) => element.name == route).first.page,
        routeName: route,
        transition: transition ?? Transition.fadeIn,
        duration: duration ?? const Duration(milliseconds: 0));
  }

  toPageOffNamed(String route,
      {Transition? transition,
      Duration? duration,
      closeProgressDialog = false}) {
    if (closeProgressDialog) progressDialog.closeDialog();

    Get.offAll(getPages().where((element) => element.name == route).first.page,
        transition: transition ?? Transition.fadeIn,
        duration: duration ?? const Duration(milliseconds: 0),
        routeName: route);
  }

  toPageWithDynamicArgs(dynamic page,
      {Transition? transition,
      Duration? duration,
      String? routeName,
      dynamic arguments,
      closeProgressDialog = false}) {
    if (closeProgressDialog) progressDialog.closeDialog();

    Get.to(page,
        transition: transition ?? Transition.fadeIn,
        routeName: routeName,
        arguments: arguments,
        duration: duration ?? const Duration(milliseconds: 0));
  }

  _getResponsivePage(smallBody, mediuBody, largeBody) => ResponsiveLayout(
        sBody: smallBody,
        mBody: mediuBody,
        lBody: largeBody,
      );
}

class Rotas {
  static const String home = '/';
}
