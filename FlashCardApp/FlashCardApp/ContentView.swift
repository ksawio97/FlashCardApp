import SwiftUI

struct ContentView: View {
    @State private var sets: [FlashCardSet] = []
    @State private var showAddSetView : Bool = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(sets) { set in
                    NavigationLink(destination: FlashCardsTrainingView(set: set)) {
                        Text(set.title)
                    }
                    HStack {
                        Text("Delete set")
                        Spacer()
                        Button(action: {
                            self.sets.removeAll(where: { $0.id == set.id })
                        }, label: {
                            Image(systemName: "multiply.circle")
                                .foregroundColor(.red)
                        })
                    }
                }
            }
            .navigationTitle("Flashcard Sets")
            .navigationBarItems(trailing: Button(action: {
                self.showAddSetView = true
            }, label: {
                Image(systemName: "plus")
            }))
            .sheet(isPresented: $showAddSetView, content: {
                AddFlashCardSetView(flashCardSets: $sets)
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
