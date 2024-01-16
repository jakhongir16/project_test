part of 'number_bloc.dart';

class NumberState {}

class NumberStarter extends NumberState {}

class NumberSpaceLoading extends NumberState {}

class NumberSpaceLoaded extends NumberState {
   final ScreenNumbers numberSpaceModel;
   NumberSpaceLoaded({required this.numberSpaceModel});
}

class NumberSpaceErrorLoading extends NumberState {}
