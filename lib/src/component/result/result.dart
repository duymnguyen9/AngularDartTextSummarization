import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'package:skawa_material_components/card/card.dart';

import 'package:StanfordAngNLP/src/service/text_result.dart';
import 'package:StanfordAngNLP/src/service/text_result_service.dart';
import 'package:angular_components/material_chips/material_chip.dart';
import 'package:angular_components/material_chips/material_chips.dart';



@Component(
  selector: 'result-page',
  templateUrl: 'result.html',
  styleUrls: ['result.scss.css'],
  directives: [
    skawaCardDirectives,
    MaterialButtonComponent, MaterialIconComponent,
    coreDirectives,
    NgClass,
    MaterialChipComponent,
    MaterialChipsComponent,
    displayNameRendererDirective
  ],
  providers:  [materialProviders, ClassProvider(TextResultService)],
)

class ResultComponent{
  @Input()
  TextResult textResult;

  List<Chip> listOfChips(){
    List<Chip> _listOfChips = [];
    for (var i in textResult.keywords){
      _listOfChips.add(Chip(i));
  }
    return _listOfChips;
  }



}

class Chip implements HasUIDisplayName {
  @override
  final String uiDisplayName;
  const Chip(this.uiDisplayName);
}