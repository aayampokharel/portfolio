import 'package:flutter/material.dart';
import 'package:port/container_controller.dart';
import 'package:port/text_controller.dart';
import 'dart:math' as math;

const Color _teal = Color(0xff36B2B8);
const Color _gold = Color(0xffFFC857);

// =============================================================
// Hero section — big, immersive, built on the background photo
// =============================================================
class HeroSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 640),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: const AssetImage("Photos/amayangri.jpg"),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            const Color(0xff0A1C24).withValues(alpha: 0.82),
            BlendMode.darken,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
        child: LayoutBuilder(builder: (context, constraints) {
          final wide = constraints.maxWidth > 880;
          if (wide) {
            return Row(
              children: [
                Expanded(flex: 3, child: _HeroText(isWide: wide)),
                const SizedBox(width: 24),
                Expanded(flex: 2, child: _PortraitCard()),
              ],
            );
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 24),
              Align(child: _PortraitCard(small: true)),
              const SizedBox(height: 28),
              _HeroText(isWide: wide),
            ],
          );
        }),
      ),
    );
  }
}

class _HeroText extends StatelessWidget {
  final bool isWide;
  const _HeroText({required this.isWide});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: isWide ? CrossAxisAlignment.start : CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
          decoration: BoxDecoration(
            color: _teal.withValues(alpha: 0.18),
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: _teal.withValues(alpha: 0.4)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.circle, color: _gold, size: 10),
              const SizedBox(width: 8),
              Text(
                "Available for opportunities",
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 22),
        Text(
          "Hello, I am",
          style: TextStyle(
            fontSize: isWide ? 26 : 20,
            color: Colors.white.withValues(alpha: 0.85),
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 4),
        ShaderMask(
          shaderCallback: (rect) => const LinearGradient(
            colors: [_gold, _teal],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ).createShader(rect),
          child: Text(
            "Aayam Pokharel",
            textAlign: isWide ? TextAlign.left : TextAlign.center,
            style: TextStyle(
              fontFamily: "Cursive",
              fontSize: isWide ? 62 : 42,
              fontWeight: FontWeight.w700,
              color: Colors.white,
              height: 1.05,
            ),
          ),
        ),
        const SizedBox(height: 14),
        Text(
          "Full Stack Developer & DevOps Engineer",
          textAlign: isWide ? TextAlign.left : TextAlign.center,
          style: TextStyle(
            fontSize: isWide ? 22 : 18,
            fontWeight: FontWeight.w600,
            color: _teal,
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          "I design interfaces with Flutter, engineer scalable APIs in Go, "
          "and own the whole journey — from production release to clean CI/CD pipelines.",
          textAlign: isWide ? TextAlign.left : TextAlign.center,
          style: TextStyle(
            fontSize: 15.5,
            height: 1.6,
            color: Colors.white.withValues(alpha: 0.8),
          ),
        ),
        const SizedBox(height: 26),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          alignment: isWide ? WrapAlignment.start : WrapAlignment.center,
          children: [
            ContainerController.button(buttonColor: _teal).returnButton(
              text: TextController.custom("View My Work",
                      color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700)
                  .returnText(),
              fnctToRun: null,
              padding: 18,
              borderRadius: 30,
              borderColor: Colors.transparent,
              minWidth: 150,
              height: 60,
            ),
            ContainerController.button(buttonColor: const Color(0x22333333)).returnButton(
              text: TextController.custom("Hire Me",
                      color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700)
                  .returnText(),
              fnctToRun: null,
              padding: 18,
              borderRadius: 30,
              borderColor: Colors.white38,
              height: 60,
            ),
          ],
        ),
        const SizedBox(height: 34),
        if (isWide) Row(children: [_Stats()]),
        if (!isWide) _Stats(),
      ],
    );
  }
}

class _Stats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final stats = [
      ("04+", "Languages"),
      ("20+", "Tools & Tech"),
      ("06", "Projects Built"),
      ("01", "Live in Production"),
    ];
    return LayoutBuilder(builder: (context, c) {
      final row = Wrap(
        spacing: 24,
        runSpacing: 16,
        children: [
          for (final (value, label) in stats)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  value,
                  style: const TextStyle(
                    fontFamily: "Cursive",
                    fontSize: 30,
                    color: _gold,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  label.toUpperCase(),
                  style: TextStyle(
                    fontSize: 11,
                    letterSpacing: 1.5,
                    color: Colors.white.withValues(alpha: 0.6),
                  ),
                ),
              ],
            ),
        ],
      );
      return c.maxWidth > 620 ? row : Center(child: Row(mainAxisAlignment: MainAxisAlignment.center, children: row.children));
    });
  }
}

class _PortraitCard extends StatelessWidget {
  final bool small;
  const _PortraitCard({this.small = false});

  @override
  Widget build(BuildContext context) {
    final size = small ? 180.0 : 330.0;
    return Stack(
      alignment: Alignment.center,
      children: [
        // glowing blob behind
        Container(
          height: size * 1.4,
          width: size * 1.4,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: RadialGradient(
              colors: [
                _teal.withValues(alpha: 0.35),
                _teal.withValues(alpha: 0.0),
              ],
            ),
          ),
        ),
        Container(
          height: size,
          width: size * 0.82,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            gradient: const LinearGradient(
              colors: [_teal, _gold],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                color: _teal.withValues(alpha: 0.5),
                blurRadius: 40,
                spreadRadius: 4,
              ),
            ],
          ),
          padding: const EdgeInsets.all(6),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(35),
            child: Image.asset("Photos/me.jpeg", fit: BoxFit.cover),
          ),
        ),
        // floating bits
        Positioned(
          top: 6,
          right: 8,
          child: _FloatingBadge(icon: Icons.rocket_launch_outlined, label: "Go + Flutter"),
        ),
        Positioned(
          bottom: 20,
          left: -14,
          child: _FloatingBadge(icon: Icons.cloud_outlined, label: "DevOps"),
        ),
      ],
    );
  }
}

class _FloatingBadge extends StatelessWidget {
  final IconData icon;
  final String label;
  const _FloatingBadge({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF0D2B33).withValues(alpha: 0.92),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0x33FFFFFF)),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.3), blurRadius: 12)],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: _gold, size: 16),
          const SizedBox(width: 6),
          Text(
            label,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.white),
          ),
        ],
      ),
    );
  }
}

class LogoAnimation extends StatelessWidget {
  const LogoAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}