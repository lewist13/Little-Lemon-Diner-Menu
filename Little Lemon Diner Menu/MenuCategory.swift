import SwiftUI

enum MenuCategory: String, CaseIterable {
    case food = "Food"
    case drink = "Drink"
    case dessert = "Dessert"
    
    var isCategory: Bool {
        return self == .food || self == .drink || self == .dessert
    }
}
