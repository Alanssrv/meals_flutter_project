import 'package:flutter/material.dart';
import '../models/settings.dart';
import '../components/main_drawer.dart';

class SettingsScreen extends StatefulWidget {
  final Settings settings;
  final Function(Settings) onSettingsChanged;

  const SettingsScreen(this.onSettingsChanged, this.settings, {Key? key})
      : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late Settings settings;

  @override
  void initState() {
    super.initState();

    settings = widget.settings;
  }

  Widget _createSwitch(
    String title,
    String subtitle,
    bool value,
    Function(bool) onChanged,
  ) {
    return SwitchListTile.adaptive(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: (value) {
        onChanged(value);
        widget.onSettingsChanged(settings);
      },
      activeColor: Theme.of(context).colorScheme.primary,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Configurações'),
          centerTitle: true,
        ),
        drawer: const MainDrawer(),
        body: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  _createSwitch(
                    'Sem Glutén',
                    'Só exibe refeições sem glutén',
                    settings.isGlutenFree,
                    (value) => setState(() => settings.isGlutenFree = value),
                  ),
                  _createSwitch(
                    'Sem Lactose',
                    'Só exibe refeições sem lactose',
                    settings.isLactoseFree,
                    (value) => setState(() => settings.isLactoseFree = value),
                  ),
                  _createSwitch(
                    'Vegana',
                    'Só exibe refeições vaganas',
                    settings.isVegan,
                    (value) => setState(() => settings.isVegan = value),
                  ),
                  _createSwitch(
                    'Vegetariana',
                    'Só exibe refeições vegetarianas',
                    settings.isVegetarian,
                    (value) => setState(() => settings.isVegetarian = value),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
