abstract class AddNotesState {}

class AddNotesInitial extends AddNotesState {}

class AddNotesLoading extends AddNotesState {}

class AddNotesSuccess extends AddNotesState {}

class AddNotesFailture extends AddNotesState {
  final String messageError;

  AddNotesFailture({required this.messageError});
}
