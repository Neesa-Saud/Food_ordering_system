import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:foodapp/Pages/HomePage/UI/home.dart";
import "package:foodapp/Pages/StartPage/bloc/start_page_bloc.dart";
import "package:foodapp/Utils/Text.dart";

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  final StartPageBloc startPageBloc = StartPageBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StartPageBloc, StartPageState>(
      bloc: startPageBloc,
      listenWhen: (previous, current) => current is StartPageActionState,
      listener: (context, state) {
        if (state is StartPageButtonClickedState) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const Home()),
          );
          // TODO: implement listener
        }
      },
      builder: (context, state) {
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
                  onPressed: () {
                    startPageBloc.add(StartPageButtonClickEvent());
                  },
                  // ignore: sort_child_properties_last
                  child: ModifiedText(
                    text: "Lets Start",
                    color: Colors.black,
                    size: 10,
                  ),
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.white),
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
      },
    );
  }
}
