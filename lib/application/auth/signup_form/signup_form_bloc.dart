import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:unicef/domain/auth/auth_failure.dart';
import 'package:unicef/domain/auth/i_auth_facade.dart';
import 'package:unicef/domain/auth/value_objects.dart';

part 'signup_form_event.dart';
part 'signup_form_state.dart';
part 'signup_form_bloc.freezed.dart';

class SignupFormBloc extends Bloc<SignupFormEvent, SignupFormState> {
  final IauthFacade _authFacade;

  SignupFormBloc(this._authFacade) : super(SignupFormState.initial());

  @override
  Stream<SignupFormState> mapEventToState(
    SignupFormEvent event,
  ) async* {
    //yield* event.
  }
}
