part of 'signin_form_bloc.dart';

@freezed
class SigninFormEvent with _$SigninFormEvent {
  const factory SigninFormEvent.emailChanged(String emailStr) = EmailChanged;
  const factory SigninFormEvent.passwordChanged(String passwordStr) =
      PasswordChanged;

  const factory SigninFormEvent.signInWithEmailAndPasswordPressed() =
      SignInWithEmailAndPasswordPressed;

  const factory SigninFormEvent.signInWithGooglePressed() =
      SignInWithGooglePressed;

  const factory SigninFormEvent.signInWithFacebookPressed() =
      SignInWithFacebookPressed;
}
