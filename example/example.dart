import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_gyw/flutter_gyw.dart';

class GYWExampleScreen extends StatefulWidget {
  const GYWExampleScreen({super.key});

  @override
  State<GYWExampleScreen> createState() => _GYWExampleScreenState();
}

class _GYWExampleScreenState extends State<GYWExampleScreen> {
  BTDevice? connectedDevice;

  Future<void> _scanForDevice() async {
    try {
      await BTManager.instance.refreshDevices();
    } on GYWStatusException catch (e, s) {
      log("Impossible to scan", error: e, stackTrace: s);
    }

    setState(() {});
  }

  Future<void> _sendExampleData() async {
    const List<Drawing> drawings = [
      WhiteScreen(),
      IconDrawing(GYWIcons.up, top: 50, left: 60),
      TextDrawing(
        text: "Hello world",
        top: 50,
        left: 220,
        font: GYWFonts.medium,
      ),
    ];

    for (Drawing drawing in drawings) {
      await connectedDevice?.displayDrawing(drawing);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).viewPadding.top),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: _scanForDevice,
              child: const Text("Search devices"),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.7,
            decoration: BoxDecoration(
              border: Border.all(),
            ),
            child: ListView.builder(
              itemCount: BTManager.instance.devices.length,
              itemBuilder: (_, index) {
                final BTDevice device = BTManager.instance.devices[index];
                return ListTile(
                  title: Text(
                    device.name.isEmpty ? "Unknown device" : device.name,
                    style: TextStyle(
                      fontWeight: device.id == connectedDevice?.id
                          ? FontWeight.bold
                          : null,
                    ),
                  ),
                  subtitle: Text(device.id),
                  onTap: () async {
                    if (await device.connect()) {
                      setState(() => connectedDevice = device);
                    }
                  },
                  onLongPress: () async {
                    if (await device.disconnect()) {
                      setState(() => connectedDevice = null);
                    }
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: connectedDevice == null ? null : _sendExampleData,
              child: const Text("Send data"),
            ),
          ),
        ],
      ),
    );
  }
}
