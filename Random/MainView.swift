import SwiftUI

struct MainView {
  @State private var value: String = ""
  @State private var isRunning = false
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
      let numbers = AsyncStream(Int.self) { continuation in // Building a stream of Ints
          self.isRunning = true
          
          // Runs on main thread, the numbers are generated, but they can't be picked up outside the task
          Task {
              while self.isRunning {
                  sleep(1)
                  // Put the result outside the task, so the "for await" can "hear" it
                  let number = Int.random(in: 1...99)
                  print(number)
                  continuation.yield(number)
              }
          }
          
      }
      
      // Wait for the next number to pop out of the stream
      for await number in numbers {
          // Update the value
          self.value = number.description
      }
  }
}

