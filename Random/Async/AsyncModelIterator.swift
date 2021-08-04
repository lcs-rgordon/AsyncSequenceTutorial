import Foundation

class AsyncModelIterator: AsyncIteratorProtocol {
    func next() async -> Int? {
        sleep(1) // Sleep for one second, then return something
        return Int.random(in: 1...99)
    }
}
