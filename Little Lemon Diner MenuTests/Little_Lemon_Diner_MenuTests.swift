import XCTest
@testable import Little_Lemon_Diner_Menu

class MenuItemTests: XCTestCase {
    func testMenuItemTitle() {
        // Given
        let title = "Grilled Cheese Sandwich"
        let item = menuItem(title: title, ingredients: ["Bread", "Cheese", "Butter"])

        // When
        let itemTitle = item.title

        // Then
        XCTAssertEqual(itemTitle, title)
    }

    func testMenuItemIngredients() {
        // Given
        let ingredients = ["Bread", "Cheese", "Butter"]
        let item = menuItem(title: "Grilled Cheese Sandwich", ingredients: ingredients)

        // When
        let itemIngredients = item.ingredients

        // Then
        XCTAssertEqual(itemIngredients, ingredients)
    }
}
