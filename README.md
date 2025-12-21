# 🍔 Lunch Machine

Lunch Machine is a simple iOS application built with **SwiftUI** that helps users discover nearby restaurants based on their current location.

This project is designed as a **portfolio project for a Junior iOS Developer**, focusing on clean architecture, state handling, and real-world app flows such as permissions, loading, and empty states.

---

## 🚀 Features

- Request and handle location permission
- Fetch nearby restaurants using a public API
- Display restaurant list with pagination (“Show more”)
- Loading, empty, and error states
- Pull-to-refresh via toolbar action
- Custom Launch Screen & App Icon

---

## 🛠 Tech Stack

- **SwiftUI**
- **Async/Await**
- **CoreLocation**
- **MV-style separation (Views / Models / Services)**
- **SwiftLint** (code style & consistency)

## ▶️ How to Run

1. Clone the repo:
```bash
git clone https://github.com/KhanhNBL/Lunch-Machine.git
cd Lunch-Machine
```
## 📸 Screenshots

<p float="left">
  <img src="Screenshots/empty-state.png" width="260" />
  <img src="Screenshots/list.png" width="260" />
</p>

## 📍 Simulator Location (Important)

The API used in this project only returns data in supported regions.

If no restaurants appear, please set the Simulator location to:

Simulator → Features → Location → Custom Location

Latitude: 60.1699

Longitude: 24.9384
(Helsinki)

## 🗂 Project Structure

-Views/ – SwiftUI screens and UI components

-Models/ – Codable API response models (WoltResults)

-Services/ – Networking, repository, and location manager

-Extensions/ – Helper extensions and data mapping logic

## ⚠️ Known Limitations

-Restaurant availability depends on API coverage and simulators location

-No restaurant detail screen (kept intentionally simple)

-No offline caching

## 👤 Author

Khanh Nguyen
GitHub: https://github.com/KhanhNBL
