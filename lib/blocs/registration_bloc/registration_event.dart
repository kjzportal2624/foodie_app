part of 'registration_bloc.dart';

abstract class RegistrationEvent extends Equatable {
  const RegistrationEvent();

  @override
  List<Object> get props => [];
}

class RegisterAccount extends RegistrationEvent {
  final Map<String, dynamic> registrationForm;
  RegisterAccount({required this.registrationForm});
}
