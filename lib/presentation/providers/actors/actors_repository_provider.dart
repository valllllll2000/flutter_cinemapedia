import 'package:cinemapedia/infrastructure/datasources/actors_moviedb_datasource.dart';
import 'package:cinemapedia/infrastructure/repositories/actors_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final actorsRepositoryProvider =
    Provider((ref) => ActorsRepositoryImpl(ActorsMovieDbDatasource()));
