import "dart:math";

import "package:flutter/material.dart";

class PixelAvatarPage extends StatefulWidget {
  const PixelAvatarPage({super.key});

  @override
  _PixelAvatarPageState createState() => _PixelAvatarPageState();
}

class _PixelAvatarPageState extends State<PixelAvatarPage> {
  final List<Color> _colors = [Colors.red, Colors.green, Colors.blue];
  late List<List<Color>> _grid;

  @override
  void initState() {
    super.initState();
    _generateGrid();
  }

  void _generateGrid() {
    final random = Random();
    _grid = List.generate(
        12,
        (i) =>
            List.generate(12, (j) => _colors[random.nextInt(_colors.length)]));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pixel Avatar Generator'),
      ),
      body: Center(
        child: ClipOval(
          child: AspectRatio(
            aspectRatio: 1,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 12,
              ),
              itemCount: 144, // 12x12 grid
              itemBuilder: (context, index) {
                final x = index % 12;
                final y = index ~/ 12;
                return Container(
                  decoration: BoxDecoration(
                    color: _grid[y][x],
                    border: Border.all(color: Colors.black, width: 0.5),
                  ),
                );
              },
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(_generateGrid);
        },
        tooltip: 'Regenerate',
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
