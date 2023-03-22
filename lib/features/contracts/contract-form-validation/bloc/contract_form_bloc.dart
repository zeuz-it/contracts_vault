import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:contracts_vault/features/auth/login/login-form-validation/bloc/login_form_bloc.dart';
import 'package:contracts_vault/features/models/contract_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../auth/auth_repository_impl.dart';
import '../../../database/database_repository_impl.dart';
import '../../../models/user_model.dart';

part 'contract_form_event.dart';
part 'contract_form_state.dart';

class ContractFormBloc extends Bloc<ContractFormEvent, ContractFormsValidate> {
  final AuthRepository _authRepository;
  final DatabaseRepository _databaseRepository;

  ContractFormBloc(this._authRepository, this._databaseRepository)
      : super(const ContractFormsValidate(
          nextStep: false,
        )) {
    on<ContractNameChanged>(_onContractNameChanged);
    on<CategoryChanged>(_onCategoryChanged);
    on<PersonChanged>(_onPersonChanged);
    on<CompanyChanged>(_onCompanyChanged);
    on<ContractTypeChanged>(_onContractTypeChanged);
    on<ContractNumberChanged>(_onContractNumberChanged);
    on<StartDateChanged>(_onStartDateChanged);
    on<EndDateChanged>(_onEndDateChanged);
    on<PricePeriodChanged>(_onPricePeriodChanged);
    on<PaymentAmountChanged>(_onPaymentAmountChanged);
    on<EmailReminderChanged>(_onEmailReminderChanged);
    on<NotificationReminderChanged>(_onNotificationReminderChanged);
    on<FormSubmitted>(_onFormSubmitted);
    on<FormSucceeded>(_onFormSucceeded);
  }

  bool _isDateValid(String? dateString) {
    if (dateString == null || dateString.isEmpty) {
      return false;
    } else if (dateString.isNotEmpty) {
      final dateArr = dateString.split('-');
      final String formattedDateString =
          "${dateArr[2]}-${dateArr[1]}-${dateArr[0]}";
      DateTime? date = DateTime.tryParse(formattedDateString);
      return date == null ? false : true;
    } else {
      return false;
    }
  }

  bool _isEmpty(String? nameString) {
    return (nameString == null || nameString.isEmpty);
  }

  _onContractNameChanged(
    ContractNameChanged event,
    Emitter<ContractFormsValidate> emit,
  ) async {
    emit(
      state.copyWith(
        name: event.name,
        nextStep: !_isEmpty(event.name),
        nameErrorMessage:
            !_isEmpty(event.name) ? "" : "Contract Adı Boş Bırakılamaz",
      ),
    );
  }

  _onCategoryChanged(
    CategoryChanged event,
    Emitter<ContractFormsValidate> emit,
  ) async {
    emit(
      state.copyWith(
        category: event.category,
      ),
    );
  }

  _onPersonChanged(
    PersonChanged event,
    Emitter<ContractFormsValidate> emit,
  ) async {
    emit(
      state.copyWith(
        person: event.person,
      ),
    );
  }

  _onCompanyChanged(
    CompanyChanged event,
    Emitter<ContractFormsValidate> emit,
  ) async {
    emit(
      state.copyWith(
        company: event.company,
      ),
    );
  }

  _onContractTypeChanged(
    ContractTypeChanged event,
    Emitter<ContractFormsValidate> emit,
  ) async {
    emit(
      state.copyWith(
        contractType: event.contractType,
      ),
    );
  }

  _onContractNumberChanged(
    ContractNumberChanged event,
    Emitter<ContractFormsValidate> emit,
  ) async {
    emit(
      state.copyWith(
        contractNumber: event.contractNumber,
      ),
    );
  }

  _onStartDateChanged(
    StartDateChanged event,
    Emitter<ContractFormsValidate> emit,
  ) async {
    emit(
      state.copyWith(
        startDate: event.startDate,
        nextStep: _isDateValid(event.startDate),
        isStartDateValid: _isDateValid(event.startDate),
        startDateErrorMessage:
            !_isDateValid(event.startDate) ? "Tarih formatı yanlış." : "",
      ),
    );
  }

  _onEndDateChanged(
    EndDateChanged event,
    Emitter<ContractFormsValidate> emit,
  ) async {
    emit(
      state.copyWith(
        endDate: event.endDate,
        nextStep: _isDateValid(event.endDate),
        isEndDateValid: _isDateValid(event.endDate),
        endDateErrorMessage:
            !_isDateValid(event.endDate) ? "Tarih formatı yanlış." : "",
      ),
    );
  }

  _onPricePeriodChanged(
    PricePeriodChanged event,
    Emitter<ContractFormsValidate> emit,
  ) async {
    emit(
      state.copyWith(
        pricePeriod: event.pricePeriod,
      ),
    );
  }

  _onPaymentAmountChanged(
    PaymentAmountChanged event,
    Emitter<ContractFormsValidate> emit,
  ) async {
    emit(
      state.copyWith(
        paymentAmount: event.paymentAmount,
      ),
    );
  }

  _onEmailReminderChanged(
    EmailReminderChanged event,
    Emitter<ContractFormsValidate> emit,
  ) async {
    emit(
      state.copyWith(
        emailReminder: event.emailReminder,
      ),
    );
  }

  _onNotificationReminderChanged(
    NotificationReminderChanged event,
    Emitter<ContractFormsValidate> emit,
  ) async {
    emit(
      state.copyWith(
        notificationReminder: event.notificationReminder,
      ),
    );
  }

  _onFormSubmitted(
    FormSubmitted event,
    Emitter<ContractFormsValidate> emit,
  ) async {
    ContractModel contract = ContractModel(
      name: state.name,
      category: state.category,
      person: state.person,
      company: state.company,
      contractType: state.contractType,
      contractNumber: state.contractNumber,
      startDate: state.startDate,
      endDate: state.endDate,
      pricePeriod: state.pricePeriod,
      paymentAmount: state.paymentAmount,
      emailReminder: state.emailReminder,
      notificationReminder: state.notificationReminder,
      isNameValid: state.isNameValid,
      isStartDateValid: state.isStartDateValid,
      isEndDateValid: state.isEndDateValid,
      isFormValid: state.isFormValid,
      isFormValidateFailed: state.isFormValidateFailed,
    );

    if (event.value == Status.create) {
      await _addNewContract(event, emit, contract);
    } else if (event.value == Status.update) {
      await _updateContract(event, emit, contract);
    }
  }

  _addNewContract(
    FormSubmitted event,
    Emitter<ContractFormsValidate> emit,
    ContractModel contract,
  ) async {
    //TODO: Yeni contract'ı firebase'e ekle
  }

  _updateContract(
    FormSubmitted event,
    Emitter<ContractFormsValidate> emit,
    ContractModel contract,
  ) async {
    //TODO: Mevcut contract'ı firebase'de güncelle
  }

  _onFormSucceeded(
    FormSucceeded event,
    Emitter<ContractFormsValidate> emit,
  ) {
    emit(state.copyWith());
  }
}
