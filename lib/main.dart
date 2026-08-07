import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:port/list_of_repos.dart';
import 'package:port/svg_links_map.dart';
import 'package:port/ui_kit.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(const PortfolioApp());

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Aayam Pokharel — Portfolio",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: kBodyFont,
        scaffoldBackgroundColor: kBg,
        colorScheme: const ColorScheme.dark(primary: kTeal),
      ),
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  Home({super.key});

  final GlobalKey _about = GlobalKey();
  final GlobalKey _projects = GlobalKey();
  final GlobalKey _tools = GlobalKey();
  final GlobalKey _contact = GlobalKey();

  void _go(BuildContext context, GlobalKey key) {
    final t = key.currentContext;
    if (t != null) {
      Scrollable.ensureVisible(t,
          duration: const Duration(milliseconds: 700), curve: Curves.easeInOutCubic, alignment: 0.1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBg,
      body: Stack(
        children: [
          const _PageBackground(),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: _Nav(
              onAbout: () => _go(context, _about),
              onProjects: () => _go(context, _projects),
              onTools: () => _go(context, _tools),
              onContact: () => _go(context, _contact),
            ),
          ),
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                const SizedBox(height: 90),
                _Hero(onProjects: () => _go(context, _projects)),
                _AboutSection(key: _about),
                _ProjectsSection(key: _projects),
                _ToolsSection(key: _tools),
                _ContactSection(key: _contact),
                const SizedBox(height: 40),
                const _MiniFooter(),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------
//  Page background — faint personal photo + soft fade, keeps text readable
// ---------------------------------------------------------------
class _PageBackground extends StatelessWidget {
  const _PageBackground();
  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(color: kBg),
          Opacity(
            opacity: 0.13,
            child: Image.asset("Photos/cloud_mountain.JPG", fit: BoxFit.cover),
          ),
          DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  kBg.withValues(alpha: 0.18),
                  kBg.withValues(alpha: 0.1),
                  kBg.withValues(alpha: 0.25),
                ],
                stops: const [0.0, 0.5, 1.0],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------
//  Fixed minimal nav
// ---------------------------------------------------------------
class _Nav extends StatelessWidget {
  final VoidCallback onAbout, onProjects, onTools, onContact;
  const _Nav({
    required this.onAbout,
    required this.onProjects,
    required this.onTools,
    required this.onContact,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(28, 16, 28, 14),
      decoration: BoxDecoration(
        color: kSurface.withValues(alpha: 0.85),
        border: const Border(bottom: BorderSide(color: kLine)),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.25), blurRadius: 24)],
      ),
      child: LayoutBuilder(builder: (context, c) {
        final links = [
          ("About", onAbout),
          ("Work", onProjects),
          ("Stack", onTools),
          ("Contact", onContact),
        ];
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset("Photos/myLogo.png", height: 36, width: 36),
                const SizedBox(width: 12),
                Text("aayam.p",
                    style: const TextStyle(
                        fontFamily: kDisplayFont,
                        fontSize: 21,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.5,
                        color: kText)),
                Text(".dev",
                    style: const TextStyle(fontFamily: kDisplayFont, fontSize: 21, color: kTeal)),
              ],
            ),
            if (c.maxWidth > 760)
              Row(
                children: [
                  for (final l in links) ...[
                    _NavLink(label: l.$1, onTap: l.$2),
                    const SizedBox(width: 30),
                  ],
                ],
              ),
            Row(
              children: [
                _IconBtn(
                  asset: "Photos/github_color.svg",
                  url: "https://github.com/aayampokharel",
                  accent: kText,
                ),
                const SizedBox(width: 10),
                _IconBtn(
                  asset: "Photos/instagram_color.svg",
                  url: "https://instagram.com/pokharel_aayam",
                  accent: const Color(0xFFDD2A7B),
                ),
                const SizedBox(width: 10),
                _IconBtn(
                  asset: "Photos/linkedin_color.svg",
                  url: "https://www.linkedin.com/",
                  accent: const Color(0xFF0A66C2),
                ),
              ],
            ),
          ],
        );
      }),
    );
  }
}

