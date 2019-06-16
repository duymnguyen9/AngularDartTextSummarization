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
import 'package:StanfordAngNLP/src/component/errorcard/errorcard.dart';



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
    ErrorCardComponent,
    MaterialRadioComponent,
    MaterialRadioGroupComponent


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
    if(wordCountError==false){
      if(contentPercentCheck == true){
        confirmedContentPercent??=contentPercent;
      }
      isLoading = true;
      textResult = await _textResultService.createPost('http://127.0.0.1:5000/textsubmit', boundText, confirmedWordCount, confirmedContentPercent);
      isLoading = false;
      isResult = true;
    }

  }

  void cancelCustomization(){
    if(confirmedWordCount!= null){
      wordCount = confirmedWordCount;
    }
    contentPercent = confirmedContentPercent;

  }

  void submitCustomization(){
    if(wordCountCheck == true && wordCount != null){
      confirmedWordCount = wordCount;
      isCustomToolBeltPanelExpanded = false;
      confirmedContentPercent = null;

    }
    else if(wordCountCheck== true && wordCount == null){
      wordCountError = true;
    }
    else if(contentPercentCheck == true){
      confirmedWordCount = null;
      confirmedContentPercent = contentPercent;
      isCustomToolBeltPanelExpanded = false;
    }

  }




  num wordCount;
  num contentPercent = 50;

  num confirmedWordCount;
  num confirmedContentPercent = 50;

  bool isCustomToolBeltPanelEssayExpanded=true;
  bool wordCountCheck = false;
  bool contentPercentCheck = true;

  bool wordCountError = false;


}