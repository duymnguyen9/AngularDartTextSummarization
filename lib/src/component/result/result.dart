import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'package:skawa_material_components/card/card.dart';

import 'package:StanfordAngNLP/src/service/text_result.dart';
import 'package:StanfordAngNLP/src/service/text_result_service.dart';
import 'package:angular_components/material_chips/material_chip.dart';
import 'package:angular_components/material_chips/material_chips.dart';
import 'package:StanfordAngNLP/src/component/errorcard/errorcard.dart';




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
    displayNameRendererDirective,
    MaterialExpansionPanel,
    MaterialExpansionPanelSet,
    MaterialExpansionPanelAutoDismiss,
    MaterialButtonComponent,
    MaterialIconComponent,
    MaterialYesNoButtonsComponent,
    MaterialMultilineInputComponent,
    materialInputDirectives,
    skawaCardDirectives,
    SkawaCardComponent,
    materialNumberInputDirectives,
    MaterialSliderComponent,


    ErrorCardComponent

  ],
  providers:  [materialProviders, ClassProvider(TextResultService)],
)

class ResultComponent{
  ResultComponent(this._textResultService);

  @Input()
  TextResult textResult;
  @Input()
  String originalText;
  @Input()
  num wordCount;
  @Input()
  num contentPercent;


  bool isCustomToolBeltPanelExpanded = false;
  bool editModeStatus = false;
  String editText;
  bool errorMessage = false;
  bool isLoading = false;

  TextResultService _textResultService;



  List<Chip> listOfChips(){
    List<Chip> _listOfChips = [];
    for (var i in textResult.keywords){
      _listOfChips.add(Chip(i));
    }
    return _listOfChips;
  }

  void clearEditMode(){
    editText = '';
  }
  void cancelEditMode(){
    editModeStatus = false;
    if(confirmedWordCount!= null){
      wordCount = confirmedWordCount;
    }
    contentPercent = confirmedContentPercent;
  }
  void editMode(){
    editText = originalText;
    editModeStatus = true;
  }
  void submitText(){
    if(wordCount != null){
      confirmedWordCount = wordCount;
    }
    confirmedContentPercent = contentPercent;
    isCustomToolBeltPanelExpanded = false;
    errorMessage = false;
    errorMessageCode = _textResultService.validatingInput(editText);
    if(errorMessageCode<2){
      errorMessage = true;
    }
    else{
      getResult();
    }
  }

  int errorMessageCode;


  Future<void> getResult() async{
    isCustomToolBeltPanelExpanded = false;
    isLoading = true;
    textResult = await _textResultService.createPost('http://127.0.0.1:5000/textsubmit', editText, confirmedWordCount, confirmedContentPercent);
    originalText = editText;
    print(editText);
    editModeStatus = false;
    isLoading = false;
  }
  num confirmedWordCount;
  num confirmedContentPercent = 50;

}

class Chip implements HasUIDisplayName {
  @override
  final String uiDisplayName;
  const Chip(this.uiDisplayName);
}