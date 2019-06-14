import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';


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
  ]
)


class ControlPanelComponent{
  @Input()
  num wordCount;
  @Input()
  num contentPercent=50;

  @Output()
  num confirmedWordCount;
  @Output()
  num confirmedContentPercent = 50;


}