import SwiftUI

struct FlashCardsTrainingView: View {
    let set: FlashCardSet
    
    @State var id: Int = 0
    @State var bgColor = Color.white
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        Grid{
            Text("Cards Left: \(set.flashcards.count - 1 - id)")
            FlashCardView(flashcard: set.flashcards[id])
        }
        .padding()
        .background(bgColor)
        .gesture(DragGesture(minimumDistance: 20, coordinateSpace: .local)
            .onEnded({ value in
                //no more card left
                if id == set.flashcards.count - 1{
                    presentationMode.wrappedValue.dismiss()
                    return
                }
                
                id = min(id + 1, set.flashcards.count - 1)
                if value.translation.width < 0 {
                    withAnimation {
                        bgColor = Color.red
                    }
                } else if value.translation.width > 0 {
                    withAnimation {
                        bgColor = Color.green
                    }
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    bgColor = Color.white
                }
            })
        )
    }
}

struct FlashCardsTrainingView_Previews: PreviewProvider {
    static var previews: some View {
        FlashCardsTrainingView(set: FlashCardSet(title: "Set 1", flashcards: [
            FlashCard(front: "What is the capital of France?", back: "Paris"),
            FlashCard(front: "What is the largest country in the world?", back: "Russia"),
            FlashCard(front: "What is the currency of Japan?", back: "Yen")
        ]))
    }
}
