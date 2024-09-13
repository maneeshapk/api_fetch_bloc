import 'package:bloc_task/src/data/datasource/remote/apifetching.dart';
import 'package:bloc_task/src/presentation/cubits/bloc/apifetch_bloc.dart';
import 'package:bloc_task/src/presentation/cubits/bloc/apifetch_event.dart';
import 'package:bloc_task/src/presentation/cubits/bloc/apifetch_state.dart';
import 'package:bloc_task/src/utils/resource/imagewidget.dart';
import 'package:bloc_task/src/utils/resource/textwidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => SuperheroBloc(SuperheroRepository()),
        child: const SuperheroList(),
      ),
    );
  }
}

class SuperheroList extends StatelessWidget {
  const SuperheroList({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<SuperheroBloc>(context).add(FetchSuperheroes());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Superheroes'),
      ),
      body: BlocBuilder<SuperheroBloc, SuperheroState>(
        builder: (context, state) {
          if (state is SuperheroLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is SuperheroLoaded) {
            final superheroes = state.superheroes;
            return ListView.builder(
              itemCount: superheroes.length,
              itemBuilder: (context, index) {
                final superhero = superheroes[index];
                return  Column(
        
                  children: [
                    Imagewidget(imagepath: superhero.url, height: 0.5, width: 0.5),
                    
                    Textwidget(entertext: superhero.name, paddingvalue: 0, ),
                    Textwidget(entertext: superhero.power, paddingvalue: 20,)
                  ],
                );
              },
            );
          }
          return const Text("error");
        },
      ),
    );
  }
}
