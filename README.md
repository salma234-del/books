# 📚 Books Browser

A Flutter application that allows users to browse and search books from the [Project Gutenberg](https://www.gutenberg.org/) library using the [Gutendex API](https://gutendex.com/).


## 🎬 Demo

You can watch the app demo [here](https://drive.google.com/file/d/1XoCZEhg21woi9rafQzih-j1sUnCNAOyY/view?usp=drivesdk).

---

## 🚀 Getting Started

### 1. Clone the Repository

```bash
git clone https://github.com/salma234-del/books
cd books
```

### 2. Install Dependencies

```bash
flutter pub get
```

### 3. Run the Application

```bash
flutter run
```

---

## 🛠️ Architecture & Tech Stack

- **Clean Architecture**: Organized into core, data, domain, and presentation layers.
- **State Management**: Built using `Cubit` (`flutter_bloc` package).
- **Dependency Injection**: Implemented using `get_it`.
- **Network Layer**: Handled using `dio` and functional programming with `dartz`.
- **Caching**: Offline support with `SharedPreferences` and image caching with `cached_network_image`.
- **Pagination**: Infinite scroll functionality for book browsing.
- **Responsive UI**: Built with `flutter_screenutil` for different screen sizes.
- **Skeleton Loading**: Enhanced UX using `skeletonizer` package.

---

## ✨ Features

- 🔍 Search for books by title.
- 📚 View the list of books.
- 📜 Expand/Collapse long descriptions using Read More/Less.
- 🖼️ Load and cache book cover images.
- ♻️ Infinite scrolling with automatic pagination.
- ⚡ Offline caching of book list for better performance.
- 🎨 Customized typography with Google Fonts.
- 📱 Responsive design for mobile and tablet screens.
- 🚫 Robust error handling for network and API errors.

---

## 📦 Packages Used

| Package                  | Purpose                                            |
| ------------------------- | ------------------------------------------------- |
| `dio`                     | HTTP client for API requests                      |
| `equatable`               | Simplify object equality comparison               |
| `get_it`                  | Dependency injection                              |
| `dartz`                   | Functional programming tools (Either)             |
| `flutter_screenutil`      | Responsive and adaptive UI design                 |
| `cached_network_image`    | Network image caching                             |
| `readmore`                | Expandable and collapsible text widgets           |
| `google_fonts`            | Google Fonts integration                          |
| `skeletonizer`            | Skeleton loaders for a better loading experience  |
| `shared_preferences`      | Local data caching for offline access             |

---

## 📚 API Reference

- **Base URL**: `https://gutendex.com/books`
- **Authentication**: No authentication required.
- **Pagination**: Controlled via `next` and `previous` fields in the API response.

---

## 📝 Implementation Notes

- Books are fetched page by page using infinite scroll.
- Search functionality replaces the book list with search results.
- Cached data is used when offline, providing a fallback experience.
- Book descriptions are neatly expandable using the `readmore` widget.
- Skeleton loading animations improve user experience while data loads.
- All layers follow SOLID principles for maintainability and scalability.

---

## 📂 Folder Structure (Simplified)

```plaintext
lib/
│
├── core/
│
├── data/
│   ├── datasources/
│   ├── models/
│   └── repositories/
│
├── domain/
│   ├── entities/
│   ├── repositories/
│   └── usecases/
│
├── presentation/
│   ├── cubits/
│   ├── screens/
│   └── widgets/
│
└── main.dart
```
