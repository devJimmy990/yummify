import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:yummify/core/constants/assets_manager.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  Future<void> _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  Future<void> _launchEmail(String email) async {
    final Uri emailUri = Uri(scheme: 'mailto', path: email);
    if (!await launchUrl(emailUri)) {
      throw 'Could not launch $email';
    }
  }

  Future<void> _launchWhatsApp(String number) async {
    final url = 'https://wa.me/$number';
    _launchURL(url);
  }

  @override
  Widget build(BuildContext context) {
    final items = [
      _ContactItem(
        title: 'WhatsApp',
        subtitle: '+20 128 922 3643',
        img: AssetsManager.assetsContactWhatsapp,
        color: Colors.green,
        onTap: () => _launchWhatsApp('201289223643'),
      ),
      _ContactItem(
        title: 'LinkedIn',
        subtitle: 'linkedin.com/in/mogamaal',
        img: AssetsManager.assetsContactLinkedin,
        color: Colors.blueAccent,
        onTap: () => _launchURL('https://www.linkedin.com/in/mogamaal/'),
      ),
      _ContactItem(
        title: 'GitHub',
        subtitle: 'github.com/devJimmy990',
        img: AssetsManager.assetsContactGithub,
        color: Colors.black,
        onTap: () => _launchURL('https://github.com/devJimmy990'),
      ),
      _ContactItem(
        title: 'Portfolio',
        subtitle: 'devjimmy.vercel.app',
        img: AssetsManager.assetsContactPortfolio,
        color: Colors.teal,
        onTap: () => _launchURL('https://devjimmy.vercel.app/'),
      ),
      _ContactItem(
        title: 'Gmail',
        subtitle: 'muhammedgamal997@gmail.com',
        img: AssetsManager.assetsContactGmail,
        color: Colors.red,
        onTap: () => _launchEmail('muhammedgamal997@gmail.com'),
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Contact Us')),
      body: SafeArea(
        child: ListView.separated(
          padding: const EdgeInsets.all(16),
          itemCount: items.length,
          separatorBuilder: (_, __) => const Divider(),
          itemBuilder: (context, index) => items[index],
        ),
      ),
    );
  }
}

class _ContactItem extends StatelessWidget {
  const _ContactItem({
    required this.title,
    required this.subtitle,
    required this.img,
    required this.color,
    required this.onTap,
  });

  final String title, subtitle;
  final String img;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => ListTile(
    contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
    leading: CircleAvatar(
      backgroundColor: color.withOpacity(0.1),
      child: Image.asset(img),
    ),
    title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
    subtitle: Text(subtitle),
    trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
    onTap: onTap,
  );
}
