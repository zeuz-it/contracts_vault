import 'package:blur/blur.dart';
import 'package:contracts_vault/features/components/checkbox_field.dart';
import 'package:contracts_vault/features/components/date_picker_field.dart';
import 'package:contracts_vault/features/components/dropdown_field.dart';
import 'package:contracts_vault/features/components/file_source_to_upload.dart';
import 'package:contracts_vault/features/components/form_label.dart';
import 'package:contracts_vault/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../generated/assets.dart';
import '../../../generated/l10n.dart';
import '../../components/entry_field.dart';
import '../../custom_scaffold/ui/custom_scaffold.dart';
import 'package:im_stepper/stepper.dart';
import 'package:intl/intl.dart';

class AddContractPage extends StatefulWidget {
  const AddContractPage({super.key});

  @override
  State<AddContractPage> createState() => _AddContractPageState();
}

class _AddContractPageState extends State<AddContractPage> {
  int currentStep = 0;

  final formKey = GlobalKey<FormState>();
  /* form doğrulama için kullanılan form nesnesi */

  final TextEditingController contractName = TextEditingController();
  final TextEditingController contractNumber = TextEditingController();
  final TextEditingController startDate = TextEditingController();
  final TextEditingController endDate = TextEditingController();

  final List<String> categories = [
    "kategori 1",
    "kategori 2",
    "kategori 3",
    "kategori 4",
  ];
  final List<String> person = [
    "kişi 1",
    "kişi 2",
    "kişi 3",
    "kişi 4",
  ];
  final List<String> company = [
    "şirket 1",
    "şirket 2",
    "şirket 3",
    "şirket 4",
  ];
  final List<String> contractType = [
    "tür 1",
    "tür 2",
    "tür 3",
    "tür 4",
  ];
  final List<String> pricePeriod = [
    "1 hafta",
    "1 ay",
    "3 ay",
    "6 ay",
    "1 sene",
  ];
  //TODO: Bu veriler firebase'den kullanıcıya ait olacak şekilde çekilecek.

