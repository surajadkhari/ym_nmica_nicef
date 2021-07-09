part of 'signin_form_bloc.dart';

@freezed
abstract class SigninFormState with _$SigninFormState {
  const factory SigninFormState(
          {required EmailAddress emailAddress,
          required Password password,
          required bool isSubmitting,
          required bool showErrorMessagec,
          required Option<Either<AuthFailure, Unit>> authFailOrSuccessOption}) =
      _SigninFormState;

  factory SigninFormState.initial() => SigninFormState(
        emailAddress: EmailAddress(''),
        password: Password(''),
        showErrorMessagec: false,
        isSubmitting: false,
        authFailOrSuccessOption: none(),
      );
}
