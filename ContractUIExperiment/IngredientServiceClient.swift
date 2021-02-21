import Foundation

protocol IngredientServiceClient {
    typealias FetchIngredientsResponseHandler = (Result<[Ingredient], Error>) -> Void

    func fetchIngredients(onResponse: @escaping FetchIngredientsResponseHandler)
}

final class DefaultIngredientServiceClient: IngredientServiceClient {
    func fetchIngredients(onResponse: @escaping FetchIngredientsResponseHandler) {
        let ingredients = [
            Ingredient(name: "Butter"),
            Ingredient(name: "Flour"),
            Ingredient(name: "Sugar"),
            Ingredient(name: "Eggs"),
            Ingredient(name: "Lemons")
        ]
        DispatchQueue.main.async {
            onResponse(.success(ingredients))
        }
    }
}
