🕌 Namaz O Zikir
A Production-Ready Flutter Islamic Application
![Flutter](https://img.shields.io/badge/Flutter-3.x-blue)
![Platform](https://img.shields.io/badge/Platform-Android-green)
![License](https://img.shields.io/badge/Status-Active-success)


Namaz O Zikir is a fully completed and production-ready Flutter application designed to help Muslims access essential Surahs, Duas, Salat rules, and daily Adhkar in a clean and distraction-free interface.

The application has been fully tested in release mode, optimized for performance, and is completely ready for Play Store deployment.
📱 App Preview
<p align="center"> <img src="https://raw.githubusercontent.com/likhonahamedla/Namaz-O-Zikir/81e84a384f81df762b5ab1d3859f83c0d6f9f4aa/Yellow%20%26%20Orange%20Modern%20Marketing%20Courses%20YouTube%20Thumbnail.png" width="400"> </p> <p align="center"> <img src="https://raw.githubusercontent.com/likhonahamedla/Namaz-O-Zikir/81e84a384f81df762b5ab1d3859f83c0d6f9f4aa/Yellow%20%26%20Orange%20Modern%20Marketing%20Courses%20YouTube%20Thumbnail%20(1).png" width="400"> </p>

## 📲 Download APK

You can download and test the latest version of the app from GitHub Releases:

🔗 https://github.com/likhonahamedla/Namaz-O-Zikir/releases

> Download the `app-release.apk` file and install it on your Android device.

✨ Core Features

📖 Essential Surahs with Arabic text, pronunciation & translation

🤲 Categorized Post-Salat Adhkar

🔢 Persistent Digital Tasbih Counter

🧭 Qibla Direction using device compass integration

📚 Salat rules and structured guidance

🎨 Clean, modern UI with custom Islamic typography

📱 Fully responsive layout (ScreenUtil based scaling)

💾 Local state persistence using SharedPreferences

🛠️ Technical Stack

Flutter (Dart SDK  3.10.4)

Provider (State Management)

SharedPreferences

Flutter Compass

Permission Handler

Google Fonts

Custom Font Integration (Amiri, Hind Siliguri, Digital)

Google Nav Bar

## 🏗️ Architecture Overview

The project follows a modular, scalable, and maintainable structure:

lib/

├── app/ # App level configuration, theme, routing

├── data/ # Static data sources, constants, local data handling

├── models/ # Data models (Dua, Surah, Tasbih, etc.)

├── providers/ # State management using Provider

├── screens/ # UI screens (Presentation Layer)

├── widgets/ # Reusable UI components

├── utils/ # Helper functions, extensions, constants

├── extensions/ # Custom Dart extensions

└── main.dart # Application entry point


Clone the repository:

```bash
git clone https://github.com/likhonahamedla/Namaz-O-Zikir.git
cd Namaz-O-Zikir
flutter pub get
flutter run


📦 Release Build

The project has been fully tested in release mode.

To generate APK:

flutter build apk --release
