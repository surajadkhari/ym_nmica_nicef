import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:unicef/domain/auth/i_auth_facade.dart';


class SignupFormBloc extends Bloc<SignupFormEvent, SignupFormState> {
  final IauthFacade _authFacade;

  SignupFormBloc(this._authFacade) : super(_SignupFormState());

  @override
  Stream<SignupFormState> mapEventToState(
    SignupFormEvent event,
  ) async* {
    yield* event.
      
     
  }
}
