import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get_it/get_it.dart';

import '../../services/finamp_settings_helper.dart';
import '../../services/finamp_user_helper.dart';
import '../../services/jellyfin_api_helper.dart';

class DownloadFavouritesButton extends StatefulWidget {
  const DownloadFavouritesButton({super.key});

  @override
  State<DownloadFavouritesButton> createState() =>
      _DownloadFavouritesButtonState();
}

class _DownloadFavouritesButtonState extends State<DownloadFavouritesButton> {
  bool _isEnabled = !FinampSettingsHelper.finampSettings.isOffline;
  final _finampUserHelper = GetIt.instance<FinampUserHelper>();
  final _jellyfinApiHelper = GetIt.instance<JellyfinApiHelper>();

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: _isEnabled
          ? () async {
              setState(() {
                _isEnabled = false;
              });

              for (final tab in FinampSettingsHelper.finampSettings.shownTabs) {
                final items = await _jellyfinApiHelper.getItems(
                  isGenres: false,
                  parentItem: _finampUserHelper.currentUser?.currentView,
                  includeItemTypes: tab.includeItemTypes,
                  filters: "IsFavorite",
                );

                print("hi");
              }
            }
          : null,
      icon: const Icon(Icons.favorite),
      tooltip: AppLocalizations.of(context)!.downloadFavourites,
    );
  }
}
