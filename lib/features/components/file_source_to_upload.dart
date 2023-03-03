import 'package:blur/blur.dart';
import 'package:contracts_vault/features/media.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/../../../app_config/app_config.dart';
import '/../../../features/custom_scaffold/ui/custom_scaffold.dart';
import '/../../../features/language/bloc/language_cubit.dart';
import '/../../../generated/l10n.dart';

class FileSourceToUpload extends StatefulWidget {
  const FileSourceToUpload({Key? key}) : super(key: key);

  @override
  _FileSourceToUploadState createState() => _FileSourceToUploadState();
}

class _FileSourceToUploadState extends State<FileSourceToUpload> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.30,
      child: CustomScaffold(
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Select Data Source"),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                  child: Container(
                    decoration: BoxDecoration(
                      color: theme.primaryColorLight.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: const [
                          Icon(
                            Icons.photo_camera,
                            size: 30,
                            color: Colors.white,
                          ),
                          SizedBox(width: 20),
                          Text(
                            "Camera",
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    debugPrint("Cihazın kamerasını aç");
                    //TODO: Cihazın kamerasını aç
                  },
                ),
                InkWell(
                  child: Container(
                    decoration: BoxDecoration(
                      color: theme.primaryColorLight.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: const [
                          Icon(
                            Icons.sd_storage_rounded,
                            size: 30,
                            color: Colors.white,
                          ),
                          SizedBox(width: 20),
                          Text(
                            "Storage",
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    debugPrint("Cihazın Dosya sistemini aç");
                    //TODO: Cihazın Dosya sistemini aç
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
