<div align="center">

# 📱 Sholar Chat

**تطبيق محادثات فوري مبني بـ Flutter و Firebase**  
*An instant messaging app built with Flutter & Firebase*

![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-%230175C2.svg?style=for-the-badge&logo=Dart&logoColor=white)
![Firebase](https://img.shields.io/badge/Firebase-%23FFCA28.svg?style=for-the-badge&logo=Firebase&logoColor=black)
![License](https://img.shields.io/badge/license-MIT-blue?style=for-the-badge)

</div>

---

## 📖 About The Project

**Sholar Chat** هو تطبيق محادثات فوري (Real-time Chat) يهدف إلى توفير تجربة تواصل سلسة وآمنة بين المستخدمين. يعتمد المشروع على **Flutter** لبناء واجهة مستخدم جميلة ومنسّقة تعمل على منصات متعددة، و **Firebase** لتوفير خدمات المصادقة (Authentication) وتخزين الرسائل في الوقت الفعلي (Cloud Firestore).

### 🎯 المشكلة والحل
- **المشكلة**: عدم وجود تطبيق محادثات بسيط وسريع يعمل على أنظمة متعددة مع تجربة مستخدم نظيفة.
- **الحل**: تطبيق خفيف وسريع مع واجهة مستخدم جذابة، ونظام مصادقة آمن، وتخزين فوري للرسائل.

### 👥 الجمهور المستهدف
- الأفراد الذين يبحثون عن تطبيق محادثات بسيط وآمن.
- المطورون الذين يتعلمون Flutter و Firebase ويريدون مشروعاً مرجعياً.

---

## ✨ Key Features

- ✅ **مصادقة آمنة** – تسجيل الدخول وإنشاء حساب باستخدام Firebase Authentication (Email/Password).
- 💬 **محادثات فورية** – إرسال واستقبال الرسائل في الوقت الفعلي عبر Cloud Firestore.
- 🎨 **واجهة مستخدم حديثة** – تصميم جذاب وسهل الاستخدام مع دعم الكيبورد والإيماءات.
- 📱 **دعم متعدد المنصات** – يعمل على Android، iOS، Web، و macOS.
- 🔒 **تصميم آمن** – استخدام Firebase لتأمين البيانات ومنع الوصول غير المصرح به.
- ⚡ **أداء عالي** – استخدام flutter_bloc لإدارة الحالة بكفاءة وتجنب إعادة البناء غير الضرورية.

---

## 🏗 Architecture & Tech Stack

### 🧱 المعمارية (Architecture)

يتبع المشروع نمط **Cubit (BLoC)** لإدارة الحالة مع فصل واضح بين الطبقات:

```
lib/
├── main.dart                # نقطة الدخول (Firebase init → MaterialApp)
├── firebase_options.dart    # إعدادات Firebase (مولّد آلياً)
├── consntant.dart           # الثوابت (الألوان، المسارات)
├── cubits/                  # طبقة إدارة الحالة (Cubits)
│   ├── cubit/               # ChatCubit
│   ├── login/               # LoginCubit
│   └── regester/            # RegesterCubit (قيد التطوير)
├── models/                  # طبقة النماذج (Models)
│   └── message.dart         # نموذج الرسالة
├── screens/                 # طبقة الواجهات (Screens)
│   ├── log_in.dart
│   ├── resgister_screen.dart
│   └── chat_screen.dart
├── widgets/                 # المكونات القابلة لإعادة الاستخدام
│   ├── buble_chat.dart
│   ├── ganaral_buttom.dart
│   └── text_field.dart
└── helper/                  # الدوال المساعدة
    └── helper_fun.dart
```

### 🛠 التقنيات المستخدمة (Tech Stack)

| التقنية | الاستخدام |
|---------|-----------|
| **Flutter** | إطار العمل الرئيسي لبناء الواجهة |
| **Dart** | لغة البرمجة |
| **Firebase Core** | تهيئة Firebase |
| **Firebase Auth** | مصادقة المستخدمين (Email & Password) |
| **Cloud Firestore** | قاعدة بيانات فورية للرسائل |
| **flutter_bloc** | إدارة الحالة (Cubit Pattern) |
| **modal_progress_hud_nsn** | مؤشر تحميل (Loading Indicator) |

### 📬 Firestore Schema

**Collection:** `Messages`

| Field | Type | Description |
|-------|------|-------------|
| `message` | `String` | محتوى الرسالة |
| `createAt` | `Timestamp` | وقت الإرسال |
| `id` | `String` | البريد الإلكتروني للمُرسل |

### 🗺 Routes

| Route Name | Screen | Description |
|------------|--------|-------------|
| `login Screen` | `LogInScreen` | شاشة تسجيل الدخول (الرئيسية) |
| `register` | `RegisterScreen` | شاشة إنشاء حساب |
| `chatScreen` | `ChatScreen` | شاشة المحادثة (تستقبل email) |

---

## 🚀 Getting Started

### Prerequisites

قبل البدء، تأكد من تثبيت:

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (>=3.4.3)
- [Dart SDK](https://dart.dev/get-dart) (>=3.4.3)
- [Firebase Project](https://console.firebase.google.com/) مع تفعيل **Authentication** و **Cloud Firestore**

### 📥 Installation

```bash
# 1. Clone the repository
git clone https://github.com/your-username/scholar-chat.git
cd scholar-chat

# 2. Install dependencies
flutter pub get

# 3. Configure Firebase
#    قم بإنشاء مشروع Firebase وإضافة ملف google-services.json (Android)
#    أو GoogleService-Info.plist (iOS) في المجلدات المناسبة.
#    راجع: https://firebase.flutter.dev/docs/overview

# 4. Run the app
flutter run
```

### ▶️ Run on specific platform

```bash
# Android
flutter run -d android

# iOS
flutter run -d ios

# Web
flutter run -d chrome

# macOS
flutter run -d macos
```

### 🧪 Run Tests

```bash
flutter test
```

### 🔍 Static Analysis

```bash
flutter analyze
```

### 🎨 Code Formatting

```bash
dart format .
```

---

## 📸 Screenshots / Demo

> * 🖼 **Login Screen** – شاشة تسجيل الدخول  
> * 🖼 **Register Screen** – شاشة إنشاء حساب  
> * 🖼 **Chat Screen** – شاشة المحادثة  

*(قم بإضافة صور التطبيق هنا بعد تشغيله — يُنصح باستخدام `screenshots/` داخل المستودع)*

---

## 🗺 Roadmap

- [x] مصادقة المستخدمين (Login / Register)
- [x] إرسال واستقبال الرسائل
- [ ] إضافة الوقت والتاريخ بجانب كل رسالة
- [ ] دعم إرسال الصور والملفات
- [ ] إشعارات (Push Notifications)
- [ ] مجموعات محادثة (Group Chats)
- [ ] دعم منصات Windows و Linux

---

## 🤝 Contributing

المساهمات مرحب بها دائماً! للمساهمة:

1. Fork المشروع
2. أنشئ فرعاً جديداً (`git checkout -b feature/YourFeature`)
3. أضف تغييراتك (`git commit -m 'Add YourFeature'`)
4. ادفع التغييرات (`git push origin feature/YourFeature`)
5. افتح Pull Request

---

## 📬 Contact & Support

- **البريد الإلكتروني**: your.email@example.com
- **LinkedIn**: [Your LinkedIn Profile](https://linkedin.com/in/your-profile)
- **GitHub**: [@your-username](https://github.com/your-username)

> إذا أعجبك المشروع، لا تنسى ⭐ **النجمة** على GitHub!

---

<div align="center">

**Built with ❤️ using Flutter & Firebase**

</div>
