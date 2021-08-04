import SwiftUI

struct MainView {
  @State private var value: String = ""
  let numbers = AsyncModel()
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
      // Put this in a task because pressing the "Next" button cannot be asycnronous
      Task {
          await startSequence()
      }
  }
    
  private func startSequence() async {
      for await number in numbers {
          self.value = number.description
      }
  }
}

