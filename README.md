# MindTheGap - The Modern CrowdSense project

MindTheGap is a real-time crowd sensing mobile app built using Flutter with Firebase and Open APIs (OpenStreetMap Overpass API).
It helps users identify crowded and overcrowded areas in real time, enabling smarter navigation and safer movement in public spaces.

✨ Features

📍 Passive Crowd Detection using Firebase background location updates.

🌍 Hybrid Detection Method V2: Combines Firebase passive data + Open APIs (OSM, Overpass API) for real-time insights.

📶 Optional Bluetooth & Wi-Fi scanning for enhanced local crowd density detection.

📊 Crowd density visualization in the app with simple, intuitive UI.

🔒 No billing, no credit card required – all tools & APIs are free and lightweight.

🛠️ Tech Stack

Frontend: Flutter (Mobile App, Native UI)

Backend: Firebase (Firestore, Authentication, Cloud Functions)

APIs: OpenStreetMap Overpass API, Google Places API (optional)

Other: Bluetooth & Wi-Fi signal scanning (for passive crowd estimation)

📌 Use Cases

Avoiding crowded public transport stations.

Checking mall/market density before visiting.

Navigating festivals, concerts, or events safely.

Universities/corporates can use it for campus crowd management.

🚀 Getting Started
Prerequisites

Flutter SDK (v2 or above)

Firebase account setup

API access to OpenStreetMap Overpass

Installation
# Clone the repository
git clone https://github.com/your-username/MindTheGap.git

# Navigate to project directory
cd MindTheGap

# Install dependencies
flutter pub get

# Run the app
flutter run

Firebase Setup

Create a Firebase project.

Add Android/iOS apps to the project.

Download google-services.json / GoogleService-Info.plist.

Place them in the respective android/app/ and ios/Runner/ directories.

📊 Architecture

Hybrid Crowd Detection Engine

Firebase → passive updates from users.

OSM Overpass API → real-time location metadata.

Optional Bluetooth scan → local density hints.

UI Layer → Simple, responsive Flutter UI for real-time updates.

🔮 Future Enhancements

🗺️ Heatmap visualization for crowd density.

🕒 Predictive crowd analytics (ML-based).

🌐 Multi-city rollout with offline fallback mode.

📡 Integration with IoT sensors for accuracy.

🤝 Contributing

Pull requests are welcome! For major changes, please open an issue first to discuss what you’d like to change.

📜 License

This project is licensed under the MIT License – see the LICENSE
 file for details.

🙌 Acknowledgements

OpenStreetMap for free & open geolocation APIs.

Firebase for backend services.

Inspiration: real-world need for smarter crowd management post-pandemic.
