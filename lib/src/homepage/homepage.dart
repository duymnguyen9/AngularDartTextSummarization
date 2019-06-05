import 'package:angular/angular.dart';
import 'package:StanfordAngNLP/src/component/stanfordlogo/stanfordlogo.dart';
import 'package:angular_components/material_input/material_input.dart';
import 'package:angular_components/material_input/material_input_multiline.dart';
import 'package:angular_components/angular_components.dart';
import 'package:skawa_material_components/card/card.dart';

@Component(
  selector: 'homepage',
  templateUrl: 'homepage.html',
  directives: [
    StanfordLogoComponent,
    MaterialMultilineInputComponent,
    skawaCardDirectives,

  ],
  styleUrls: [
    'homepage.scss.css'
  ],
  providers: const <dynamic>[materialProviders],
)
class HomepageComponent {}