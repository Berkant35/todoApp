


import 'package:flutter/material.dart';
import 'package:state_notifier/state_notifier.dart';


enum LoadingStates {idle,loading}

class ButtonLoadingManager extends StateNotifier<LoadingStates>{
  ButtonLoadingManager(LoadingStates state) :
        super(LoadingStates.idle);

  changeState(LoadingStates loadingState)
  {
    state = loadingState;
    debugPrint("Change state ${loadingState.name}");
  }
}