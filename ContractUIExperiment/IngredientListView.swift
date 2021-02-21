import SwiftUI

struct IngredientListView: View {
    @EnvironmentObject var viewModel: IngredientListViewModel

    var body: some View {
        ForEach(viewModel.ingredients) { ingredient in
            Text(ingredient.name)
        }
        .onAppear {
            viewModel.fetchIngredients()
        }
    }
}

struct IngredientListView_Previews: PreviewProvider {
    static var previews: some View {
        IngredientListView()
            .environmentObject(IngredientListViewModel())
    }
}
