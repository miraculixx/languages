//> using scala 3.6.1

package jvm

import java.util.Random

@main
def main(number: String): Unit =
  val u = number.toInt // Get an input number from the command line
  val r = Random().nextInt(10000) // Get a random number 0 <= r < 10k
  val a = new Array[Int](10000) // Array of 10k elements initialized to 0
  var i, j = 0
  while i < 10000 do // 10k outer loop iterations
    while j < 100000 do // 100k inner loop iterations, per outer loop iteration
      a(i) = a(i) + j % u // Simple sum
      j += 1
    a(i) += r // Add a random value to each element in array
    i += 1
  println(a(r)) // Print out a single element from the array
