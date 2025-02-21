import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:navigation_time/utils.dart';
import 'package:navigation_time/view_models/dark_model_config_vm.dart';
import 'package:provider/provider.dart';

class NavTab extends ConsumerWidget {
  final bool isSelected;
  final VoidCallback onTap;
  final IconData icon;

  const NavTab({
    super.key,
    required this.isSelected,
    required this.onTap,
    required this.icon,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(darkModeConfigProvider).isDarkMode;
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          color: isDarkMode ? Colors.black : Colors.white,
          alignment: Alignment.center,
          child: AnimatedOpacity(
            opacity: isSelected ? 1 : 0.5,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            child: FaIcon(
              icon,
              color: isSelected
                  ? isDarkMode
                      ? Colors.white
                      : Colors.black
                  : isDarkMode
                      ? Colors.white
                      : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
