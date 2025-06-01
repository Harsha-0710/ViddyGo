
🎬 ViddyGo

**ViddyGo** is a sleek and modern Flutter-based video streaming application focused on delivering an immersive and seamless video viewing experience across curated video categories. Designed for smooth performance on Android and iOS, ViddyGo integrates intuitive navigation, custom video player controls, and elegant animations to engage users effortlessly.

---

## 🚀 Features

- **Curated Video Categories:**  
  Browse expertly curated collections such as Featured, Trending, New Releases, Recommended, and Classics — each with randomized video listings for fresh discovery.

- **Custom Video Player:**  
  Built using `video_player` and `chewie`, enabling:  
  - Auto-play on detail page  
  - Full-screen toggle  
  - Playback speed control  
  - Mute/unmute  
  - Gesture-based play/pause  

- **Smooth Animations & Transitions:**  
  Engaging page animations, scale effects on video thumbnails, and custom buffering/loading animations to enhance user experience.

- **Responsive UI:**  
  Adaptive layouts optimized for different screen sizes, ensuring consistent usability on phones and tablets.

- **Efficient Resource Management:**  
  Lazy loading and proper disposal of video controllers prevent memory leaks and enhance app stability.

---


## 🛠️ Installation & Setup

### Prerequisites

- Flutter SDK (version >= 3.0 recommended)  
- Android Studio or VS Code with Flutter plugin  
- Device or emulator (Android/iOS)

### Steps

1. Clone the repo:

   ```bash
   git clone https://github.com/Harsha-0710/ViddyGo.git
   cd ViddyGo
   ```

2. Fetch dependencies:

   ```bash
   flutter pub get
   ```

3. Run the app:

   ```bash
   flutter run
   ```

---

## 🏗️ Project Structure

```
lib/
├── home_screen.dart          # Main app screen with categorized video carousels
├── detail_page.dart          # Video playback page with controls and description
├── see_all_page.dart         # Page to view full lists of videos by category
├── widgets/                  # Reusable UI components & custom animations
├── models/                   # Data models (if used)
assets/
├── videos/                   # Sample video files
├── thumbnails/               # Video thumbnail images
```

---

## 🔧 Dependencies

- [`video_player`](https://pub.dev/packages/video_player) — Core video playback functionality  
- [`chewie`](https://pub.dev/packages/chewie) — Enhanced video player UI controls  
- [`flutter/material.dart`](https://api.flutter.dev/flutter/material/material-library.html) — UI components and theming  

---

## 📈 Architecture & State Management

- Uses **StatefulWidgets** for managing UI state and video player controllers.  
- Manages page navigation with Flutter's `Navigator` and routes.  
- Handles video buffering/loading states with custom full-screen loading animation widget.  
- Video lists shuffled on each app start for randomized content discovery.

---


## 📬 Contact

**Harshavardhan**  
GitHub: [https://github.com/Harsha-0710](https://github.com/Harsha-0710)  
Email: *harshaoffcl@gmail.com*
Phone: *6374912165*

---

Thank you for exploring **ViddyGo**!  
Stay tuned for more features and updates.  
Enjoy seamless video streaming! 🎥✨
