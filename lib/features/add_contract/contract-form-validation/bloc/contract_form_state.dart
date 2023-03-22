part of 'contract_form_bloc.dart';

abstract class ContractFormState extends Equatable {
  const ContractFormState();
}

class ContractFormInitial extends ContractFormState {
  @override
  List<Object> get props => [];
}

class ContractFormsValidate extends ContractFormState {
  const ContractFormsValidate({
    this.name,
    this.category,
    this.person,
    this.company,
    this.contractType,
    this.contractNumber,
    this.startDate,
    this.endDate,
    this.pricePeriod,
    this.paymentAmount,
    this.emailReminder,
    this.notificationReminder,
    this.isNameValid,
    this.nameErrorMessage,
    this.isStartDateValid,
    this.startDateErrorMessage,
    this.isEndDateValid,
    this.endDateErrorMessage,
    this.isFormValid,
    this.isFormValidateFailed,
    this.nextStep,
    this.result,
    this.errorMessage,
  });

  final String? name;
  final String? category;
  final String? person;
  final String? company;
  final String? contractType;
  final String? contractNumber;
  final String? startDate;
  final String? endDate;
  final String? pricePeriod;
  final String? paymentAmount;
  final bool? emailReminder;
  final bool? notificationReminder;
  final bool? isNameValid;
  final String? nameErrorMessage;
  final bool? isStartDateValid;
  final String? startDateErrorMessage;
  final bool? isEndDateValid;
  final String? endDateErrorMessage;
  final bool? isFormValid;
  final bool? isFormValidateFailed;
  final bool? nextStep;
  final bool? result;
  final String? errorMessage;

  ContractFormsValidate copyWith({
    final String? name,
    final String? category,
    final String? person,
    final String? company,
    final String? contractType,
    final String? contractNumber,
    final String? startDate,
    final String? endDate,
    final String? pricePeriod,
    final String? paymentAmount,
    final bool? emailReminder,
    final bool? notificationReminder,
    final bool? isNameValid,
    final String? nameErrorMessage,
    final bool? isStartDateValid,
    final String? startDateErrorMessage,
    final bool? isEndDateValid,
    final String? endDateErrorMessage,
    final bool? isFormValid,
    final bool? isFormValidateFailed,
    final bool? nextStep,
    final bool? result,
    final String? errorMessage,
  }) {
    return ContractFormsValidate(
      name: name ?? this.name,
      category: category ?? this.category,
      person: person ?? this.person,
      company: company ?? this.company,
      contractType: contractType ?? this.contractType,
      contractNumber: contractNumber ?? this.contractNumber,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      pricePeriod: pricePeriod ?? this.pricePeriod,
      paymentAmount: paymentAmount ?? this.paymentAmount,
      emailReminder: emailReminder ?? this.emailReminder,
      notificationReminder: notificationReminder ?? this.notificationReminder,
      isNameValid: isNameValid ?? this.isNameValid,
      nameErrorMessage: nameErrorMessage ?? this.nameErrorMessage,
      isStartDateValid: isStartDateValid ?? this.isStartDateValid,
      startDateErrorMessage:
          startDateErrorMessage ?? this.startDateErrorMessage,
      isEndDateValid: isEndDateValid ?? this.isEndDateValid,
      endDateErrorMessage: endDateErrorMessage ?? this.endDateErrorMessage,
      isFormValid: isFormValid ?? this.isFormValid,
      isFormValidateFailed: isFormValidateFailed ?? this.isFormValidateFailed,
      nextStep: nextStep ?? this.nextStep,
      result: result ?? this.result,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        name,
        category,
        person,
        company,
        contractType,
        contractNumber,
        startDate,
        endDate,
        pricePeriod,
        paymentAmount,
        emailReminder,
        notificationReminder,
        isNameValid,
        nameErrorMessage,
        isStartDateValid,
        startDateErrorMessage,
        isEndDateValid,
        endDateErrorMessage,
        isFormValid,
        isFormValidateFailed,
        nextStep,
        result,
        errorMessage,
      ];
}
