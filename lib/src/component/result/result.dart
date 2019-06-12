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




  ],
  providers:  [materialProviders, ClassProvider(TextResultService)],
)

class ResultComponent{
  ResultComponent(this._textResultService);

  @Input()
  TextResult textResult;
  @Input()
  String originalText;


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
  }
  void editMode(){
    editText = originalText;
    editModeStatus = true;
  }
  void submitText(){
    print(editText);
    errorMessage = false;
    if(editText.length<50){
      errorMessage = true;
    }
    else{
      getResult();
    }
  }

  Future<void> getResult() async{
    isCustomToolBeltPanelExpanded = false;
    isLoading = true;
    textResult = await _textResultService.createPost('http://127.0.0.1:5000/textsubmit', editText, wordCount, contentPercent);
    originalText = editText;
    print(editText);
    editModeStatus = false;
    isLoading = false;
  }
  num wordCount;
  num contentPercent = 50;


  void cancelCustomization(){
    //TODO reverse back to previous settings
  }

  void submitCustomization(){
    //TODO set customization
  }
}

class Chip implements HasUIDisplayName {
  @override
  final String uiDisplayName;
  const Chip(this.uiDisplayName);
}