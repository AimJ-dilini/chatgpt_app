
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
   git clone https://github.com/AimJ-dilini/chatgpt_app.git
   cd chatgpt_app
   ```

2. **Setup your own backend**
   - The backend server project for this app is hosted in a private repository.
   - You must create your own backend server.
   - The backend server will:
     - Receive user messages
     - Forward them to OpenAI
     - Send OpenAI's replies back to the app 

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
- *(The backend server for this app is hosted in a private repository.)*

---

## OpenAI Backend Server Project - How It Works 📋

1. The Flutter app (`chatgpt_app`) sends a POST request to this server at `/chat`.
2. The server forwards the message to the OpenAI API using the API key.
3. The OpenAI API returns a response.
4. The server sends this response back to the Flutter app.

---

## OpenAI Backend Server Project - Technologies Used ⚙️

| Technology | Purpose |
|:-----------|:--------|
| **Node.js** | Backend runtime environment |
| **Express.js** | Server framework to handle HTTP requests |
| **Axios** | HTTP client to send requests to OpenAI API |
| **OpenAI API** | Generates AI responses based on user input |

---

[AimJ-dilini](https://github.com/AimJ-dilini)

✨