class _NavLink extends StatefulWidget {
  final String label;
  final VoidCallback onTap;
  const _NavLink({required this.label, required this.onTap});
  @override
  State<_NavLink> createState() => _NavLinkState();
}

class _NavLinkState extends State<_NavLink> {
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
          duration: const Duration(milliseconds: 150),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            color: _h ? kTeal.withValues(alpha: 0.12) : Colors.transparent,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: _h ? kTeal.withValues(alpha: 0.5) : Colors.transparent),
          ),
          child: AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 150),
            style: TextStyle(
                fontFamily: kDisplayFont,
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: _h ? kTeal : kText),
            child: Text(widget.label),
          ),
        ),
      ),
    );
  }
}

class _IconBtn extends StatefulWidget {
  final String? asset;
  final String url;
  final Color accent;
  const _IconBtn({this.asset, required this.url, this.accent = kTeal});
  @override
  State<_IconBtn> createState() => _IconBtnState();
}

class _IconBtnState extends State<_IconBtn> {
  bool _h = false;
  @override
  Widget build(BuildContext context) {
    final accent = widget.accent;
    final child = (widget.asset != null)
        ? (widget.asset!.endsWith('.png')
            ? Image.asset(widget.asset!, height: 26, width: 26)
            : SvgPicture.asset(widget.asset!, height: 26, width: 26))
        : Icon(Icons.circle, size: 26, color: accent);
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _h = true),
      onExit: (_) => setState(() => _h = false),
      child: GestureDetector(
        onTap: () async {
          final u = Uri.parse(widget.url);
          if (await canLaunchUrl(u)) await launchUrl(u);
        },
        child: AnimatedScale(
          scale: _h ? 1.1 : 1,
          duration: const Duration(milliseconds: 150),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            height: 46,
            width: 46,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _h ? accent.withValues(alpha: 0.22) : accent.withValues(alpha: 0.10),
              border: Border.all(color: _h ? accent : accent.withValues(alpha: 0.45)),
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------
//  HERO — editorial, oversized, portrait offset
// ---------------------------------------------------------------
class _Hero extends StatelessWidget {
  final VoidCallback onProjects;
  const _Hero({required this.onProjects});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 760,
      child: LayoutBuilder(builder: (context, c) {
        final wide = c.maxWidth > 980;
        final text = _HeroText(onProjects: onProjects);
        final portrait = const _HeroPortrait();
        if (wide) {
          return Padding(
            padding: const EdgeInsets.only(top: 120, left: 40, right: 40),
            child: Stack(
              children: [
                Positioned(left: 20, top: 20, bottom: 20, child: SizedBox(width: c.maxWidth * 0.52, child: text)),
                Positioned(right: 20, top: -10, child: portrait),
              ],
            ),
          );
        }
        return SingleChildScrollView(
          padding: const EdgeInsets.only(top: 120, left: 24, right: 24, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              text,
              const SizedBox(height: 40),
              Center(child: portrait),
            ],
          ),
        );
      }),
    );
  }
}

class _HeroText extends StatelessWidget {
  final VoidCallback onProjects;
  const _HeroText({required this.onProjects});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Eyebrow("Full-Stack Developer · DevOps"),
        const SizedBox(height: 26),
        Text(
          "Hi, I'm Aayam.\nI build software\nthat ships.",
          style: TextStyle(
            fontFamily: kDisplayFont,
            fontSize: 58,
            height: 1.04,
            fontWeight: FontWeight.w800,
            letterSpacing: -2,
            color: kText,
          ),
          textAlign: TextAlign.left,
        ),
        const SizedBox(height: 18),
        Text(
          "Go backends, Flutter apps and the DevOps glue in between.\nFrom a blank repo to a live release, I own it end-to-end.",
          style: TextStyle(
            fontFamily: kBodyFont,
            fontSize: 17,
            height: 1.6,
            color: kMuted,
          ),
        ),
        const SizedBox(height: 30),
        Wrap(
          spacing: 14,
          runSpacing: 14,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            HeroButton("View selected work", onTap: onProjects, solid: true),
            HeroButton("Say hello →"),
          ],
        ),
        const SizedBox(height: 44),
        const _HeroStats(),
      ],
    );
  }
}

