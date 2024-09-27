// import java.io.FileNotFoundException
import scala.io.Source
import CharImplicits._


object Main {

  trait Part {
    def recoverDigits(line: String): Seq[Int]

    def recoverCalibrationValue(line: String): Int = {
      val digits = recoverDigits(line)
      if digits.size == 0 then return 0
      10 * digits.head + digits.last
    }

    def sumCalibrationValues(input: Seq[String]): Int =
      input.map(recoverCalibrationValue).sum
  }

  object Part1 extends Part {
    override def recoverDigits(line: String): Seq[Int] =
      line.flatMap(_.asDigitOption)
  }

  object Part2 extends Part {

    private val digitStrings = Map(
      1 -> "one",
      2 -> "two",
      3 -> "three",
      4 -> "four",
      5 -> "five",
      6 -> "six",
      7 -> "seven",
      8 -> "eight",
      9 -> "nine",
    )

    override def recoverDigits(line: String): Seq[Int] = {
      line.tails.flatMap(tail =>
        tail.headOption match {
          case Some(c) if c.isDigit =>
            Some(c.asDigit)
          case _ =>
            digitStrings.find((_, text) =>
              tail.startsWith(text)).map(_._1)
        }
      ).toSeq
    }
  }

  def readInput(filename: String): Seq[String] = {
    Source.fromFile(filename).getLines.toSeq
    // getClass.getResourceAsStream(filename) match {
    //   case null => throw new FileNotFoundException(filename)
    //   case stream => Source.fromInputStream(stream).getLines.toSeq
    // }
  }

  def main(args: Array[String]): Unit = {
    val filename = if (args.size > 0) args(0) else "input.txt"
    lazy val input = readInput(filename)
    println(Part1.sumCalibrationValues(input))
    println(Part2.sumCalibrationValues(input))
  }
}