  @override
  void dispose() {
    contractName.dispose();
    contractNumber.dispose();
    startDate.dispose();
    endDate.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    var s = S.of(context);
    return CustomScaffold.withBg2(
      child: Scaffold(
        appBar: AppBar(
          title: Text(s.addNewContract),
        ),
        body: Theme(
          data: ThemeData(
            textTheme: AppTheme.darkTheme.textTheme,
            canvasColor: Colors.transparent,
            colorScheme: Theme.of(context).colorScheme.copyWith(
                  primary: AppTheme.primaryColor,
                ),
          ),
          child: Form(
            child: Stepper(
              key: formKey,
              elevation: 0,
              steps: getSteps(),
              type: StepperType.horizontal,
              currentStep: currentStep,
              onStepContinue: () {
                final isLastStep = currentStep == getSteps().length - 1;
                if (isLastStep) {
                  debugPrint("Complete");
                  /* 
                    Server'a verileri gönderebilirsin.
                  */
                } else {
                  setState(() => currentStep += 1);
                }
              },
              onStepCancel: currentStep == 0
                  ? null
                  : () => setState(() => currentStep -= 1),
              // onStepTapped: (step) => setState(() => currentStep = step),
              onStepTapped: (step) {
                setState(() {
                  currentStep = step;
                });
              },
              controlsBuilder: (context, ControlsDetails controls) {
                return Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: currentStep != 0
                            ? ElevatedButton(
                                onPressed: controls.onStepCancel,
                                child: const Text("BACK"),
                              )
                            : const SizedBox(),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: controls.onStepContinue,
                          child: Text(
                            currentStep == getSteps().length - 1
                                ? "GÖNDER"
                                : "NEXT",
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  List<Step> getSteps() => [
        Step(
          state: currentStep > 0 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 0,
          title: const Text(''),
          content: SizedBox(
            height: MediaQuery.of(context).size.height * 0.65,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  EntryField(
                    controller: contractName,
                    label: S.of(context).contractName,
                    hint: S.of(context).contractName,
                    maxLines: 1,
                    color: Colors.white,
                    isTopElement: true,
                  ),
                  DropdownField(
                    isFirstElement: true,/* input altında formun ilk dropdown'u ise üstteki gereksiz boşluğu kaldır,*/ 
                    label: S.of(context).categories,
                    hint: S.of(context).categories,
                    color: Colors.white,
                    options: categories,
                  ),
                  DropdownField(
                    label: "Person",
                    hint: "Person",
                    color: Colors.white,
                    options: person,
                  ),
                  DropdownField(
                    label: "Company",
                    hint: "Company",
                    color: Colors.white,
                    options: company,
                  ),
                  DropdownField(
                    label: "ContractType",
                    hint: "ContractType",
                    color: Colors.white,
                    options: contractType,
                  ),
                  EntryField(
                    controller: contractNumber,
                    label: "Contract Number",
                    hint: "Contract Number",
                    maxLines: 1,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ),
        Step(
          state: currentStep > 1 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 1,
          title: const Text(''),
          content: SizedBox(
            height: MediaQuery.of(context).size.height * 0.65,
            child: Column(
              children: <Widget>[
                EntryField(
                  readOnly: true,
                  controller: startDate,
                  label: "start date",
                  hint: "start date",
                  maxLines: 1,
                  color: Colors.white,
                  onTap: () async {
                    DateTime? pickedDate = await datePicker(
                      "Select Contract Start Date",
                      "Cancel",
                      "OK",
                      DateTime.now(),
                      AppTheme.primaryColor,
                      AppTheme.primaryColor,
                    );

                    if (pickedDate != null) {
                      String formattedDate =
                          DateFormat('dd-MM-yyyy').format(pickedDate);
                      setState(() {
                        startDate.text = formattedDate;
                      });
                    } else {
                      print("Date is not selected");
                    }
                  },
                ),
                EntryField(
                  readOnly: true,
                  controller: endDate,
                  label: "end date",
                  hint: "end date",
                  maxLines: 1,
                  color: Colors.white,
                  onTap: () async {
                    DateTime? pickedDate = await datePicker(
                      "Select Contract End Date",
                      "Cancel",
                      "OK",
                      DateTime.now(),
                      AppTheme.primaryColor,
                      AppTheme.primaryColor,
                    );

                    if (pickedDate != null) {
                      String formattedDate =
                          DateFormat('dd-MM-yyyy').format(pickedDate);
                      setState(() {
                        endDate.text = formattedDate;
                      });
                    } else {
                      print("Date is not selected");
                    }
                  },
                ),
                DropdownField(
                  label: "Price Period",
                  hint: "price period",
                  options: pricePeriod,
                  color: Colors.white,
                ),
                const EntryField(
                  label: "Payment Amount",
                  hint: "payment amount",
                  maxLines: 1,
                  color: Colors.white,
                  keyboardTypeParam:
                      TextInputType.numberWithOptions(decimal: true),
                ),
                const SizedBox(height: 24),
                const FormLabel(label: "Reminder Options"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CheckboxField(
                      label: "EMail",
                    ),
                    const SizedBox(width: 50),
                    CheckboxField(
                      label: "Notification",
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Step(
          state: currentStep > 2 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 2,
          title: const Text(''),
          content: SizedBox(
            height: MediaQuery.of(context).size.height * 0.65,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  InkWell(
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.26,
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 0),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: AlignmentDirectional.topStart,
                          end: AlignmentDirectional.bottomEnd,
                          colors: [
                            Color(0xffA278DE),
                            Color(0xff484282),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          const Spacer(flex: 2),
                          Image.asset(Assets.imagesImgUpload, scale: 2),
                          const Spacer(flex: 2),
                          Text(S.of(context).uploadFile,
                              style: Theme.of(context).textTheme.titleLarge),
                          const Spacer(),
                          Text(
                            "Camera, JPEG, PNG, PDF",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    color: Theme.of(context).disabledColor),
                          ),
                          const Spacer(),
                        ],
                      ),
                    ),
                    onTap: () {
                      _showFileSourceToUploadSheet();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ];

  Future<DateTime?> datePicker(
    String helpText,
    String cancelText,
    String confirmText,
    DateTime initialDate,
    Color primaryColor,
    Color buttonsColor,
  ) {
    return showDatePicker(
      helpText: helpText,
      cancelText: cancelText,
      confirmText: confirmText,
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(
          2000), //DateTime.now() - not to allow to choose before today.
      lastDate: DateTime(2101),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: primaryColor,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: buttonsColor,
              ),
            ),
          ),
          child: child!,
        );
      },
    );
  }

  _showFileSourceToUploadSheet() {
    Future.delayed(
      const Duration(milliseconds: 100),
      () => showModalBottomSheet(
        context: context,
        builder: (context) => const FileSourceToUpload(),
      ),
    );
  }
}
