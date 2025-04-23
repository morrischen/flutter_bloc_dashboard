# Flutter Bloc Dashboard

`flutter_bloc_dashboard` 是一個基於 Flutter 和 Bloc 狀態管理的應用程式範例，展示如何使用 Flutter 建構具有多語系支援、狀態管理和動態 UI 的應用程式。

---

## 功能特點

- **多語系支援**：支援繁體中文、簡體中文和英文，並可動態切換語言。
- **狀態管理**：使用 `flutter_bloc` 管理應用程式的狀態，實現清晰的邏輯分離。
- **動態主題**：支援淺色與深色模式，並可根據系統設定自動切換。
- **清潔狀態篩選與排序**：提供篩選與排序功能，方便用戶管理清潔任務。
- **模組化設計**：專案結構清晰，易於擴展和維護。

---

## 專案結構

```
.
├── bottom_navi_bar
│   └── app_bottom_navi_bar.dart
├── extension
│   └── ext_build_context.dart
├── home
│   ├── cubit
│   │   ├── home_cubit.dart
│   │   └── home_state.dart
│   ├── home_screen.dart
│   ├── hotel_task_card.dart
│   └── tag_button.dart
├── l10n
│   ├── app_en.arb
│   ├── app_zh.arb
│   └── app_zh_TW.arb
├── languages
│   └── language_screen.dart
├── main.dart
├── models
│   ├── app_theme.dart
│   ├── enum_set.dart
│   ├── hotel_task.dart
│   ├── language.dart
│   └── system_theme.dart
├── router.dart
├── settings
│   ├── cubit
│   │   ├── settings_cubit.dart
│   │   └── settings_state.dart
│   ├── profile_view.dart
│   ├── setting_item.dart
│   └── settings_page.dart
└── widgets
    ├── app_colors.dart
    ├── app_spacing.dart
    └── picker
        └── bottom_sheet_picker.dart
```

## 使用技術

- **Flutter**：跨平台 UI 框架。
- **flutter_bloc**：狀態管理解決方案。
- **hydrated_bloc**：持久化狀態管理。
- **mocktail**：單元測試的模擬工具。
- **多語系支援**：使用 `.arb` 檔案進行本地化。

---

## 使用方法

### 1. 環境需求

- Flutter SDK 版本：`>=3.29.0`
- Dart SDK 版本：`>=3.7.0`

### 2. 安裝依賴

```
flutter pub get
```

### 3. 執行應用程式

```
flutter run
```

## 各頁面功能說明

### 1. 主畫面
- 顯示清潔任務列表，包含飯店名稱、清潔狀態和進度。
- 支援篩選功能，根據清潔狀態（待清潔、清潔中、已完成）篩選任務。
- 提供排序功能，按清潔狀態、飯店名稱或進度進行升序或降序排序。

### 2. 設定頁面
- 支援繁體中文、簡體中文和英文，切換語言時，應用程式會即時更新顯示語言。
- 支援淺色與深色模式，可根據系統設定自動切換主題，或在設定頁面中手動選擇主題。
- 提供用戶個人資訊檢視功能。
