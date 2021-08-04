class AsyncModel: AsyncSequence {
    typealias Element = Int     // Must state that each element in the sequence is an integer
    
    func makeAsyncIterator() -> AsyncModelIterator {
        return AsyncModelIterator()
    }
}
