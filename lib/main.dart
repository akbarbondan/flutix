import 'package:bwa_fllutix/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:bwa_fllutix/ui/pages/pages.dart';

import 'bloc/blocs.dart';



void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
      value: AuthServices.userStream,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => PageBloc()),
          BlocProvider(create: (context) => UserBloc()),
          BlocProvider(create: (context) => ThemeBloc()),
          BlocProvider(create: (context) => MovieBloc()..add(FestMovieEvent())),
          BlocProvider(create: (context) => TicketBloc())
        ],
              child: BlocBuilder<ThemeBloc, ThemeState>(
                builder: (_,themeState) => 
                              MaterialApp(
                                theme: themeState.themeData,
          debugShowCheckedModeBanner: false,
          home: Wrapper(),),
              ),
      ),
    );
  }
}


// "akbar@gmail.com", "1234567"