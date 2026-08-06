import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:navigation_api/navigation_api.dart';
import 'package:shared_core/core.dart';
import 'package:shared_ui/core_ui.dart';

@RoutePage()
class InviteQrScannerScreen extends StatefulWidget {
  const InviteQrScannerScreen({super.key});

  @override
  State<InviteQrScannerScreen> createState() => _InviteQrScannerScreenState();
}

class _InviteQrScannerScreenState extends State<InviteQrScannerScreen> {
  final MobileScannerController _controller = MobileScannerController(
    detectionSpeed: DetectionSpeed.noDuplicates,
  );
  bool _handled = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations texts = context.texts;

    return Scaffold(
      appBar: AppBar(
        title: Text(texts.inviteQrScannerTitle),
        leading: IconButton(
          icon: AppIcons.close(color: context.colors.icon.main),
          onPressed: () => appLocator<AppNavigator>().navigateBack(),
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          MobileScanner(controller: _controller, onDetect: _onDetect),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Text(
                texts.inviteQrScannerHint,
                textAlign: TextAlign.center,
                style: context.message.copyWith(color: context.colors.text.inverse),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onDetect(BarcodeCapture capture) {
    if (_handled) return;
    for (final Barcode barcode in capture.barcodes) {
      final String? raw = barcode.rawValue;
      if (raw == null || raw.isEmpty) continue;
      final String normalized = raw.toUpperCase().replaceAll(RegExp('[^A-Z0-9]'), '');
      if (normalized.length != 8) continue;
      _handled = true;
      // Return the code to InviteCodeScreen via route pop result.
      Navigator.of(context).pop(normalized);
      return;
    }
  }
}
