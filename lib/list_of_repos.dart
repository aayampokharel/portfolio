import 'package:flutter/material.dart';
import 'package:port/repos_model.dart';
import 'package:flutter/material.dart';
import 'dart:io';

Map<String, Map<String, dynamic>> reposMap = {
  "Live Chat App": {
    "description":
        "Developed a real-time chat application allowing multiple users to engage in private and group chats. The backend, built with Go, efficiently handles WebSocket connections for live message updates. MySQL is integrated to store and retrieve chat histories, ensuring seamless communication and access to past conversations.",
    "technologiesUsed": ["Flutter", "Dart", "Go", "MySql"],
    "githubLink": "https://github.com/aayampokharel/messenger",
    "imgURL": "Photos/zanpakto.png"
  },
  "Librarian App": {
    "description":
        "Developed an app for librarians to manage overdue book fines. It allows librarians to input book details, calculate overdue fines, and track them efficiently. The app features a user-friendly interface for searching books and calculating fines, while MySQL handles book storage and fine management.",
    "technologiesUsed": ["Flutter", "Dart", "Go", "MySql"],
    "githubLink": "https://github.com/aayampokharel/librarian_app",
    "imgURL": "Photos/zanpakto.png"
  },
  "Gartic Clone": {
    "description":
        "Created an interactive online multiplayer drawing and guessing game where players take turns drawing prompts while others guess the drawings. Real-time communication is handled through WebSockets, ensuring synchronized gameplay, with features like a countdown timer and random prompts to enhance the fun.",
    "technologiesUsed": ["Flutter", "Dart", "Go", "WebSockets"],
    "githubLink": "https://github.com/aayampokharel/gartic-clone",
    "imgURL": "Photos/zanpakto.png"
  }
};

List<ReposModel> reposModelList = [
  ReposModel(
      topic: "Gartic Clone",
      description: reposMap["Gartic Clone"]!["description"],
      technologiesUsed: reposMap["Gartic Clone"]!["technologiesUsed"],
      githubLink: reposMap["Gartic Clone"]!["githubLink"],
      imgURL: reposMap["Gartic Clone"]!["imgURL"]),
  ReposModel(
      topic: "Live Chat App",
      description: reposMap["Live Chat App"]!["description"]!,
      technologiesUsed: reposMap["Live Chat App"]!["technologiesUsed"],
      githubLink: reposMap["Live Chat App"]!["githubLink"],
      imgURL: reposMap["Live Chat App"]!["imgURL"]),
  ReposModel(
      topic: "Librarian App",
      description: reposMap["Librarian App"]!["description"]!,
      technologiesUsed: reposMap["Librarian App"]!["technologiesUsed"],
      githubLink: reposMap["Librarian App"]!["githubLink"],
      imgURL: reposMap["Librarian App"]!["imgURL"]),
];
