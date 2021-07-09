import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'signup_form_event.dart';
part 'signup_form_state.dart';
part 'signup_form_bloc.freezed.dart';

class SignupFormBloc extends Bloc<SignupFormEvent, SignupFormState> {
  SignupFormBloc() : super(_SignupFormState());

  @override
  Stream<SignupFormState> mapEventToState(
    SignupFormEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
