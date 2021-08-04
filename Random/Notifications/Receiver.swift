import Foundation

// Publishes any new numbers that it receives notifications for
class Receiver: ObservableObject {
  @Published var number: Int = 0
    init() {
        registerForNotification()
    }
}

extension Receiver {
    func registerForNotification() {
        NotificationCenter.default.addObserver(forName: randomNumberNotification,
                                               object: nil,
                                               queue: nil) { notification in
            
            // What do we want to do with the notification?
            // Make sure we have a Notifier object
            // If not, just ignore the notification
            if let object = notification.object as? Notifier {
                // Get the number provided by the notification
                self.number = object.number
            }
        }
    }
}
