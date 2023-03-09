// ignore_for_file: avoid_print

import 'package:bloc/bloc.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    print('onEvent $event \n');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print('onChange $change \n');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print('onTransition $transition \n');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print('onError $error \n');
    super.onError(bloc, error, stackTrace);
  }
}
/*
  Yukarıdaki kod hata ayıklama için gerçekten önemlidir, çünkü bir sonraki/şimdiki 
  durumun(state) ne olduğunu ve hangi olayın(event) şu anda etkin olduğunu kolayca 
  öğrenebilirsiniz.
*/ 