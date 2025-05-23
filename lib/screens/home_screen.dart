import 'package:flutter/material.dart';
import '../widgets/download_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Download Button"),
      ),
      body: const Center(
        child: DownloadButton(
          fileUrl:
              "https://freetestdata.com/wp-content/uploads/2021/09/Free_Test_Data_100KB_PDF.pdf",
        ),
      ),
    );
  }
}
