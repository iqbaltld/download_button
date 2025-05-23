# Flutter Custom Download Button

A Flutter implementation of a custom download button with progress indicator and automatic file opening after download completion.

## Features

- Customizable download button with progress indicator
- Automatic file opening after download completion
- Smooth progress animation
- Error handling with retry functionality
- Platform-specific file handling (Android/iOS)

## Getting Started

This project demonstrates how to implement a custom download button in Flutter applications that:
1. Shows download progress
2. Opens the downloaded file automatically
3. Handles errors gracefully

## Usage

1. Add the necessary permissions to your AndroidManifest.xml:
```xml
<uses-permission android:name="android.permission.INTERNET"/>
<uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
```

2. Use the DownloadButton widget in your Flutter app:
```dart
DownloadButton(
  url: 'your-download-url',
  fileName: 'downloaded_file.pdf',
  onDownloadComplete: () {
    // Handle download completion
  },
  onError: (error) {
    // Handle download error
  },
)
```

## Project Structure

- `lib/widgets/download_button.dart`: Main download button widget implementation
- `lib/widgets/custom_progress_indicator.dart`: Custom progress indicator widget
- `lib/screens/home_screen.dart`: Example implementation screen
- `lib/main.dart`: Main application entry point

## Dependencies

This project uses the following key dependencies:
- `dio`: For handling HTTP downloads
- `permission_handler`: For managing storage permissions
- `open_file`: For opening downloaded files

## Running the Example

1. Clone this repository
2. Run `flutter pub get` to install dependencies
3. Run the app using `flutter run`

## 📣 Author

**Muhammed Iqbal** – [LinkedIn](https://linkedin.com/in/iqbaltld)
