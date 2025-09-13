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
   git clone https://github.com/your-username/MindTheGap.git
   cd MindTheGap
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

<img width="603" height="712" alt="Screenshot 2025-09-13 133407" src="https://github.com/user-attachments/assets/30c85a64-8314-40fe-b903-c564bb406689" />

<img width="1898" height="916" alt="Screenshot 2025-09-13 133648" src="https://github.com/user-attachments/assets/7ec11849-84de-4a97-8227-74a2fedad299" />

<img width="749" height="913" alt="Screenshot 2025-08-13 215028" src="https://github.com/user-attachments/assets/6833de4a-1873-4454-9d56-efd9a5c0e215" />

<img width="1457" height="658" alt="Screenshot 2025-08-15 212302" src="https://github.com/user-attachments/assets/ead9f8ab-96ae-42b5-9ad7-00231eeefc52" />

<img width="1139" height="433" alt="Screenshot 2025-08-15 212330" src="https://github.com/user-attachments/assets/d93688e5-873f-4fc8-880e-89d38d8e3187" />


---

## 📊 Project Architecture
   flowchart TD
    A[User Device] -->|Location + Bluetooth/Wi-Fi Data| B[Firebase]
    B --> C[Hybrid Detection Logic]
    C -->|Crowd Density| D[Flutter UI]
    C --> E[OpenStreetMap API]
    D -->|Visualization| A

---

## 🤝 Contribution
Contributions are welcome!

Fork the repo

Create a feature branch

Commit your changes

Open a pull request 🚀


---

## ✨ Acknowledgments

OpenStreetMap for free geospatial data

Firebase for real-time database

Inspiration: making public spaces safer and smarter

