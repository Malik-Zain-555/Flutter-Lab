// 1. Takes input of 6 integers from the user and stores them in a list.
// 2. Print the following:
// o The sum of odd numbers.
// o The smallest number in the list.
void main() {
  List<int> number = [1, 2, 3, 4, 5];

  // Odd numbers ka sum
  int result = 0;
  number.forEach((k) {
    if (k % 2 != 0) {
      result += k;
    }
  });

  // Smallest number
  int smallest = number[0];
  number.forEach((k) {
    if (k < smallest) {
      smallest = k;
    }
  });

  print("Sum of odd numbers: $result");
  print("Smallest number: $smallest");
}
