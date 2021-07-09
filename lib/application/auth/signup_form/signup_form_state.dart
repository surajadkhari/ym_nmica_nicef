part of 'signup_form_bloc.dart';

@freezed
abstract class SignupFormState with _$SignupFormState {
  const factory SignupFormState(
          {required EmailAddress emailAddress,
          required Password password,
          required bool isSubmitting,
          required bool showErrorMessagec,
          required Option<Either<AuthFailure, Unit>> authFailOrSuccessOption}) =
      _SignupFormState;

  factory SignupFormState.initial() => SignupFormState(
        emailAddress: EmailAddress(''),
        password: Password(''),
        showErrorMessagec: false,
        isSubmitting: false,
        authFailOrSuccessOption: none(),
      );
}
