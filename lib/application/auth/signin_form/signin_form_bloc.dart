import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:unicef/domain/auth/auth_failure.dart';
import 'package:unicef/domain/auth/i_auth_facade.dart';
import 'package:unicef/domain/auth/value_objects.dart';

part 'signin_form_event.dart';
part 'signin_form_state.dart';
part 'signin_form_bloc.freezed.dart';

class SigninFormBloc extends Bloc<SigninFormEvent, SigninFormState> {
  final IauthFacade _authFacade;

  SigninFormBloc(this._authFacade) : super(SigninFormState.initial());

  @override
  Stream<SigninFormState> mapEventToState(
    SigninFormEvent event,
  ) async* {
    yield* event.map(
      emailChanged: (e) async* {
        yield state.copyWith(
          emailAddress: EmailAddress(e.emailStr),
          authFailOrSuccessOption: none(),
        );
      },
      passwordChanged: (e) async* {
        yield state.copyWith(
          password: Password(e.passwordStr),
          authFailOrSuccessOption: none(),
        );
      },
      signInWithEmailAndPasswordPressed: (e) async* {
        yield* _performActionOnAuthFacadeWithEmailAndPassword(
          _authFacade.signInWithEmailAndPassword,
        );
      },
      signInWithGooglePressed: (e) async* {
        yield state.copyWith(
          isSubmitting: true,
          authFailOrSuccessOption: none(),
        );
        final failureOrSuccess = await _authFacade.signInGoogle();
        yield state.copyWith(
            isSubmitting: false,
            authFailOrSuccessOption: some(failureOrSuccess));
      },
    );
  }

  Stream<SigninFormState> _performActionOnAuthFacadeWithEmailAndPassword(
    Future<Either<AuthFailure, Unit>> Function({
      required EmailAddress emailAddress,
      required Password password,
    })
        forwardedCall,
  ) async* {
    Either<AuthFailure, Unit>? failureOrSuccess;

    final isEmailValid = state.emailAddress.isValid();
    final isPasswordValid = state.password.isValid();

    if (isEmailValid && isPasswordValid) {
      yield state.copyWith(
        isSubmitting: true,
        authFailOrSuccessOption: none(),
      );

      failureOrSuccess = await forwardedCall(
        emailAddress: state.emailAddress,
        password: state.password,
      );
    }
    yield state.copyWith(
      isSubmitting: false,
      showErrorMessagec: true,
      authFailOrSuccessOption: optionOf(failureOrSuccess),
    );
  }
}
