import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:mini_mapp_manager/mini_mapp_manager.dart';
import 'package:mini_mapp_manager/model/direction.dart';

part 'map_event.dart';
part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  MapBloc() : super(MapState()) {
    on<MapEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
