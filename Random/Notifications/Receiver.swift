import Foundation

// Publishes any new numbers that it receives notifications for
@MainActor
class Receiver: ObservableObject {
  @Published var number: Int = 0
    init() {
        Task {
            await registerForNotification()
        }
    }
}

extension Receiver {
    func registerForNotification() async {
        
        // By passing nil, we are not filtering by object type
        // Receiving a stream of notifications from randomNumberNotification
        // Transforming a stream of Any? into a Notifier object
        let notifications = NotificationCenter.default.notifications(named: randomNumberNotification,
                                                                     object: nil) // Stream of notifications
            .map(\.object) // Stream of Any?
            .map{object in object as? Notifier} // Stream of Notifier?
            .filter{ notifier in notifier != nil} // Stream of non-nil Notifier?
            .map{nonNilNotifier in nonNilNotifier!} // Stream of Notifer
        
        // The new way
        // We'd like to do this
        for await notification in notifications {
            if let object = notification.object as? Notifier {
                // Get the number provided by the notification
                self.number = object.number
            }
        }
        
    }
}
