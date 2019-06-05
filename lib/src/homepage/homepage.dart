import 'package:angular/angular.dart';
import 'package:StanfordAngNLP/src/component/stanfordlogo/stanfordlogo.dart';
import 'package:angular_components/material_input/material_input.dart';
import 'package:angular_components/material_input/material_input_multiline.dart';

@Component(
  selector: 'homepage',
  templateUrl: 'homepage.html',
  directives: [
    StanfordLogoComponent,
    MaterialMultilineInputComponent
  ]
)
class HomepageComponent {}