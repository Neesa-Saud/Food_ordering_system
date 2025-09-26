import "package:flutter/material.dart";
import "package:foodapp/Utils/Text.dart";
class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.amber,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 55),
            ModifiedText(
              text: "Welcome to _____",
              color: Colors.black,
              size: 25,
            ),
            SizedBox(height: 40),
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                image: const DecorationImage(
                  image: AssetImage("assets/Delivary_Cartoon.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              // ignore: sort_child_properties_last
              child: ModifiedText(
                text: "Lets Start",
                color: Colors.black,
                size: 10,
              ),
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(const Color.fromARGB(255, 61, 46, 46)),
                overlayColor: MaterialStateProperty.resolveWith<Color?>((
                  states,
                ) {
                  if (states.contains(MaterialState.pressed)) {
                    return Colors.amber.withOpacity(0.5);
                  }
                  return null;
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
