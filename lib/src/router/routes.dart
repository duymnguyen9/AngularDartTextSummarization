import 'package:angular_router/angular_router.dart';
import 'route_paths.dart';
import 'package:StanfordAngNLP/src/homepage/homepage.template.dart' as homepage_template;

export 'route_paths.dart';

class Routes{
  static final homepage = RouteDefinition(
    routePath: RoutePaths.homepage,
    component: homepage_template.HomepageComponentNgFactory,
    useAsDefault: true,
  );

  static final all =<RouteDefinition>[homepage,];
}