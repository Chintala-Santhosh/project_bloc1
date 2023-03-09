import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import '../base_state.dart';
import '../home/home_events.dart';
import '../repo/home_repository.dart';

class HomeBloc extends Bloc<HomeEvent,BaseState> {
  final HomeRepository _repository;

  HomeBloc(this._repository):super(Loading()) {
    on<GetHomePageDetail>((event,emit) async {
      emit(Loading());
      print("first state");
      try{
        final users = await _repository.getUsers();
        emit(Loaded(users));
      }catch(e){
        emit(Error(e.toString()));
      }

    }

    );
  }

  // @override
  // Stream<BaseState> mapEventToState(HomeEvent event) async* {
  //   if (event is GetHomePageDetail) {
  //     yield Loading();
  //     try {
  //       BaseResponse baseResponse = (await _repository.getUsers());
  //       if (baseResponse.error == 200) {
  //         BaseResponse response = (await get(Uri.parse(endpoint)));
  //         // SearchItemResponse data = baseResponse.listData.map((i) => MenuItem.fromJson(i)).toList();
  //         yield DataLoaded(event: "user details", data: response);
  //       }
  //       else {
  //         yield BaseError(baseResponse.error);
  //       }
  //     }catch{
  //       yield BaseError(baseResponse.error);
  //     }
  //     }
  //   }
    }

