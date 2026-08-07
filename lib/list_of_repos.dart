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
    "youtubeLink": "null",
    "imgURL": "Photos/bat_app_ss.png"
  },
  "Librarian App": {
    "description":
        "Developed an app for librarians to manage overdue book fines. It allows librarians to input book details, calculate overdue fines, and track them efficiently. The app features a user-friendly interface for searching books and calculating fines, while MySQL handles book storage and fine management.",
    "technologiesUsed": ["Flutter", "Dart", "Go", "MySql"],
    "githubLink": "https://github.com/aayampokharel/librarian_app",
    "youtubeLink": "https://youtube.com/shorts/_qTJ_5aDVKE?feature=shared",
    "imgURL": "Photos/librarian_ss.png"
  },
  "Gartic Clone": {
    "description":
        "Created an interactive online multiplayer drawing and guessing game where players take turns drawing prompts while others guess the drawings. Real-time communication is handled through WebSockets, ensuring synchronized gameplay, with features like a countdown timer and random prompts to enhance the fun.",
    "technologiesUsed": ["Flutter", "Dart", "Go", "WebSockets"],
    "githubLink": "https://github.com/aayampokharel/gartic-clone",
    "youtubeLink": "https://youtu.be/fp6YZsIX85U?feature=shared",
    "imgURL": "Photos/gartic_ss.png"
  },
  "Bat Description App": {
    "description":
        "Developed a Flutter application showcasing a variety of cricket bats, complete with detailed information such as pricing, specifications, and images. The app features a user-friendly interface for browsing and searching products, enabling users to explore and compare options effortlessly. Dynamic UI components ensure a smooth and engaging description viewing experience.",
    "technologiesUsed": ["Flutter", "Dart"],
    "githubLink": "https://github.com/aayampokharel/bat_app",
    "youtubeLink": "https://youtube.com/shorts/kfMHapffEc8?feature=shared",
    "imgURL": "Photos/bat_app_ss.png"
  },
};

List<ReposModel> reposModelList = [
  ReposModel(
      topic: "Gartic Clone",
      description: reposMap["Gartic Clone"]!["description"],
      technologiesUsed: reposMap["Gartic Clone"]!["technologiesUsed"],
      githubLink: reposMap["Gartic Clone"]!["githubLink"],
      youtubeLink: reposMap["Gartic Clone"]!["youtubeLink"],
      imgURL: reposMap["Gartic Clone"]!["imgURL"]),
  ReposModel(
      topic: "Bat Description App",
      description: reposMap["Bat Description App"]!["description"]!,
      technologiesUsed: reposMap["Bat Description App"]!["technologiesUsed"],
      githubLink: reposMap["Bat Description App"]!["githubLink"],
      youtubeLink: reposMap["Bat Description App"]!["youtubeLink"],
      imgURL: reposMap["Bat Description App"]!["imgURL"]),
  ReposModel(
      topic: "Librarian App",
      description: reposMap["Librarian App"]!["description"]!,
      technologiesUsed: reposMap["Librarian App"]!["technologiesUsed"],
      githubLink: reposMap["Librarian App"]!["githubLink"],
      youtubeLink: reposMap["Librarian App"]!["youtubeLink"],
      imgURL: reposMap["Librarian App"]!["imgURL"]),
];
