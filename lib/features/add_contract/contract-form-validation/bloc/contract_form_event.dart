part of 'contract_form_bloc.dart';

enum Status { create, update }

abstract class ContractFormEvent extends Equatable {
  const ContractFormEvent();

  @override
  List<Object> get props => [];
}

class ContractNameChanged extends ContractFormEvent {
  final String name;
  const ContractNameChanged(this.name);

  @override
  List<Object> get props => [name];
}

class CategoryChanged extends ContractFormEvent {
  final String category;
  const CategoryChanged(this.category);

  @override
  List<Object> get props => [category];
}

class PersonChanged extends ContractFormEvent {
  final String person;
  const PersonChanged(this.person);

  @override
  List<Object> get props => [person];
}

class CompanyChanged extends ContractFormEvent {
  final String company;
  const CompanyChanged(this.company);

  @override
  List<Object> get props => [company];
}

class ContractTypeChanged extends ContractFormEvent {
  final String contractType;
  const ContractTypeChanged(this.contractType);

  @override
  List<Object> get props => [contractType];
}

class ContractNumberChanged extends ContractFormEvent {
  final String contractNumber;
  const ContractNumberChanged(this.contractNumber);

  @override
  List<Object> get props => [contractNumber];
}

class StartDateChanged extends ContractFormEvent {
  final String startDate;
  const StartDateChanged(this.startDate);

  @override
  List<Object> get props => [startDate];
}

class EndDateChanged extends ContractFormEvent {
  final String endDate;
  const EndDateChanged(this.endDate);

  @override
  List<Object> get props => [endDate];
}

class PricePeriodChanged extends ContractFormEvent {
  final String pricePeriod;
  const PricePeriodChanged(this.pricePeriod);

  @override
  List<Object> get props => [pricePeriod];
}

class PaymentAmountChanged extends ContractFormEvent {
  final String paymentAmount;
  const PaymentAmountChanged(this.paymentAmount);

  @override
  List<Object> get props => [paymentAmount];
}

class EmailReminderChanged extends ContractFormEvent {
  final bool emailReminder;
  const EmailReminderChanged(this.emailReminder);

  @override
  List<Object> get props => [emailReminder];
}

class NotificationReminderChanged extends ContractFormEvent {
  final bool notificationReminder;
  const NotificationReminderChanged(this.notificationReminder);

  @override
  List<Object> get props => [notificationReminder];
}

class FormSubmitted extends ContractFormEvent {
  final Status value;
  const FormSubmitted({required this.value});

  @override
  List<Object> get props => [value];
}

class FormSucceeded extends ContractFormEvent {
  const FormSucceeded();

  @override
  List<Object> get props => [];
}
