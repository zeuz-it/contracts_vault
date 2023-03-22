import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';

class ContractModel {  
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
  final bool? isStartDateValid;
  final bool? isEndDateValid;
  final bool? isFormValid;
  final bool? isFormValidateFailed;

  ContractModel({
    required this.name,
    this.category,
    this.person,
    this.company,
    this.contractType,
    this.contractNumber,
    required this.startDate,
    required this.endDate,
    this.pricePeriod,
    this.paymentAmount,
    this.emailReminder,
    this.notificationReminder,
    required this.isNameValid,
    required this.isStartDateValid,
    required this.isEndDateValid,
    required this.isFormValid,
    required this.isFormValidateFailed,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'category': category,
      'person': person,
      'company': company,
      'contractType': contractType,
      'contractNumber': contractNumber,
      'startDate': startDate,
      'endDate': endDate,
      'pricePeriod': pricePeriod,
      'paymentAmount': paymentAmount,
      'emailReminder': emailReminder,
      'notificationReminder': notificationReminder,
      'isNameValid': isNameValid,
      'isStartDateValid': isStartDateValid,
      'isEndDateValid': isEndDateValid,
      'isFormValid': isFormValid,
      'isFormValidateFailed': isFormValidateFailed,
    };
  }

  ContractModel.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc)
      : name = doc.data()!["name"],
        category = doc.data()!["category"],
        person = doc.data()!["person"],
        company = doc.data()!["company"],
        contractType = doc.data()!["contractType"],
        contractNumber = doc.data()!["contractNumber"],
        startDate = doc.data()!["startDate"],
        endDate = doc.data()!["endDate"],
        pricePeriod = doc.data()!["pricePeriod"],
        paymentAmount = doc.data()!["paymentAmount"],
        emailReminder = doc.data()!["emailReminder"],
        notificationReminder = doc.data()!["notificationReminder"],
        isNameValid = doc.data()!["isNameValid"],
        isStartDateValid = doc.data()!["isStartDateValid"],
        isEndDateValid = doc.data()!["isEndDateValid"],
        isFormValid = doc.data()!["isFormValid"],
        isFormValidateFailed = doc.data()!["isFormValidateFailed"];

  ContractModel copyWith({
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
    bool? emailReminder,
    bool? notificationReminder,
    final bool? isNameValid,
    final bool? isStartDateValid,
    final bool? isEndDateValid,
    final bool? isFormValid,
    final bool? isFormValidateFailed,
  }) {
    return ContractModel(
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
      isStartDateValid: isStartDateValid ?? this.isStartDateValid,
      isEndDateValid: isEndDateValid ?? this.isEndDateValid,
      isFormValid: isFormValid ?? this.isFormValid,
      isFormValidateFailed: isFormValidateFailed ?? this.isFormValidateFailed,
    );
  }  
}
