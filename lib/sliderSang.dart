import 'package:flutter/material.dart';
import 'package:screen_brightness/screen_brightness.dart';

class SliderLight extends StatefulWidget {
  const SliderLight({super.key});

  @override
  State<SliderLight> createState() => _SliderLightState();
}

class _SliderLightState extends State<SliderLight> {
  double _brightness = 0.5; // Giá trị độ sáng mặc định

  @override
  void initState() {
    super.initState();
    _getCurrentBrightness();
  }

  Future<void> _getCurrentBrightness() async {
    double brightness;
    try {
      brightness = await ScreenBrightness().current; // Lấy độ sáng hiện tại
    } catch (e) {
      brightness = 0.5; // Giá trị mặc định nếu có lỗi
    }
    setState(() {
      _brightness = brightness;
    });
  }

  Future<void> _setBrightness(double brightness) async {
    try {
      await ScreenBrightness().setScreenBrightness(brightness);
      setState(() {
        _brightness = brightness;
      });
    } catch (e) {
      // Xử lý lỗi nếu cần
      print('Failed to set brightness: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Brightness: ${(_brightness * 100).round()}%'),
          Slider(
            value: _brightness,
            onChanged: (value) {
              _setBrightness(value);
            },
            min: 0.0,
            max: 1.0,
            divisions: 100,
            label: '${(_brightness * 100).round()}%',
          ),
        ],
      ),
    );
  }
}
