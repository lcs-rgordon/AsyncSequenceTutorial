import SwiftUI

struct MainView {
  @State private var value: String = ""
  private let numbers = Model()
    
}

extension MainView: View {
  var body: some View {
    VStack (spacing: 40) {
      Text(value)
      Button("Next",
             action: nextNumber)
    }
  }
}

extension MainView {
  private func nextNumber() {
      // Every sequence has an iterator
      // Every iterator has a single method called next()
      var iterator = numbers.makeIterator()
      while let number = iterator.next() {
          print(number.description)
      }
      // This is equivalent to the lines above
//      for number in model.numbers {
//          print(number.description)
//      }
  }
}

