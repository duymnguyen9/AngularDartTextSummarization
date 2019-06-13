import 'package:angular/angular.dart';
import 'package:StanfordAngNLP/src/router/routes.dart';
import 'package:angular_router/angular_router.dart';

// AngularDart info: https://webdev.dartlang.org/angular
// Components info: https://webdev.dartlang.org/components

@Component(
  selector: 'my-app',
  styleUrls: ['app_component.css'],
  template: '''
  <router-outlet [routes]="Routes.all"></router-outlet>
''',
  directives: [routerDirectives],
  exports: [RoutePaths, Routes],
)
class AppComponent {
  // Nothing here yet. All logic is in TodoListComponent.
}

//TODO: need to create toggle for either ratio or word count
//TODO: add hint onto wordCount to 
