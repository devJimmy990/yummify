# Yummify 🍽️

A modern and intuitive restaurant app with Firebase authentication, menu browsing, and cart management functionality.

<div align="center">
  <img src="https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white" alt="Flutter" />
  <img src="https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white" alt="Dart" />
  <img src="https://img.shields.io/badge/Firebase-FFCA28?style=for-the-badge&logo=firebase&logoColor=black" alt="Firebase" />
</div>

## 📱 Overview

**Yummify** is a feature-rich mobile restaurant application built with **Flutter** and powered by **Firebase**. It provides a seamless dining experience allowing users to authenticate, browse menus, manage their cart, and place orders with an elegant and responsive UI.

This project demonstrates modern mobile development practices with clean architecture, efficient state management, and a user-centric design approach.

---

## ✨ Features

### 🔐 Authentication
- **Secure Login System**
  - Email and password authentication
  - Firebase Authentication integration
  - Form validation with real-time feedback
  - Guest browsing mode

### 🍽️ Menu Management
- **Dynamic Menu Display**
  - Real-time menu updates from Firebase
  - Category-based filtering
  - Search functionality
  - High-quality food images
  - Detailed item descriptions
  - Pricing and availability status
  - Nutritional information
  - Special dietary tags (vegan, gluten-free, etc.)

### 🛒 Cart & Orders
- **Smart Cart System**
  - Add/remove items with quantity control
  - Apply promo codes
  - Order notes and special instructions
  - Save cart for later
  - Order history tracking

### 🎨 User Experience
  - Multi-language support (English & Arabic)
  - Light and dark theme modes

### 📱 Additional Features
- Push notifications for order updates
- Favorites/wishlist functionality
- Internet connectivity

---

## 🚀 Tech Stack

- **Frontend**
  - Dart 3.7.2
  - Flutter 3.29.3
  
- **State Management**
  - Cubit / HydratedCubit for persistent state
  
- **Backend & Services**
  - Cloud Firestore
  - Firebase Storage
  - Firebase Authentication
  - Firebase Cloud Messaging
  
- **Architecture**
  - Repository pattern
  - Dependency injection
  - Clean Architecture principles
  

---

<!-- ## 📸 Screenshots

<div align="center">
  <table>
    <tr>
      <td align="center">
        <img src="screenshots/login.png" width="200" alt="Login Screen"/>
        <br />
        <em>Login Screen</em>
      </td>
      <td align="center">
        <img src="screenshots/menu.png" width="200" alt="Menu Screen"/>
        <br />
        <em>Menu Browse</em>
      </td>
      <td align="center">
        <img src="screenshots/cart.png" width="200" alt="Cart Screen"/>
        <br />
        <em>Shopping Cart</em>
      </td>
    </tr>
  </table>
</div> -->
---

## 🔧 Installation & Setup

### Prerequisites
- Firebase CLI
- Flutter SDK (3.29.3)
- Android Studio / VS Code with Flutter extensions

### Setup Instructions

1. **Clone the repository**
   ```bash
   git clone https://github.com/your-username/yummify.git
   cd yummify
   ```

2. **Install dependencies**
   
   Using FVM (recommended):
   ```bash
   fvm flutter pub get
   ```
   
   Without FVM:
   ```bash
   flutter pub get
   ```
---

## 📁 Project Structure

```
yummify/
├── lib/
│   ├── core/
│   │   ├── constants/
│   │   ├── theme/
│   │   ├── utils/
│   │   └── widgets/
│   ├── features/
│   │   ├── auth/
│   │   │   ├── data/
│   │   │   ├── domain/
│   │   │   └── presentation/
│   │   ├── menu/
│   │   │   ├── data/
│   │   │   ├── domain/
│   │   │   └── presentation/
│   │   └── cart/
│   │       ├── data/
│   │       ├── domain/
│   │       └── presentation/
│   ├── l10n/
│   └── main.dart
├── assets/
│   ├── images/
│   ├── fonts/
│   └── translations/
├── test/
├── pubspec.yaml
└── README.md
```

---


## 📞 Contact

For questions or support:
- Portfolio: [devjimmy](https://devjimmy.vercel.app/)
- LinkedIn: [Mogamaal](https://www.linkedin.com/in/mogamaal)
- Github: [devJimmy990](https://github.com/devJimmy990)
- Email: muhammedgamal997@gmail.com

---

<div align="center">
  © 2025 Yummify. All rights reserved.
</div>
