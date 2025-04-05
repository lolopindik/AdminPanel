import 'package:admin_panel_study_hub/logic/riverpod/auth_status.dart';
import 'package:admin_panel_study_hub/presentation/routes/router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  final WidgetRef ref;

  AppRouter(this.ref, {super.navigatorKey}) : super();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: MainRoute.page,
          path: '/main',
          guards: [AuthGuard(ref)],
          initial: true
        ),
        AutoRoute(page: AuthRoute.page, path: '/auth'),
        AutoRoute(page: AccessDeniedRoute.page, path: '/access-denied'),
      ];
}

class AuthGuard extends AutoRouteGuard {
  final WidgetRef ref;

  AuthGuard(this.ref);

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    final authStatus = ref.read(authStatusProvider);

    if (!authStatus.isAuth) {
      router.replacePath('/auth');
    } else if (authStatus.role != 'Admin') {
      router.replacePath('/access-denied');
    } else {
      resolver.next(true);
    }
  }
}
