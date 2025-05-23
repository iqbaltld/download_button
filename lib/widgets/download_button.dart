import 'package:dio/dio.dart';
import 'package:download_button/widgets/custom_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class DownloadButton extends StatefulWidget {
  const DownloadButton({super.key, required this.fileUrl});

  final String fileUrl;

  @override
  State<DownloadButton> createState() => _DownloadButtonState();
}

class _DownloadButtonState extends State<DownloadButton> {
  bool _isLoading = false;

  Future<void> downloadFile() async {
    if (!mounted) return;

    setState(() {
      _isLoading = true;
    });

    try {
      // Request storage permission
      var status = await Permission.storage.request();
      if (status.isGranted) {
        // Get temporary directory
        final dir = await getTemporaryDirectory();

        final fileName = path.basename(widget.fileUrl);
        final filePath = '${dir.path}/$fileName';

        // Download the file
        await Dio().download(widget.fileUrl, filePath,
            onReceiveProgress: (received, total) {
          // if (total != -1) {
          // setState(() {
          // Update UI with progress if needed
          // });
          // }
        });

        // Open the downloaded file
        try {
          await OpenFile.open(filePath);
        } catch (e) {
          print(e.toString());
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Failed to open file: ${e.toString()}'),
                backgroundColor: Colors.red,
              ),
            );
          }
        }
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Storage permission is required to download files'),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to download file: ${e.toString()}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          downloadFile();
        },
        child: Container(
            height: 45,
            width: 160,
            decoration: BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "DOWNLOAD",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
                const SizedBox(
                  width: 16,
                ),
                if (!_isLoading)
                  Image.asset(
                    "assets/images/pdf-white.png",
                    width: 16,
                    height: 16,
                  )
                else
                  const SizedBox(
                    width: 16,
                    height: 16,
                    child: CustomProgressIndicator(),
                  )
              ],
            )),
      ),
    );
  }
}
