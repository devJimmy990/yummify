import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yummify/core/ui/inputs.dart';
import 'package:yummify/features/auth/cubit/auth_cubit.dart';
import 'package:yummify/features/auth/data/model/user.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({required this.user, super.key});
  final User user;

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _phoneController;
  late TextEditingController _emailController;

  final List<String> _avatarUrls = [
    'https://randomuser.me/api/portraits/lego/0.jpg',
    'https://randomuser.me/api/portraits/lego/1.jpg',
    'https://randomuser.me/api/portraits/lego/2.jpg',
    'https://randomuser.me/api/portraits/lego/3.jpg',
    'https://randomuser.me/api/portraits/lego/4.jpg',
    'https://randomuser.me/api/portraits/lego/5.jpg',
    'https://randomuser.me/api/portraits/lego/6.jpg',
    'https://randomuser.me/api/portraits/lego/7.jpg',
    'https://randomuser.me/api/portraits/lego/8.jpg',
  ];

  String? _selectedAvatar;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.user.name);
    _phoneController = TextEditingController(text: widget.user.phone);
    _emailController = TextEditingController(text: widget.user.email);
    _selectedAvatar = widget.user.avatar ?? _avatarUrls.first;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  void _saveProfile() {
    if (_formKey.currentState!.validate()) {
      context.read<AuthCubit>().updateProfile({
        'name': _nameController.text.trim(),
        'phone': _phoneController.text.trim(),
        'avatar': _selectedAvatar,
      });
      Navigator.pop(context);
    }
  }

  void _openAvatarSelectionSheet() {
    showModalBottomSheet(
      context: context,
      builder:
          (_) => Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            child: Wrap(
              alignment: WrapAlignment.center,
              spacing: 16,
              runSpacing: 16,
              children:
                  _avatarUrls.map((url) {
                    final isSelected = _selectedAvatar == url;
                    return GestureDetector(
                      onTap: () {
                        setState(() => _selectedAvatar = url);
                        Navigator.pop(context);
                      },
                      child: CircleAvatar(
                        radius: isSelected ? 36 : 30,
                        backgroundColor:
                            isSelected ? Colors.green : Colors.transparent,
                        child: CircleAvatar(
                          radius: isSelected ? 32 : 28,
                          backgroundImage: NetworkImage(url),
                        ),
                      ),
                    );
                  }).toList(),
            ),
          ),
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Edit Profile')),
    body: SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Avatar picker
              GestureDetector(
                onTap: _openAvatarSelectionSheet,
                child: CircleAvatar(
                  radius: 45,
                  backgroundImage: NetworkImage(_selectedAvatar!),
                ),
              ),
              const SizedBox(height: 12),
              TextButton.icon(
                onPressed: _openAvatarSelectionSheet,
                icon: const Icon(Icons.image_search),
                label: const Text('Change Avatar'),
              ),
              const SizedBox(height: 24),

              // Email (disabled)
              TextInputField(
                label: 'Email',
                controller: _emailController,
                enabled: false,
              ),
              const SizedBox(height: 16),

              // Name
              TextInputField(
                label: 'Name',
                controller: _nameController,
                validator:
                    (value) =>
                        (value == null || value.trim().isEmpty)
                            ? 'Enter your name'
                            : null,
              ),
              const SizedBox(height: 16),

              // Phone
              TextInputField(
                label: 'Phone',
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                validator:
                    (value) =>
                        (value == null || value.trim().isEmpty)
                            ? 'Enter your phone'
                            : null,
              ),
              const SizedBox(height: 32),

              // Save Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: _saveProfile,
                  icon: const Icon(Icons.save),
                  label: const Text('Save Changes'),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
