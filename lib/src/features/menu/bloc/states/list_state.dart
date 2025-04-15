abstract class ListState {
  final int selectedIndex;
  const ListState(this.selectedIndex);
}

class ListSelected extends ListState {
  const ListSelected(int selectedIndex) : super(selectedIndex);
}

class ListUnselected extends ListState {
  const ListUnselected(int selectedIndex) : super(selectedIndex);
}
