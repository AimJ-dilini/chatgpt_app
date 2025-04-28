
# ChatGPT Flutter App

This is a simple ChatGPT app built using Flutter.  
It connects to a custom backend server that interacts with the OpenAI API to generate AI responses.

---

## ✨ Features

- Send and receive messages in a chat interface
- Connects with OpenAI's ChatGPT model via a backend server
- Clean and responsive UI
- Works on real Android devices

---

## ⚙️ Technologies Used

| Technology | Purpose |
|:-----------|:--------|
| **Node.js** | JavaScript runtime used to build the backend server |
| **Express.js** | Node.js framework to easily create API endpoints |
| **OpenAI API** | Used to generate AI responses (chatbot replies) |
| **Flutter** | Used to build the mobile app (frontend) |
| **Flutter HTTP package** | Used to make HTTP requests from the app to the backend server |
| **Dart** | Programming language for Flutter apps |
| **Real Device Testing** | App is tested and works on real Android devices |

---

## 🚀 How It Works

This Flutter app does **NOT** directly connect to OpenAI.  
Instead, it sends user messages to a **custom backend server** (Node.js + Express),  
and the backend securely communicates with OpenAI's API.

✅ This keeps the OpenAI API key **private** and **safe**.

---

## 📋 How to Use

1. **Clone this repo**
   ```bash
   git clone https://github.com/your-username/chatgpt_app.git
   cd chatgpt_app
   ```

2. **Setup your own backend**
   - You must create your own backend server.
   - The backend server will:
     - Receive user messages
     - Forward them to OpenAI
     - Send OpenAI's replies back to the app
   - *(The backend project is private for security reasons and not included here.)*

3. **Update backend URL**
   - Open the Flutter project.
   - In the `sendMessage()` method (inside the app), update the server URL to match your backend server's address.

4. **Run the Flutter app**
   ```bash
   flutter pub get
   flutter run
   ```

---

## 📢 Important Notes

- Without a backend server, this app **will not** receive any AI responses.
- You must create and connect your own backend server (using Node.js + Express) to fully use the app.
- Keep your OpenAI API key **safe** — never add it to the Flutter app code.
- The backend server project for this is private repository

---

[AimJ-dilini](https://github.com/AimJ-dilini)

✨
