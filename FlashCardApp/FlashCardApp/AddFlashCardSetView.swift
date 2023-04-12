import SwiftUI

struct AddFlashCardSetView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var flashCardSets: [FlashCardSet]
    
    @State private var newSet = FlashCardSet(title: "", flashcards: [])
    @State private var setName = ""
    @State private var showAddCard = false
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 20) {
                TextField("Enter set name", text: $setName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                if showAddCard {
                    VStack(alignment: .leading, spacing: 10) {
                        TextField("Front", text: $newSet.flashcards[newSet.flashcards.count - 1].front)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        TextField("Back", text: $newSet.flashcards[newSet.flashcards.count - 1].back)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                }
                
                HStack {
                    Spacer()
                    Button(action: {
//                        if showAddCard {
//                            newSet.flashcards.append(FlashCard(front: "", back: ""))
//                        }
                        if !showAddCard{
                            newSet.flashcards.append(FlashCard(front: "", back: ""))
                        }
                        showAddCard.toggle()
                    }) {
                        if showAddCard {
                            Text("Done")
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                                .padding(.vertical, 10)
                                .frame(maxWidth: .infinity)
                                .background(Color.blue)
                                .cornerRadius(5)
                        } else {
                            Text("Add Card")
                                .fontWeight(.semibold)
                                .foregroundColor(.blue)
                        }
                    }
                    .padding(.top, 20)
                    .padding(.bottom, 5)
                    Spacer()
                }
                
                Button(action: {
                    newSet.title = setName
                    flashCardSets.append(newSet)
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Add Set")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding(.vertical, 10)
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(5)
                }
                .disabled(setName.isEmpty || newSet.flashcards.isEmpty)
            }
            .padding()
            .navigationTitle("Add Flash Card Set")
        }
    }
}

struct AddFlashCardSetView_Previews: PreviewProvider {
    static var previews: some View {
        AddFlashCardSetView(flashCardSets: .constant([]))
    }
}

