import 'package:flutter/material.dart';

class TextInputField extends StatelessWidget {
  const TextInputField({
    required this.label,
    super.key,
    this.icon,
    this.hint,
    this.validator,
    this.onChanged,
    this.controller,
    this.lines = 1,
    this.enabled = true,
    this.keyboardType = TextInputType.text,
  });
  final String label;
  final bool enabled;
  final String? hint;
  final IconData? icon;
  final int lines;
  final TextInputType keyboardType;
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(label),
      const SizedBox(height: 8),
      TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        validator: validator,
        onChanged: onChanged,
        enabled: enabled,
        maxLines: lines,
        decoration: InputDecoration(
          filled: true,
          hintText: hint,
          border: _buildNoBorder(),
          enabledBorder: _buildNoBorder(),
          errorBorder: _buildErrorBorder(),
          focusedBorder: _buildFocusBorder(),
          prefixIcon: icon != null
              ? Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Icon(icon, size: 24),
                )
              : null,

          contentPadding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 16,
          ),
        ),
      ),
    ],
  );
}

class PasswordInputField extends StatefulWidget {
  const PasswordInputField({
    required this.hint,
    required this.label,
    super.key,
    this.validator,
    this.onChanged,
    this.controller,
  });
  final String label;
  final String hint;
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  @override
  State<PasswordInputField> createState() => _PasswordInputFieldState();
}

class _PasswordInputFieldState extends State<PasswordInputField> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(widget.label),
      const SizedBox(height: 8),
      TextFormField(
        controller: widget.controller,
        obscureText: obscureText,
        validator: widget.validator,
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          hintText: widget.hint,
          border: _buildNoBorder(),
          enabledBorder: _buildNoBorder(),
          errorBorder: _buildErrorBorder(),
          focusedBorder: _buildFocusBorder(),
          prefixIcon: const Icon(Icons.lock_outline, size: 24),
          suffixIcon: IconButton(
            onPressed: () => setState(() => obscureText = !obscureText),
            icon: Icon(
              obscureText
                  ? Icons.visibility_off_outlined
                  : Icons.visibility_outlined,
            ),
            padding: const EdgeInsets.all(12.0),
            constraints: const BoxConstraints(),
            iconSize: 24,
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 16,
          ),
        ),
      ),
    ],
  );
}

InputBorder _buildNoBorder() => OutlineInputBorder(
  borderRadius: BorderRadius.circular(12),
  borderSide: BorderSide.none,
);

InputBorder _buildErrorBorder() => OutlineInputBorder(
  borderRadius: BorderRadius.circular(12),
  borderSide: const BorderSide(color: Colors.red, width: 1.5),
);

InputBorder _buildFocusBorder() => OutlineInputBorder(
  borderRadius: BorderRadius.circular(12),
  borderSide: const BorderSide(width: 1.5),
);
