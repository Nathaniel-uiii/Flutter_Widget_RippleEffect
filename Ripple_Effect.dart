import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const title = 'RIPPLE EFFECT';

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      home: MyHomePage(title: title),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  const MyHomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        toolbarHeight: 80,
        centerTitle: true,
      ),
      // The primary content of the Scaffold.
      body: const Center(
        // Centers its child widget.
        child: MyButton(), // Displays the custom button in the center of the screen.
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  const MyButton({super.key});

  @override
  // The build method defines the UI for the button.
  Widget build(BuildContext context) {
    return InkWell(
      // Callback function invoked when the InkWell is tapped.
      onTap: () {
        // ScaffoldMessenger manages SnackBars and other messages for the Scaffold.
        // It's used to show a SnackBar globally.
        ScaffoldMessenger.of(context).showSnackBar(
          // SnackBar is a transient message to the user.
          SnackBar(
            content: SizedBox(
              height: 100,
              // Arranges widgets horizontally.
              child: Row(
                children: <Widget>[
                  // Displays an image from a network URL.
                  Image.network(
                    'https://www.gstatic.com/flutter-onestack-prototype/genui/example_1.jpg',
                    width: 100,
                    fit: BoxFit
                        .cover,
                  // Provides horizontal spacing between the image and text.
                  const SizedBox(width: 15),
                  // Allows its child (Text) to expand to fill the available horizontal space.
                  const Expanded(
                    child: Text(
                      ' Eastern Bluebirds are known for their striking coloration. Males have vibrant blue upperparts, a chestnut-brown throat and breast, and a white belly. Females are typically a more subdued grayish-blue with paler underparts',
                      style: TextStyle(color: Colors.grey),
                      // Handles text overflow by showing an ellipsis.
                      overflow: TextOverflow.ellipsis,
                      // Limits the text to a maximum of 8 lines.
                      maxLines: 8,
                    ),
                  ),
                ],
              ),
            ),
            // How long the SnackBar remains visible.
            duration: const Duration(seconds: 10),
            // Background color of the SnackBar.
            backgroundColor: Colors.grey[900],
            // Padding around the SnackBar's content.
            padding: const EdgeInsets.all(16.0),
            // Defines how the SnackBar behaves (e.g., fixed at bottom or floating).
            behavior: SnackBarBehavior.floating,
            // Defines the shape of the SnackBar, including rounded corners.
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        );
      },
      // Defines the border radius for the InkWell, ensuring the ripple effect
      borderRadius: BorderRadius.circular(8),
      child: Container(
        width: 150, // Sets the width of the button.
        height: 50, // Sets the height of the button.
        // Aligns the child of the Container to its center.
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.black, // Background color of the button.
          borderRadius:
              BorderRadius.circular(8), // Rounded corners for the button.
        ),
        // The text displayed inside the button.
        child: const Text(
          'Click!',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }
}
