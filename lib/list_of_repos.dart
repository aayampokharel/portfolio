import 'package:port/repos_model.dart';

const String _null = "null";

String? _val(dynamic v) => v == _null ? null : (v as String?);

Map<String, Map<String, dynamic>> reposMap = {
  "Academic Certificate Blockchain": {
    "subtitle": "Flagship · Backend System",
    "description":
        "A private, permissioned consortium blockchain in Go for issuing, storing and verifying academic records across institutions.",
    "bullets": [
      "Private consortium blockchain for academic certificates, built in Go.",
      "Dual consensus: PoW + PBFT on a 4-node network tolerating 1 Byzantine node.",
      "Custom P2P layer over raw TCP sockets for block and consensus propagation.",
      "RSA-signed PBFT messages with SHA-256 Merkle trees for integrity.",
      "Clean Architecture across domain, app, infrastructure and delivery layers.",
    ],
    "technologiesUsed": ["Go", "PostgreSQL", "Python", "Flutter", "TCP", "RSA/SHA-256"],
    "githubLink": "https://github.com/aayampokharel/fyp_backend",
    "youtubeLink": _null,
    "liveLink": _null,
    "imgURL": "Photos/blockchain_flowchart.png"
  },
  "SafalTopper": {
    "subtitle": "Creator & Lead Backend Developer",
    "description":
        "Production EdTech platform for entrance aspirants, live at safaltopper.com.",
    "bullets": [
      "Type-safe, auto-validated REST APIs with Go, Gin and Huma.",
      "JWT + Google OAuth2 auth; Zap request logging and rate limiting.",
      "Clean Architecture: domain, persistence (GORM) and HTTP separated.",
      "CI/CD with Docker + GitHub Actions, zero-downtime deploys via Dokploy on Hetzner.",
    ],
    "technologiesUsed": [
      "Go", "Gin", "Huma", "GORM", "PostgreSQL", "JWT", "Docker", "GitHub Actions", "Dokploy", "Hetzner"
    ],
    "githubLink": _null,
    "youtubeLink": _null,
    "liveLink": "https://safaltopper.com",
    "imgURL": "Photos/safaltopper_ss.png"
  },
  "Gartic Clone": {
    "subtitle": "Multiplayer Drawing Game",
    "description":
        "A realtime drawing + guessing game — Flutter frontend, Go server over WebSockets.",
    "bullets": [
      "Live drawing and guessing across players via WebSockets.",
      "Go (chi) server handling rooms, rounds and countdown timers.",
      "Flutter frontend keeps everyone in sync.",
    ],
    "technologiesUsed": ["Flutter", "Dart", "Go", "WebSockets"],
    "githubLink": "https://github.com/aayampokharel/gartic-clone",
    "youtubeLink": "https://youtu.be/fp6YZsIX85U?feature=shared",
    "liveLink": _null,
    "imgURL": "Photos/gartic_ss.png"
  },
  "BatHub": {
    "subtitle": "Flutter Mobile App",
    "description":
        "A cricket bat explorer — browse, search and save your favourite bats.",
    "bullets": [
      "Browse bats with images, specs and descriptions.",
      "Instant search by brand, weight or player.",
      "360° bat viewer plus a personal wishlist.",
    ],
    "technologiesUsed": ["Flutter", "Dart"],
    "githubLink": "https://github.com/aayampokharel/bat_app",
    "youtubeLink": "https://youtube.com/shorts/kfMHapffEc8?feature=shared",
    "liveLink": _null,
    "imgURL": "Photos/bat_app_ss.png"
  },
  "Librarian App": {
    "subtitle": "Library Management",
    "description":
        "Full-stack library app for tracking books, borrow dates and overdue fines.",
    "bullets": [
      "Search books with author, genre and availability details.",
      "Auto-computes issue/expiry dates and overdue fines.",
      "Flutter frontend with a Go + MySQL backend.",
    ],
    "technologiesUsed": ["Flutter", "Dart", "Go", "MySQL"],
    "githubLink": "https://github.com/aayampokharel/Librarian_app",
    "youtubeLink": "https://youtube.com/shorts/_qTJ_5aDVKE?feature=shared",
    "liveLink": _null,
    "imgURL": "Photos/librarian_ss.png"
  },
};

ReposModel _fromMap(String key) => ReposModel(
      topic: key,
      subtitle: reposMap[key]!["subtitle"],
      description: reposMap[key]!["description"],
      bullets: (reposMap[key]!["bullets"] as List<dynamic>).cast<String>(),
      technologiesUsed: reposMap[key]!["technologiesUsed"],
      githubLink: _val(reposMap[key]!["githubLink"]),
      youtubeLink: _val(reposMap[key]!["youtubeLink"]),
      liveLink: _val(reposMap[key]!["liveLink"]),
      imgURL: reposMap[key]!["imgURL"],
    );

List<ReposModel> reposModelList = [
  _fromMap("Academic Certificate Blockchain"),
  _fromMap("SafalTopper"),
  _fromMap("Gartic Clone"),
  _fromMap("BatHub"),
  _fromMap("Librarian App"),
];
