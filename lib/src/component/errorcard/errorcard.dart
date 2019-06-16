import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'package:skawa_material_components/card/card.dart';


@Component(
  selector: 'error-card',
  templateUrl: 'errorcard.html',
  directives: [
    MaterialMultilineInputComponent,
    skawaCardDirectives,
    MaterialButtonComponent, MaterialIconComponent,
    materialInputDirectives,
    coreDirectives,
    NgClass,
    SkawaCardComponent,
    MaterialExpansionPanelSet,
    MaterialExpansionPanel,
    MaterialExpansionPanelAutoDismiss,



  ],
  styleUrls: [
    'errorcard.scss.css'
  ],
  providers: [materialProviders],
)
class ErrorCardComponent{
  @Input()
  int errorMessageCode;
}