class _HeroStats extends StatelessWidget {
  const _HeroStats();
  @override
  Widget build(BuildContext context) {
    const stats = [
      ("5", "Projects"),
      ("20+", "Tools"),
      ("1", "Live product"),
      ("4", "Languages"),
    ];
    return Row(
      children: [
        for (final s in stats) ...[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(s.$1,
                  style: const TextStyle(
                      fontFamily: kDisplayFont,
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                      color: kTeal)),
              Text(s.$2.toUpperCase(),
                  style: const TextStyle(fontSize: 11, letterSpacing: 2, color: kMuted)),
            ],
          ),
          const SizedBox(width: 38),
        ],
      ],
    );
  }
}

class _HeroPortrait extends StatelessWidget {
  const _HeroPortrait();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      height: 380,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0x33FFFFFF)),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.35), blurRadius: 40)],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: Image.asset("Photos/me.jpeg", fit: BoxFit.cover),
      ),
    );
  }
}

// ---------------------------------------------------------------
class _AboutSection extends StatelessWidget {
  const _AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(40, 80, 40, 0),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1240),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Eyebrow("About Me", color: kTeal),
            const SizedBox(height: 14),
            const Text(
              "About me",
              style: TextStyle(fontFamily: kDisplayFont, fontSize: 46, fontWeight: FontWeight.w800, letterSpacing: -2, color: kText),
            ),
            const SizedBox(height: 30),
            LayoutBuilder(builder: (context, c) {
              final wide = c.maxWidth > 960;
              if (wide) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(flex: 3, child: _AboutText()),
                    const SizedBox(width: 60),
                    Expanded(flex: 2, child: _AboutPortrait()),
                  ],
                );
              }
              return Column(children: [const _AboutText(), const SizedBox(height: 40), const _AboutPortrait()]);
            }),
            const SizedBox(height: 40),
            const _PhotoStrip(),
          ],
        ),
      ),
    );
  }
}

class _AboutText extends StatelessWidget {
  const _AboutText();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          "I'm a full-stack developer from Nepal who likes taking projects from idea to production.",
          style: TextStyle(fontFamily: kBodyFont, fontSize: 20, height: 1.55, color: kText),
        ),
        SizedBox(height: 16),
        Text(
          "Frontends in Flutter, backends in Go, and the Docker/CI/CD to ship both. My flagship is a "
          "permissioned consortium blockchain for academic certificates — consensus, Merkle "
          "trees and RSA cryptography written from scratch in Go, then deployed.",
          style: TextStyle(fontFamily: kBodyFont, fontSize: 16, height: 1.7, color: kMuted),
        ),
        SizedBox(height: 26),
        _Principles(),
      ],
    );
  }
}

class _Principles extends StatelessWidget {
  const _Principles();
  @override
  Widget build(BuildContext context) {
    const rows = [
      ("01 — Full-Stack", "Flutter frontend → Go API → Postgres"),
      ("02 — Distributed", "Blockchains, consensus, crypto from scratch"),
      ("03 — Dev-first Ops", "Docker · GH Actions · Hetzner · Dokploy"),
    ];
    return Column(
      children: [
        for (final r in rows)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                SizedBox(
                  width: 150,
                  child: Text(r.$1,
                      style: const TextStyle(fontFamily: kDisplayFont, fontSize: 15, fontWeight: FontWeight.w700, color: kGold)),
                ),
                Expanded(
                    child: Text(r.$2,
                        style: const TextStyle(fontSize: 15, color: kMuted))),
              ],
            ),
          ),
      ],
    );
  }
}

class _AboutPortrait extends StatelessWidget {
  const _AboutPortrait();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: kSurface,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: kLine),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset("Photos/sunset.jpg", fit: BoxFit.cover, height: 400),
      ),
    );
  }
}

