<div align="center">

# Sholar Chat

**Real‑time instant messaging, reimagined — cross‑platform, secure, and built for scale.**  
*A production‑ready Flutter application powered by Firebase and the Cubit state‑management pattern.*

![Flutter](https://img.shields.io/badge/Flutter-3.4+-02569B.svg?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-3.4+-0175C2.svg?style=for-the-badge&logo=dart&logoColor=white)
![Firebase](https://img.shields.io/badge/Firebase-FFCA28.svg?style=for-the-badge&logo=firebase&logoColor=black)
![BLoC](https://img.shields.io/badge/State-Cubit-593D88.svg?style=for-the-badge&logo=bloc&logoColor=white)
![License](https://img.shields.io/badge/License-MIT-blue.svg?style=for-the-badge)

<img src="assets/images/scholar.png" alt="Sholar Chat Banner" width="200"/>

</div>

---

## Table of Contents

- [About The Project](#about-the-project)
- [Tech Stack & Core Ecosystem](#tech-stack--core-ecosystem)
- [Key Architecture](#key-architecture)
- [Key Features](#key-features)
- [Getting Started & Local Setup](#getting-started--local-setup)
- [Screenshots & UI Showcase](#screenshots--ui-showcase)
- [Roadmap](#roadmap)
- [Contact & Licensing](#contact--licensing)

---

## About The Project

**Sholar Chat** is a real‑time instant messaging application that delivers a seamless, secure, and cross‑platform communication experience. Built entirely with Flutter and backed by Firebase, it handles authentication, message persistence, and live synchronisation out of the box.

### The Problem

Most chat applications are either too heavy, platform‑locked, or closed‑source. Developers looking for a clean, well‑architected reference implementation — and end‑users wanting a lightweight, privacy‑conscious messenger — lack a modern, open alternative.

### The Solution

Sholar Chat fills that gap. The app uses **Firebase Authentication** (email/password) for secure sign‑up and login, and **Cloud Firestore** for real‑time message synchronisation across devices. Its state layer, built on the **Cubit (BLoC)** pattern, keeps the UI reactive and the business logic testable, making it an ideal foundation for teams who want to extend or productionise a chat product.

### Target Audience

- **End‑users** who need a fast, no‑frills messenger.
- **Flutter developers** learning Firebase integration and state management.
- **Open‑source contributors** looking for a well‑structured starting point.

---

## Tech Stack & Core Ecosystem

| Technology | Role in the Project |
|------------|---------------------|
| **Flutter** 3.4+ | Cross‑platform UI framework — single codebase for Android, iOS, Web, and macOS |
| **Dart** 3.4+ | Strongly‑typed language with sound null safety |
| **Firebase Core** | App initialisation and platform‑specific Firebase configuration |
| **Firebase Auth** | Email/password authentication — secure user registration and login |
| **Cloud Firestore** | NoSQL document database — stores and syncs messages in real time |
| **flutter_bloc** 8.x | State management via the Cubit pattern — isolates business logic from UI |
| **modal_progress_hud_nsn** | Reusable loading overlay during async operations |

---

## Key Architecture

The project follows a **layered architecture** with **Cubit (BLoC)** as the state‑management backbone. Each layer has a single responsibility, which makes the codebase easy to test, extend, and navigate.

```
┌─────────────────────────────────────────────┐
│           Presentation Layer                │
│   (lib/screens/ ─ lib/widgets/)            │
│   Stateless/Stateful widgets observing      │
│   Cubit states via BlocConsumer / BlocBuilder│
└──────────────────────┬──────────────────────┘
                       │ emit() / listen()
┌──────────────────────▼──────────────────────┐
│            State Layer (Cubits)             │
│   (lib/cubits/)                             │
│   LoginCubit  ─  ChatCubit  ─  RegesterStub │
│   Pure Dart business logic, no UI imports   │
└──────────────────────┬──────────────────────┘
                       │ Firebase SDK calls
┌──────────────────────▼──────────────────────┐
│          Data / Service Layer               │
│   Firebase Auth  ─  Cloud Firestore         │
│   Remote source of truth, real-time streams │
└─────────────────────────────────────────────┘
```

### Directory Structure

```
lib/
├── main.dart                  # Entrypoint: Firebase init → MultiBlocProvider → MaterialApp
├── firebase_options.dart      # Auto‑generated FlutterFire CLI config
├── consntant.dart             # App‑wide constants (colours, asset paths, Firestore keys)
├── cubits/                    # State management (Cubits)
│   ├── cubit/                 # ChatCubit — message send/receive logic
│   ├── login/                 # LoginCubit — authentication state
│   └── regester/              # RegesterCubit — stub (registration handled inline)
├── models/                    # Data models
│   └── message.dart           # Messages class with Firestore fromJson factory
├── screens/                   # Route screens
│   ├── log_in.dart            # Login screen (initial route)
│   ├── resgister_screen.dart  # Registration screen
│   └── chat_screen.dart       # Chat screen (receives email via route args)
├── widgets/                   # Reusable UI components
│   ├── buble_chat.dart        # ChatBuble & ChatBubleForFriend
│   ├── ganaral_buttom.dart    # CustomButton
│   └── text_field.dart        # CoustomTextField
└── helper/                    # Utility functions
    └── helper_fun.dart        # Helper (e.g. SnackBar)
```

### Firestore Schema

| Collection | Field | Type | Purpose |
|------------|-------|------|---------|
| `Messages` | `message` | `String` | Message body |
| `Messages` | `createAt` | `Timestamp` | Server timestamp |
| `Messages` | `id` | `String` | Sender's email |

### Route Table

| Route Key | Screen Widget | Description |
|-----------|---------------|-------------|
| `'login Screen'` | `LogInScreen` | Login — entry point |
| `'register'` | `RegisterScreen` | New user registration |
| `'chatScreen'` | `ChatScreen` | Real‑time chat (receives email) |

---

## Key Features

### 🔐 Authentication & Security
- **Firebase email/password authentication** — secure sign‑up and login.
- **Error‑handled auth flows** — user‑friendly Firebase exception messages (weak password, duplicate email, invalid credentials).

### 💬 Real‑Time Messaging
- **Cloud Firestore live sync** — messages appear instantly across all connected clients.
- **Ordered message stream** — Firestore `orderBy(createAt, descending: true)` with a `ListView.builder(reverse: true)` for natural chat UX.
- **Auto‑scroll** — smooth scroll‑to‑bottom on new message submission.

### 🧠 State Management (Cubit)
- **Isolated business logic** — each Cubit encapsulates a single domain (auth, chat).
- **Reactive UI** — `BlocConsumer` and `BlocProvider` minimise unnecessary rebuilds.
- **Testable** — Cubits are pure Dart classes with no UI dependency.

### 🎨 UX & Design
- **Modern Material UI** — consistent purple colour palette, rounded chat bubbles, themed inputs.
- **Platform‑adaptive** — runs on Android, iOS, Web, and macOS from a single codebase.
- **Loading indicators** — modal progress HUD during all async operations.

---

## Getting Started & Local Setup

### Prerequisites

| Dependency | Minimum Version | Installation |
|------------|----------------|--------------|
| Flutter SDK | 3.4.3 | [Install Flutter](https://docs.flutter.dev/get-started/install) |
| Dart SDK (bundled) | 3.4.3 | Ships with Flutter SDK |
| Firebase Project | — | [Firebase Console](https://console.firebase.google.com/) — enable **Authentication** (Email/Password) and **Cloud Firestore** |
| Android Studio / Xcode | — | For Android / iOS builds respectively |

### Installation

```bash
# 1. Clone the repository
git clone https://github.com/your-username/scholar-chat.git
cd scholar-chat

# 2. Fetch dependencies
flutter pub get

# 3. Configure Firebase
#    Place google-services.json  → android/app/
#    Place GoogleService-Info.plist → ios/Runner/
#    (The FlutterFire CLI-generated firebase_options.dart is already present.)
#    See: https://firebase.flutter.dev/docs/overview

# 4. Run the application
flutter run
```

### Platform‑specific Commands

```bash
flutter run -d android        # Android emulator / device
flutter run -d ios            # iOS simulator (macOS only)
flutter run -d chrome         # Web (Chrome)
flutter run -d macos          # macOS desktop
```

### Verification Commands

```bash
flutter test                  # Run test suite
flutter analyze               # Static analysis & linting
dart format .                 # Format all Dart sources
```

---

## Screenshots & UI Showcase

| Login Screen | Registration Screen | Chat Screen |
|:------------:|:-------------------:|:-----------:|
| *(screenshot)* | *(screenshot)* | *(screenshot)* |
| Secure email/password login | New user sign‑up flow | Real‑time messaging |

> **Tip:** Place screenshots in a `screenshots/` directory and reference them with standard Markdown image syntax:  
> `![Login](screenshots/login.png)`

---

## Roadmap

- [x] Firebase Authentication (Login / Register)
- [x] Real‑time Firestore messaging
- [ ] Timestamps on each message
- [ ] Image & file attachment support
- [ ] Push notifications (FCM)
- [ ] Group chat rooms
- [ ] Windows & Linux platform support

---

## Contact & Licensing

**Sholar Chat** is released under the **MIT License**. You are free to use, modify, and distribute it — see the `LICENSE` file for details.

| Channel | Contact |
|---------|---------|
| **GitHub** | [@your-username](https://github.com/your-username) |
| **Email** | your.email@example.com |
| **LinkedIn** | [Your LinkedIn Profile](https://linkedin.com/in/your-profile) |

---

<div align="center">

**Built with ❤️ using Flutter, Dart, and Firebase**

If you find this project useful, please ⭐ **star** the repository — it helps others discover it.

</div>
