import 'package:angular/angular.dart';
import 'package:StanfordAngNLP/src/component/stanfordlogo/stanfordlogo.dart';
import 'package:angular_components/material_input/material_input.dart';
import 'package:angular_components/material_input/material_input_multiline.dart';
import 'package:angular_components/angular_components.dart';
import 'package:skawa_material_components/card/card.dart';
import 'package:angular_components/material_icon/material_icon.dart';

import 'package:StanfordAngNLP/src/service/text_result.dart';
import 'package:StanfordAngNLP/src/service/text_result_service.dart';
import 'dart:async';

import 'package:StanfordAngNLP/src/component/result/result.dart';



@Component(
  selector: 'homepage',
  templateUrl: 'homepage.html',
  directives: [
    StanfordLogoComponent,
    MaterialMultilineInputComponent,
    skawaCardDirectives,
    MaterialButtonComponent, MaterialIconComponent,
    materialInputDirectives,
    coreDirectives,
    NgClass,
    ResultComponent,
    SkawaCardComponent,
    MaterialExpansionPanelSet,
    MaterialExpansionPanel,
    MaterialInputComponent,
    materialNumberInputDirectives,
    MaterialSliderComponent,
    MaterialExpansionPanelAutoDismiss,



  ],
  styleUrls: [
    'homepage.scss.css'
  ],
  providers: [materialProviders, ClassProvider(TextResultService)],
)
class HomepageComponent {
  final TextResultService _textResultService;
  HomepageComponent(this._textResultService);

  TextResult textResult;

  String boundText = '';
  //Error Message
  bool errorMessage = false;
  bool isResult = false;
  bool isLoading = false;
  bool isCustomToolBeltPanelExpanded = true;

  int errorMessageCode;

  void clearText(){
    boundText = '';
  }

  void submitText(){
    errorMessage = false;
    errorMessageCode = _textResultService.validatingInput(boundText);
    if(errorMessageCode<2){
      errorMessage = true;
    }
    else{
      getResult();
    }
  }






  Future<void> getResult() async{
    confirmedContentPercent??=contentPercent;
    isLoading = true;
    textResult = await _textResultService.createPost('http://127.0.0.1:5000/textsubmit', boundText, confirmedWordCount, confirmedContentPercent);
    isLoading = false;
    isResult = true;
  }

  void cancelCustomization(){
    if(confirmedWordCount!= null){
      wordCount = confirmedWordCount;
    }
    contentPercent = confirmedContentPercent;

  }

  void submitCustomization(){
    if(wordCount != null){
      confirmedWordCount = wordCount;
    }
    confirmedContentPercent = contentPercent;
    isCustomToolBeltPanelExpanded = false;
  }




  num wordCount;
  num contentPercent = 50;

  num confirmedWordCount;
  num confirmedContentPercent = 50;





}