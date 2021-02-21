import XCTest
@testable import ContractUIExperiment
import PactConsumerSwift

class HttpIngredientServiceClientTest: XCTestCase {
    func test_ItFetchesIngredients() {
        let mockIngredientService = MockService(provider: "ingredient-service", consumer: "ingredient-ios")
        let ingredientServiceClient = HttpIngredientServiceClient(baseUrl: mockIngredientService.baseUrl)

        mockIngredientService
            .given("a list of ingredients exists")
            .uponReceiving("a request for the list of ingredients")
            .withRequest(method: .GET, path: "/ingredients")
            .willRespondWith(
                status: 200,
                headers: ["Content-Type": "application/json"],
                body: Matcher.eachLike([
                    "id": UUID().uuidString,
                    "name": "Butter"
                ])
            )

        mockIngredientService.run { (testComplete) -> Void in
            ingredientServiceClient.fetchIngredients { (result) in
                switch result {
                case .success(let ingredients): do {
                    XCTAssertTrue(ingredients.count > 0)
                    XCTAssertEqual(ingredients[0].name, "Butter")
                }
                default: XCTFail("expected call to fetch ingredients to succeed")
                }
                testComplete()
            }
        }
    }
}
