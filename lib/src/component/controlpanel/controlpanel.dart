import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'dart:async';



@Component(
  selector: 'control-panel',
  templateUrl: 'controlpanel.html',
  styleUrls: ['controlpanel.scss.css'],
  directives: [
    MaterialInputComponent,
    materialNumberInputDirectives,
    MaterialSliderComponent,
    materialInputDirectives,
    coreDirectives,



    AutoFocusDirective,
    MaterialButtonComponent,
    MaterialIconComponent,
    materialInputDirectives,
    MaterialMultilineInputComponent,
    materialNumberInputDirectives,
    MaterialPaperTooltipComponent,
    MaterialTooltipTargetDirective,
    NgIf,
  ],
  providers: [materialProviders],

)


class ControlPanelComponent
{

  //@Input()
  num wordCount;
  num contentPercentInput=30;
  @Input()
  num contentPercent;

  final _changeController = StreamController<num>.broadcast(sync: true);
  @Output()
  Stream<num> get contentPercentChange => _changeController.stream;
  
  void updateContentPercent(){

    _changeController.add(contentPercent);
  }



}