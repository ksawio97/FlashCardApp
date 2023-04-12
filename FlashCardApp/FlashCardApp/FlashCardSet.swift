import Foundation

struct FlashCardSet :Identifiable{
    let id = UUID()
    var title: String
    var flashcards: [FlashCard]
    
    init(title: String, flashcards: [FlashCard]) {
        self.title = title
        self.flashcards = flashcards
    }
}