class _PhotoStrip extends StatelessWidget {
  const _PhotoStrip();
  @override
  Widget build(BuildContext context) {
    const photos = [
      "Photos/cloud_mountain.JPG",
      "Photos/stone_clear_sky.JPG",
      "Photos/buddhist_flags.JPG",
    ];
    return LayoutBuilder(builder: (context, c) {
      final wide = c.maxWidth > 720;
      return Row(
        children: [
          for (int i = 0; i < photos.length; i++) ...[
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(photos[i],
                    fit: BoxFit.cover, height: wide ? 200 : 140),
              ),
            ),
            if (i != photos.length - 1) const SizedBox(width: 12),
          ],
        ],
      );
    });
  }
}
// ===============================================================
//  PROJECTS — editorial index rows with hover reveals
// ===============================================================
class _ProjectsSection extends StatelessWidget {
  const _ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(40, 110, 40, 40),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1240),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Eyebrow("Selected Work", color: kPurple),
            const SizedBox(height: 14),
            const Text(
              "Projects",
              style: TextStyle(fontFamily: kDisplayFont, fontSize: 56, fontWeight: FontWeight.w800, letterSpacing: -2, color: kText),
            ),
            const SizedBox(height: 34),
            for (int i = 0; i < reposModelList.length; i++) ...[
              _ProjectRow(model: reposModelList[i], index: i),
              if (i != reposModelList.length - 1)
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Divider(color: kLine, height: 1),
                ),
            ],
          ],
        ),
      ),
    );
  }
}

class _ProjectRow extends StatefulWidget {
  final dynamic model;
  final int index;
  const _ProjectRow({required this.model, required this.index});
  @override
  State<_ProjectRow> createState() => _ProjectRowState();
}

class _ProjectRowState extends State<_ProjectRow> {
  bool _h = false;
  @override
  Widget build(BuildContext context) {
    final m = widget.model;
    final big = "0${widget.index + 1}";
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _h = true),
      onExit: (_) => setState(() => _h = false),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: LayoutBuilder(builder: (context, c) {
          final wide = c.maxWidth > 900;
          final number = AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 200),
            style: TextStyle(
                fontFamily: kDisplayFont,
                fontSize: 15,
                height: 1,
                fontWeight: FontWeight.w700,
                letterSpacing: 1,
                color: _h ? kPurple : kMuted),
            child: Text(big),
          );
          final info = Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 200),
                style: TextStyle(
                    fontFamily: kDisplayFont,
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                    color: _h ? kTeal : kText),
                child: Text('${m.topic}'),
              ),
              if (m.subtitle != null) ...[
                const SizedBox(height: 4),
                Text('${m.subtitle}',
                    style: const TextStyle(fontFamily: kDisplayFont, fontSize: 13, letterSpacing: 1, color: kTeal)),
              ],
              const SizedBox(height: 8),
              Text('${m.description}',
                  style: const TextStyle(fontFamily: kBodyFont, fontSize: 15, height: 1.6, color: kMuted)),
              const SizedBox(height: 14),
              for (final b in (m.bullets as List))
                Padding(
                  padding: const EdgeInsets.only(bottom: 6),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 7, right: 10),
                        child: SizedBox(width: 6, height: 6, child: DecoratedBox(decoration: BoxDecoration(color: kTeal, shape: BoxShape.circle))),
                      ),
                      Expanded(
                        child: Text('$b',
                            style: const TextStyle(fontFamily: kBodyFont, fontSize: 14.5, height: 1.45, color: kText)),
                      ),
                    ],
                  ),
                ),
              const SizedBox(height: 14),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  for (final t in (m.technologiesUsed as List)) _Chip(t),
                ],
              ),
              const SizedBox(height: 14),
              Wrap(
                spacing: 12,
                runSpacing: 10,
                children: [
                  if (m.githubLink != null) _ProjectLink(label: "GitHub", url: "${m.githubLink}", icon: Icons.code),
                  if (m.youtubeLink != null) _ProjectLink(label: "YouTube", url: "${m.youtubeLink}", icon: Icons.play_circle_fill, video: true),
                  if (m.liveLink != null) _ProjectLink(label: "Live site", url: "${m.liveLink}", icon: Icons.open_in_new, accent: true),
                ],
              ),
            ],
          );
          if (!wide) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                number,
                const SizedBox(height: 16),
                _ProjectThumb(image: '${m.imgURL}', hover: _h, height: 150),
                const SizedBox(height: 20),
                info,
              ],
            );
          }
          return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(width: 40, child: number),
              Expanded(flex: 3, child: info),
              const SizedBox(width: 40),
              Expanded(flex: 2, child: _ProjectThumb(image: '${m.imgURL}', hover: _h, height: 150)),
            ],
          );
        }),
      ),
    );
  }
}

