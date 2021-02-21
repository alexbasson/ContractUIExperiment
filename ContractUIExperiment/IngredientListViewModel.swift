import Foundation

final class IngredientListViewModel: ObservableObject {
    @Published var ingredients: [Ingredient] = []

    let ingredientServiceClient: IngredientServiceClient

    init(ingredientServiceClient: IngredientServiceClient) {
        self.ingredientServiceClient = ingredientServiceClient
    }

    convenience init() {
        self.init(ingredientServiceClient: HttpIngredientServiceClient())
    }

    func fetchIngredients() {
        ingredientServiceClient.fetchIngredients { result in
            switch result {
            case .success(let ingredients):
                self.ingredients = ingredients
            case .failure(let error):
                print(error)
            }
        }
    }
}
