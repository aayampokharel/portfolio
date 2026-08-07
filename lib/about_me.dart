import 'package:flutter/material.dart';
import 'package:port/text_controller.dart';

const Color _teal = Color(0xff36B2B8);
const Color _gold = Color(0xffFFC857);

Widget AboutMe() {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
    decoration: BoxDecoration(
      gradient: const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Color(0xFF0D2B33), Color(0xFF0A1E26)],
      ),
      borderRadius: BorderRadius.circular(28),
      border: Border.all(color: const Color(0x22FFFFFF)),
      boxShadow: [
        BoxShadow(color: Colors.black.withValues(alpha: 0.3), blurRadius: 30, spreadRadius: 2),
      ],
    ),
    child: LayoutBuilder(builder: (context, constraints) {
      final wide = constraints.maxWidth > 880;
      final portrait = _Portrait(size: wide ? 320 : 240);
      final text = _AboutText();

      if (!wide) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            portrait,
            const SizedBox(height: 28),
            text,
          ],
        );
      }
      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(flex: 4, child: text),
          const SizedBox(width: 32),
          Expanded(flex: 3, child: Center(child: portrait)),
        ],
      );
    }),
  );
}

class _Portrait extends StatelessWidget {
  final double size;
  const _Portrait({required this.size});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          height: size * 1.5,
          width: size * 1.5,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: RadialGradient(colors: [
              _teal.withValues(alpha: 0.3),
              _teal.withValues(alpha: 0.0),
            ]),
          ),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: size,
              width: size,
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: const LinearGradient(
                  colors: [_teal, _gold],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: [
                  BoxShadow(color: _teal.withValues(alpha: 0.45), blurRadius: 35, spreadRadius: 4),
                ],
              ),
              child: ClipOval(
                child: Image.asset("Photos/me.jpeg", fit: BoxFit.cover),
              ),
            ),
          ],
        ),
        Positioned(
          bottom: -6,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: const Color(0xFF0D2B33),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: _teal.withValues(alpha: 0.5)),
              boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.35), blurRadius: 15)],
            ),
            child: Text(
              "Full-Stack + DevOps",
              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: _gold),
            ),
          ),
        ),
      ],
    );
  }
}

class _AboutText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final facts = [
      (const Icon(Icons.verified, size: 22, color: _teal),
          "Full-Stack Expert", "Flutter frontends, Go (Huma + GORM) backends"),
      (const Icon(Icons.security, size: 22, color: _teal),
          "Blockchain Flagship", "Consortium chain: PoW + PBFT + RSA + Merkle"),
      (const Icon(Icons.cloud_done_outlined, size: 22, color: _teal),
          "DevOps Ownership", "Docker → GH Actions → Dokploy → Hetzner"),
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 6),
          decoration: BoxDecoration(
            color: _gold.withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: _gold.withValues(alpha: 0.4)),
          ),
          child: const Text(
            "ABOUT ME",
            style: TextStyle(
              letterSpacing: 3,
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: _gold,
            ),
          ),
        ),
        const SizedBox(height: 16),
        TextController.custom(
          "I'm a full-stack developer and DevOps engineer who loves building real, production-grade software — from the first line of frontend code to the final deployment.",
          color: Colors.white,
          fontSize: 21,
          fontWeight: FontWeight.w600,
        ).returnText(fontFamily: "Opensans"),
        const SizedBox(height: 14),
        TextController.custom(
          "I craft interfaces in Flutter, build scalable REST APIs in Go, and ship releases to https://safaltopper.com. My flagship project is a private Permissioned Consortium Blockchain for academic certificates — Proof-of-Work, PBFT consensus, Merkle trees and RSA cryptography, built from scratch.",
          color: const Color(0xFFC3D6DC),
          fontSize: 15.5,
        ).returnText(fontFamily: "Opensans", justify: true),
        const SizedBox(height: 24),
        for (final (icon, title, sub) in facts)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 7),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 44,
                  width: 44,
                  decoration: BoxDecoration(
                    color: _teal.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: _teal.withValues(alpha: 0.35)),
                  ),
                  child: Center(child: icon),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title,
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w700, color: Colors.white)),
                      const SizedBox(height: 2),
                      Text(sub,
                          style: const TextStyle(fontSize: 13.5, color: Color(0xFF9FB8BF), height: 1.4)),
                    ],
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}