part of 'signup_form_bloc.dart';

@freezed
class SignupFormEvent with _$SignupFormEvent {
  const factory SignupFormEvent.emailChanged() = EmailChanged;
  const factory SignupFormEvent.passwordChanged() = PasswordChanged;
  const factory SignupFormEvent.signUpWithEmailAndPasswordPressed() =
      SignUpWithEmailAndPasswordPressed;
}