class _ProjectLink extends StatelessWidget {
  final String label;
  final String url;
  final IconData icon;
  final bool accent;
  final bool video;
  const _ProjectLink({
    required this.label,
    required this.url,
    required this.icon,
    this.accent = false,
    this.video = false,
  });

  @override
  Widget build(BuildContext context) {
    final color = video ? const Color(0xFFE53935) : (accent ? kGold : kTeal);
    return GestureDetector(
      onTap: () async {
        final u = Uri.parse(url);
        if (await canLaunchUrl(u)) await launchUrl(u);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.10),
          border: Border.all(color: color.withValues(alpha: 0.45)),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (video)
              SvgPicture.asset("Photos/youtube.svg", height: 17, width: 17)
            else
              Icon(icon, color: color, size: 17),
            const SizedBox(width: 6),
            Text(label,
                style: TextStyle(
                    fontFamily: kDisplayFont,
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.5,
                    color: color)),
          ],
        ),
      ),
    );
  }
}

class _ProjectThumb extends StatelessWidget {
  final String image;
  final bool hover;
  final double height;
  const _ProjectThumb({required this.image, required this.hover, required this.height});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: hover ? kTeal.withValues(alpha: 0.7) : kLine, width: 1.2),
      ),
        child: ClipRRect(
        borderRadius: BorderRadius.circular(14),
        child: ColoredBox(
          color: kSurface2,
          child: Image.asset(image, fit: BoxFit.contain),
        ),
      ),
    );
  }
}

class _Chip extends StatelessWidget {
  final String label;
  const _Chip(this.label);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: kSurface,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: kLine),
      ),
      child: Text(label,
          style: const TextStyle(fontFamily: kDisplayFont, fontSize: 12, color: kMuted)),
    );
  }
}

// ===============================================================
//  TOOLS — simple logo grid
// ===============================================================
class _ToolsSection extends StatelessWidget {
  const _ToolsSection({super.key});

  static const _tools = [
    "golang", "dart", "flutter", "postgresql", "docker",
    "githubactions", "dokploy", "hetzner", "linux", "bash",
    "mysql", "github", "git", "postman", "c", "cpp", "vscode",
    "androidstudio", "html", "css", "javascript", "php",
  ];
  static const _labels = {
    "githubactions": "CI/CD",
    "postgresql": "PostgreSQL",
    "androidstudio": "Android Studio",
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(40, 90, 40, 70),
      decoration: const BoxDecoration(
          color: kSurface,
          border: Border(top: BorderSide(color: kLine), bottom: BorderSide(color: kLine))),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1240),
        child: LayoutBuilder(builder: (context, c) {
          final cols = c.maxWidth > 1100 ? 6 : (c.maxWidth > 700 ? 4 : 3);
          final grid = GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _tools.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: cols,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 1.3,
            ),
            itemBuilder: (context, i) {
              final key = _tools[i];
              return _ToolTile(
                keyName: key,
                label: _labels[key] ?? key,
                logoPath: svgLinksMap[key],
                highlighted: key == "golang",
              );
            },
          );
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Eyebrow("Toolbox", color: kGold),
              const SizedBox(height: 14),
              const Text("Technologies I work with",
                  style: TextStyle(fontFamily: kDisplayFont, fontSize: 36, fontWeight: FontWeight.w800, letterSpacing: -1, color: kText)),
              const SizedBox(height: 30),
              grid,
            ],
          );
        }),
      ),
    );
  }
}

class _ToolTile extends StatefulWidget {
  final String keyName;
  final String label;
  final String? logoPath;
  final bool highlighted;
  const _ToolTile({required this.keyName, required this.label, required this.logoPath, this.highlighted = false});
  @override
  State<_ToolTile> createState() => _ToolTileState();
}

