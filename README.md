# MindTheGap 🚦📱  

**MindTheGap** is a real-time crowd sensing mobile application designed to identify crowded or overcrowded areas using **passive location tracking, Bluetooth/Wi-Fi scanning, and open APIs**. The goal is to help users make safer and smarter movement decisions in urban spaces by avoiding overcrowded zones.  

---

## 📌 Features  
- **Real-Time Crowd Detection**: Combines Firebase passive updates, OpenStreetMap APIs, and optional Bluetooth scanning.  
- **Hybrid Detection Method (V2)**: Integrates multiple data sources for accurate crowd density estimation.  
- **Background Location Tracking**: Captures user location seamlessly.  
- **Cross-Platform Support**: Built with Flutter for Android/iOS.  
- **Privacy Aware**: No personal identification stored, only anonymized crowd density.  

---

## 🛠️ Tech Stack  
- **Frontend**: Flutter  
- **Backend & Database**: Firebase  
- **APIs**: OpenStreetMap (Overpass API), Google Places (optional fallback)  
- **Languages**: Dart  
- **Other Tools**: Bluetooth & Wi-Fi scanning (for passive crowd estimation)  

---

## ⚙️ Installation & Setup  

1. Clone the repository:  
   ```bash
2. Install Dependencies  :
   flutter pub get
3. Run : 
   flutter run

---

## 🚀 Usage

Allow location access for passive tracking.

The app continuously senses crowd levels around you.

Visual indicators show whether an area is Free, Crowded, or Overcrowded.

Data is shared anonymously with Firebase for real-time crowd density updates.

   git clone https://github.com/your-username/MindTheGap.git
   cd MindTheGap


---

## 📷 Screenshots 

<img width="517" height="174" alt="Screenshot 2025-08-01 174924" src="https://github.com/user-attachments/assets/37c25f88-faae-4ebd-9af2-b6778ac30748" />

