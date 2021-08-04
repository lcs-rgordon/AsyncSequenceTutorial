import Foundation

let randomNumberNotification = Notification.Name("randomNumberNotification")

class Notifier {
  var number: Int = 0
  
  func postRandomNumber() {
    number = Int.random(in: 1...99)
    NotificationCenter.default
      .post(name: randomNumberNotification,
            object: self)
  }
}
