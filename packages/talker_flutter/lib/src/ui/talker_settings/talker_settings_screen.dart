import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:talker_flutter/src/ui/theme/default_theme.dart';
import 'package:talker_flutter/src/ui/widgets/cards/base_card.dart';
import 'package:talker_flutter/talker_flutter.dart';

class TalkerSettingsScreen extends StatelessWidget {
  const TalkerSettingsScreen({
    Key? key,
    required this.talkerScreenTheme,
    required this.talker,
  }) : super(key: key);

  /// Theme for customize [TalkerScreen]
  final TalkerScreenTheme talkerScreenTheme;

  /// Talker implementation
  final TalkerInterface talker;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: talkerScreenTheme.backgroudColor,
      appBar: AppBar(
        title: const FittedBox(
          fit: BoxFit.scaleDown,
          child: Text('Talker Settings'),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(child: SizedBox(height: 16)),
          SliverToBoxAdapter(
            child: _TalkerSettingsCard(
              talkerScreenTheme: talkerScreenTheme,
              title: 'Enabled',
              enabled: true,
              onChanged: (enabled) {},
            ),
          ),
        ],
      ),
    );
  }
}

class _TalkerSettingsCard extends StatelessWidget {
  const _TalkerSettingsCard({
    Key? key,
    required this.talkerScreenTheme,
    required this.title,
    required this.enabled,
    required this.onChanged,
  }) : super(key: key);

  final String title;
  final bool enabled;
  final Function(bool enabled) onChanged;
  final TalkerScreenTheme talkerScreenTheme;

  @override
  Widget build(BuildContext context) {
    return TalkerBaseCard(
      color: cardBackgroundColor,
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(
            color: talkerScreenTheme.textColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        trailing: CupertinoSwitch(
          value: enabled,
          trackColor: Colors.red,
          onChanged: onChanged,
        ),
      ),
    );
  }
}