void main() {
  final list = [1,3,4,2,5];

  sum(list);
  reverse(list);
  squareSum(list);
  grow(list);
  isFactor(3,6);
  evenOrOdd(3);
  isAllCaps('hello I AM DONALD');
}

// Sum of list
void sum(List<int> list) {
  if (list.isEmpty) return;

  int sum2 = 0;
  list.forEach((x) => sum2 += x);
  print(sum2);
  int sum = list.fold(0,(current, next) => current + next * next);
  list.reduce((current, next) => current + next);
  print(sum);
}

// Reverse order
void reverse(List<int> list) {

  for (int x = list.length - 1; x >= 0; x--) {
    print(list[x]);
  }
  print(List.from(list.reversed));
  print([...list.reversed]);
}

// Sum of Square of each item in list
void squareSum(List<int> list) {
  if (list.isEmpty) return;

  int sum = list.fold(0, (current, next) => current + next * next);
  print(sum);
}

// Sum of Multiplication of list
void grow(List<int> list) {
  if (list.isEmpty) return;

  int sum = list.fold(1, (current, next) =>   current * next);
  print(sum);
}

// Is Factor, 2 number can multiply together to get another number
void isFactor(int factor, int base) {
  final isFactor = base % factor == 0 ? true : false;
  base % factor == 0;
  base.remainder(factor) == 0;
  print(isFactor);
}

// Check if number is Even or Odd number
void evenOrOdd(int number) {
  print(number.remainder(2) == 0 ? 'Even' : 'Odd');
  print(number % 2 == 0);
  print(['Even', 'Odd'][number % 2]);
  print(['Even', 'Odd'][number&1]);
}

// Check if All letters is in Capital
void isAllCaps(String str) {
  print(str.toUpperCase() == str);

  for (int x = 0; x < str.length; x++) {
    if (str[x].toUpperCase() == str[x]) return print('TRUE');
  }
  return print('FALSE');
}


