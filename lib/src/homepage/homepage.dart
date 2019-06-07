import 'package:angular/angular.dart';
import 'package:StanfordAngNLP/src/component/stanfordlogo/stanfordlogo.dart';
import 'package:angular_components/material_input/material_input.dart';
import 'package:angular_components/material_input/material_input_multiline.dart';
import 'package:angular_components/angular_components.dart';
import 'package:skawa_material_components/card/card.dart';
import 'package:angular_components/material_icon/material_icon.dart';

import 'package:angular_components/auto_dismiss/auto_dismiss.dart';
import 'package:angular_components/laminate/components/modal/modal.dart';
import 'package:angular_components/laminate/overlay/module.dart';


import 'package:StanfordAngNLP/src/service/text_result.dart';
import 'package:StanfordAngNLP/src/service/text_result_service.dart';
import 'dart:async';
import 'dart:convert';



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

  void clearText(){
    boundText = '';
  }

  void submitText(){
    if(boundText.length<50){
      errorMessage = true;
    }
    else{
      getResult();
    }
  }

  Future<void> getResult() async{
    textResult = await _textResultService.createPost('http://127.0.0.1:5000/textsubmit', boundText);
  }
  //TODO GET THE RESULT AND DISPLAY IT





}