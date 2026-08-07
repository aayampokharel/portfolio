import 'package:flutter/material.dart';

// =============================================================
//  Design tokens — fresh, distinctive palette & type helpers
// =============================================================
const Color kBg = Color(0xFF0A0F12);
const Color kSurface = Color(0xFF0E1A20);
const Color kSurface2 = Color(0xFF12222A);
const Color kTeal = Color(0xFF38C7C4);
const Color kGold = Color(0xFFF6C24B);
const Color kPurple = Color(0xFF8F6BF6);
const Color kText = Color(0xFFEAF4F5);
const Color kMuted = Color(0xFF9FB0B5);
const Color kLine = Color(0x1FFFFFFF);

const String kDisplayFont = "SpaceGrotesk";
const String kBodyFont = "Inter";
const String kAccentFont = "Cursive";

// ---------------------------------------------------------------
//  Grid backdrop — a faint editorial blue-grid under the content
// ---------------------------------------------------------------
class GridBackdrop extends StatelessWidget {
  const GridBackdrop({super.key});
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _GridPainter(),
      size: Size.infinite,
    );
  }
}

class _GridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withValues(alpha: 0.035)
      ..strokeWidth = 1;
    const step = 56.0;
    for (double x = 0; x < size.width; x += step) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }
    for (double y = 0; y < size.height; y += step) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// ---------------------------------------------------------------
//  Big hollow (outline) typeface — signature editorial move
// ---------------------------------------------------------------
class OutlineText extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  const OutlineText(this.text,
      {super.key, this.size = 90, this.color = const Color(0xFF21373D)});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: kDisplayFont,
        fontSize: size,
        height: 0.95,
        fontWeight: FontWeight.w800,
        letterSpacing: -2,
        foreground: Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1.4
          ..color = color,
      ),
    );
  }
}

// ---------------------------------------------------------------
//  Eyebrow / section tag
// ---------------------------------------------------------------
class Eyebrow extends StatelessWidget {
  final String text;
  final Color color;
  const Eyebrow(this.text, {super.key, this.color = kGold});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 36,
          height: 1,
          color: color.withValues(alpha: 0.6),
        ),
        const SizedBox(width: 12),
        Text(
          text.toUpperCase(),
          style: TextStyle(
            fontFamily: kDisplayFont,
            fontSize: 12,
            letterSpacing: 4,
            fontWeight: FontWeight.w600,
            color: color,
          ),
        ),
      ],
    );
  }
}

// ---------------------------------------------------------------
//  Hover-tinted hero button (pill + arrow)
// ---------------------------------------------------------------
class HeroButton extends StatefulWidget {
  final String label;
  final VoidCallback? onTap;
  final bool solid;
  const HeroButton(this.label, {super.key, this.onTap, this.solid = false});
  @override
  State<HeroButton> createState() => _HeroButtonState();
}

class _HeroButtonState extends State<HeroButton> {
  bool _h = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _h = true),
      onExit: (_) => setState(() => _h = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 220),
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 15),
          decoration: BoxDecoration(
            color: widget.solid
                ? (_h ? kTeal : kTeal)
                : (_h ? kSurface2 : Colors.transparent),
            border: Border.all(
              color: widget.solid ? Colors.transparent : (_h ? kTeal : kLine),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(60),
            boxShadow: widget.solid && _h
                ? [
                    BoxShadow(
                        color: kTeal.withValues(alpha: 0.5),
                        blurRadius: 30,
                        spreadRadius: 2)
                  ]
                : null,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.label,
                style: TextStyle(
                    color: widget.solid
                        ? const Color(0xFF061013)
                        : (_h ? kTeal : kMuted),
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.3),
              ),
              const SizedBox(width: 10),
              Icon(
                Icons.arrow_outward_rounded,
                color: widget.solid
                    ? const Color(0xFF061013)
                    : (_h ? kTeal : kMuted),
                size: 18,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------
//  Seamless marquee (top-grade motion cue)
// ---------------------------------------------------------------
class Marquee extends StatefulWidget {
  final List<Widget> items;
  final double speed;
  const Marquee(this.items, {super.key, this.speed = 1.0});
  @override
  State<Marquee> createState() => _MarqueeState();
}

class _MarqueeState extends State<Marquee>
    with SingleTickerProviderStateMixin {
  late AnimationController _c;
  final ScrollController _scroll = ScrollController();
  final _rowKey = GlobalKey();
  double _copyW = 300;

  @override
  void initState() {
    super.initState();
    _c = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: (28000 / widget.speed).round()))
      ..repeat()
      ..addListener(_tick);
    _scroll.addListener(_measure);
  }

  void _measure() {
    final box = _rowKey.currentContext?.findRenderObject() as RenderBox?;
    if (box != null && box.hasSize && box.size.width > 0) _copyW = box.size.width;
  }

  void _tick() {
    if (!_scroll.hasClients) return;
    _measure();
    _scroll.jumpTo((_c.value * _copyW) % (_copyW * 6));
  }

  @override
  void dispose() {
    _c.dispose();
    _scroll.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: SingleChildScrollView(
        controller: _scroll,
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (int i = 0; i < 6; i++)
              Row(key: i == 0 ? _rowKey : null, mainAxisSize: MainAxisSize.min, children: widget.items),
          ],
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------
//  Custom cursor glow — the "this is designed" micro-interaction
// ---------------------------------------------------------------
class CursorGlow extends StatefulWidget {
  final Widget child;
  const CursorGlow({super.key, required this.child});
  @override
  State<CursorGlow> createState() => _CursorGlowState();
}

class _CursorGlowState extends State<CursorGlow> {
  final ValueNotifier<Offset> _pos = ValueNotifier(const Offset(-500, -500));
  final ValueNotifier<bool> _show = ValueNotifier(false);

  @override
  void dispose() {
    _pos.dispose();
    _show.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (e) {
        _pos.value = e.localPosition;
        if (!_show.value) _show.value = true;
      },
      onExit: (_) => _show.value = false,
      child: Stack(
        children: [
          widget.child,
          // Cursor glow overlay (Positioned is a direct child of the Stack)
          Positioned.fill(
            child: IgnorePointer(
              child: ValueListenableBuilder<Offset>(
                valueListenable: _pos,
                builder: (context, pos, _) {
                  return ValueListenableBuilder<bool>(
                    valueListenable: _show,
                    builder: (context, show, _) {
                      return AnimatedOpacity(
                        duration: const Duration(milliseconds: 200),
                        opacity: show ? 1 : 0,
                        child: Stack(
                          children: [
                            Positioned(
                              left: pos.dx - 220 < 0 ? 0 : pos.dx - 220,
                              top: pos.dy - 220 < 0 ? 0 : pos.dy - 220,
                              child: IgnorePointer(
                                child: Container(
                                  width: 440,
                                  height: 440,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    gradient: RadialGradient(colors: [
                                      kTeal.withValues(alpha: 0.09),
                                      Colors.transparent,
                                    ]),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------
//  Section container used across the page for spacing + anchors
// ---------------------------------------------------------------
class Section extends StatelessWidget {
  final EdgeInsets padding;
  final Widget child;
  const Section({super.key, required this.child, this.padding = const EdgeInsets.symmetric(horizontal: 28, vertical: 90)});
  @override
  Widget build(BuildContext context) {
    return Padding(key: key, padding: padding, child: ConstrainedBox(constraints: const BoxConstraints(maxWidth: 1280), child: child));
  }
}