class _ToolTileState extends State<_ToolTile> {
  bool _h = false;
  @override
  Widget build(BuildContext context) {
    final hl = widget.highlighted;
    final Color accent = hl ? kGold : kTeal;
    return MouseRegion(
      onEnter: (_) => setState(() => _h = true),
      onExit: (_) => setState(() => _h = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        curve: Curves.easeOut,
        transform: _h ? Matrix4.translationValues(0, -5, 0) : Matrix4.identity(),
        decoration: BoxDecoration(
          color: _h ? accent.withValues(alpha: 0.10) : (hl ? accent.withValues(alpha: 0.16) : kSurface2),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
              color: _h ? accent.withValues(alpha: 0.6) : (hl ? accent.withValues(alpha: 0.5) : kLine)),
        ),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: hl
                  ? BoxDecoration(color: accent.withValues(alpha: 0.15), shape: BoxShape.circle)
                  : null,
              child: widget.logoPath != null
                  ? SvgPicture.asset(widget.logoPath!, height: 30, width: 30)
                  : Icon(Icons.square, color: kMuted, size: 22),
            ),
            const SizedBox(height: 8),
            Text(widget.label.toUpperCase(),
                style: TextStyle(
                    fontFamily: kDisplayFont,
                    fontSize: 11,
                    letterSpacing: 1.5,
                    fontWeight: FontWeight.w700,
                    color: _h ? accent : (hl ? kGold : kMuted))),
          ],
        ),
      ),
    );
  }
}

// ===============================================================
//  CONTACT + FOOTER
// ===============================================================
class _ContactSection extends StatelessWidget {
  const _ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(40, 130, 40, 40),
      child: LayoutBuilder(builder: (context, c) {
        final wide = c.maxWidth > 900;
        return ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1240),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Eyebrow("Contact", color: kTeal),
              const SizedBox(height: 20),
              Text.rich(
                TextSpan(children: [
                  const TextSpan(text: "Have a project"),
                  TextSpan(
                      text: "\nin mind?",
                      style: TextStyle(color: kTeal.withValues(alpha: 0.6))),
                ]),
                style: const TextStyle(fontFamily: kDisplayFont, fontSize: 58, height: 1.0, fontWeight: FontWeight.w800, letterSpacing: -2, color: kText),
              ),
              const SizedBox(height: 40),
              Wrap(
                spacing: 24,
                runSpacing: 16,
                children: [
                  HeroButton("aayam.pokharel@gmail.com", onTap: () => _open("mailto:aayam.pokharel@gmail.com"), solid: true),
                  HeroButton("Say hi on Instagram", onTap: () => _open("https://instagram.com/pokharel_aayam")),
                ],
              ),
              SizedBox(height: wide ? 90 : 60),
              if (wide)
                Row(
                  children: [
                    const Expanded(child: Text("© 2026 Aayam Pokharel — Built with Flutter.",
                        style: TextStyle(fontSize: 13, color: kMuted))),
                    for (final s in ["github", "instagram", "linkedin"])
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: _FootLink(s),
                      ),
                  ],
                )
              else
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("© 2026 Aayam Pokharel — Built with care.",
                        style: TextStyle(fontSize: 13, color: kMuted)),
                    const SizedBox(height: 16),
                    Wrap(spacing: 24, children: [for (final s in ["github", "instagram", "linkedin"]) _FootLink(s)]),
                  ],
                ),
            ],
          ),
        );
      }),
    );
  }

  Future _open(String url) async {
    final u = Uri.parse(url);
    if (await canLaunchUrl(u)) await launchUrl(u);
  }
}

class _FootLink extends StatelessWidget {
  final String platform;
  const _FootLink(this.platform);
  @override
  Widget build(BuildContext context) {
    final url = {
      "github": "https://github.com/aayampokharel",
      "instagram": "https://instagram.com/pokharel_aayam",
      "linkedin": "https://www.linkedin.com/",
    }[platform]!;
    return GestureDetector(
      onTap: () async {
        final u = Uri.parse(url);
        if (await canLaunchUrl(u)) await launchUrl(u);
      },
      child: Text(platform.toUpperCase(),
          style: const TextStyle(fontFamily: kDisplayFont, fontSize: 13, letterSpacing: 2, color: kMuted)),
    );
  }
}

class _MiniFooter extends StatelessWidget {
  const _MiniFooter();
  @override
  Widget build(BuildContext context) {
    return const Text("Designed & built from scratch — Flutter Web.",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 13, color: kLine, letterSpacing: 1));
  }
}
