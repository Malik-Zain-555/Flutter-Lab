// Task 3

import 'dart:io';

void main() {
  stdout.write("Enter a number (n): ");
  int n = int.parse(stdin.readLineSync()!);

  for (int i = 1; i <= n; i++) {
    // har row ke liye loop
    for (int j = 1; j <= i; j++) {
      stdout.write("$j "); // ek row ke numbers
    }
    print(""); // new line
  }
}

