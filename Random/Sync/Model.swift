class Model {
  private(set) var numbers: [Int] = []
  
  init() {
    for _ in 1...5 {
      let number = Int.random(in: 1...99)
      numbers.append(number)
    }
  }
}
