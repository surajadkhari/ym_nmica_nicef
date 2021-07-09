part of 'signup_form_bloc.dart';

@freezed
class SignupFormEvent with _$SignupFormEvent {
  const factory SignupFormEvent.emailChanged(String emailStr) = EmailChanged;
  const factory SignupFormEvent.passwordChanged(String passwordStr) =
      PasswordChanged;
  const factory SignupFormEvent.signUpWithEmailAndPasswordPressed() =
      SignUpWithEmailAndPasswordPressed;
}
