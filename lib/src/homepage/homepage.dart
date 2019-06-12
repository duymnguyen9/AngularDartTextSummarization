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


  void clearText(){
    boundText = '';
  }

  void submitText(){
    errorMessage = false;

    if(boundText.length<50){
      errorMessage = true;
    }
    else{
      getResult();
    }
  }


  Future<void> getResult() async{
    isLoading = true;
    textResult = await _textResultService.createPost('http://127.0.0.1:5000/textsubmit', boundText, wordCount, contentPercent);
    isLoading = false;
    isResult = true;
  }

  void cancelCustomization(){
    //TODO reverse back to previous settings
  }

  void submitCustomization(){
    //TODO set customization
  }




  num wordCount;
  num contentPercent = 50;





}