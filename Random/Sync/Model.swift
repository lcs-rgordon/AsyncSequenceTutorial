class Model {
  private var numbers: [Int] = []
  
  init() {
    for _ in 1...5 {
      let number = Int.random(in: 1...99)
      numbers.append(number)
    }
  }
}

extension Model: Sequence {
    func makeIterator() -> IndexingIterator<[Int]> {
        numbers.makeIterator()
    }
}
