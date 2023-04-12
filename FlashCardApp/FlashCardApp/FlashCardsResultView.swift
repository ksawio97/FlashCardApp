import SwiftUI

struct FlashCardsResultView: View {
    let correctAnswers: Int
    let totalQuestions: Int
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Quiz Results")
                .font(.title)
                .fontWeight(.bold)
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Correct Answers: \(correctAnswers)")
                Text("Incorrect Answers: \(totalQuestions - correctAnswers)")
            }
            .font(.headline)
            
            Spacer()
            
            Button(action: {
                // do something when the button is tapped
            }) {
                Text("Restart Quiz")
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding(.vertical, 10)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(5)
            }
        }
        .padding()
        .navigationTitle("Quiz Results")
    }
}

struct FlashCardsResultView_Previews: PreviewProvider {
    static var previews: some View {
        FlashCardsResultView(correctAnswers: 2, totalQuestions: 2)
    }
}
