void main() {
  List<String> names = [ "John Doe", "Alice Brown", "Charlie Doe", "Bob Smith","Alice Smith","Daniel Brown"];
  sortNames(names);
}


void sortNames(List<String> names) {

  final list = names.map((e) {
    final value = e.split(' ');
    return value[1] + ' ' + value[0];
  }).toList();

  list.sort();

  final sortedList = list.map((e) {
    final value = e.split(' ');
    return value[1] + ' ' + value[0];
  }).toList();

  print(sortedList);
}



////Write a Dart function that takes a list of names (first and last) and returns a new list sorted alphabetically by last name first. If two people share the same last name, sort them by first name.

// Example input:
// List<String> names = [ "John Doe", "Alice Brown", "Charlie Doe", "Bob Smith","Alice Smith","Daniel Brown"];

// Example output:
// ["Alice Brown", "Daniel Brown", "John Doe", "Charlie Doe", "Alice Smith", "Bob Smith"]
