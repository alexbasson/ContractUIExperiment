import Foundation

protocol IngredientServiceClient {
    typealias FetchIngredientsResponseHandler = (Result<[Ingredient], Error>) -> Void

    func fetchIngredients(onResponse: @escaping FetchIngredientsResponseHandler)
}

final class HttpIngredientServiceClient: IngredientServiceClient {
    let baseUrl: String

    init(baseUrl: String) {
        self.baseUrl = baseUrl
    }

    convenience init() {
        self.init(baseUrl: "")
    }

    func fetchIngredients(onResponse: @escaping FetchIngredientsResponseHandler) {
        let ingredients = [
            Ingredient(name: "Butter"),
            Ingredient(name: "Flour"),
            Ingredient(name: "Sugar"),
            Ingredient(name: "Eggs"),
            Ingredient(name: "Lemons")
        ]
        guard let url = URL(string: baseUrl + "/ingredients") else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                onResponse(.success(ingredients))
            }
        }.resume()
    }
}
