import SwiftUI

struct FlashCardView: View {
    let flashcard: FlashCard
    
    @State private var isShowingAnswer = false
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.white)
                .shadow(radius: 10)
            
            VStack {
                Text(isShowingAnswer ? flashcard.back : flashcard.front)
                    .font(.largeTitle)
                    .foregroundColor(.black)
                    .padding()
                
                Button(isShowingAnswer ? "Show Front" : "Show Back") {
                    isShowingAnswer.toggle()
                }
            }
        }
        .frame(width: 300, height: 600)
    }
}

struct FlashCard_Previews: PreviewProvider {
    static var previews: some View {
        FlashCardView(flashcard: FlashCard(front: "Front", back: "Back"))
    }
}
