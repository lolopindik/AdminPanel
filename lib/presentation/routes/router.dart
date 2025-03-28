import 'package:admin_panel_study_hub/presentation/routes/router.gr.dart';
import 'package:auto_route/auto_route.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {

 @override
  List<AutoRoute> get routes => [
    AutoRoute(page: MainRoute.page, initial: true),
  ];
}