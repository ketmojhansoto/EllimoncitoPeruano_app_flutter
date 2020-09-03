import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

void main() => runApp(Configuracion());

class Configuracion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          'Configuraciones',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
          color: Colors.white,
          child: SettingsList(
            sections: [
              SettingsSection(
                title: 'General',
                tiles: [
                  SettingsTile(
                    title: 'Idioma',
                    subtitle: 'Español',
                    leading: Icon(Icons.language),
                    onTap: () {},
                  ),
                  SettingsTile(
                    title: 'Usuario',
                    leading: Icon(Icons.person),
                    onTap: () {},
                  ),
                  SettingsTile(
                    title: 'Tamaño de letras',
                    leading: Icon(Icons.font_download),
                    onTap: () {},
                  ),
                  SettingsTile.switchTile(
                    title: 'Tema',
                    leading: Icon(Icons.format_color_fill),
                    switchValue: false,
                    onToggle: (bool value) {},
                  ),
                ],
              ),
              SettingsSection(
                title: 'Otros',
                tiles: [
                  SettingsTile(
                    title: 'Manual de usuario',
                    leading: Icon(Icons.receipt),
                    onTap: () {},
                  ),
                  SettingsTile(
                    title: 'Políticas de privacidad',
                    leading: Icon(Icons.lock),
                    onTap: () {},
                  ),
                  SettingsTile(
                    title: 'Información legal',
                    leading: Icon(Icons.beenhere),
                    onTap: () {},
                  ),
                  SettingsTile(
                    title: 'Atención al cliente',
                    subtitle: 'ellimoncitoperuano@gmail.com',
                    leading: Icon(Icons.tag_faces),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
