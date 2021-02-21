import SwiftUI

struct ContentView: View {
    var body: some View {
        IngredientListView()
            .environmentObject(IngredientListViewModel())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
