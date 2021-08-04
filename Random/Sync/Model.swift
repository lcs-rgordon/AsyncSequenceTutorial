class Model: Sequence {
    
    func makeIterator() -> ModelIterator {
        return ModelIterator()
    }

}

