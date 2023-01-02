import SwiftUI

enum Ingredients: String, CaseIterable {
    case spinach = "Spinach"
    case broccoli = "Broccoli"
    case carrot = "Carrot"
    case pasta = "Pasta"
    case tomatoSauce = "Tomato Sauce"
    
    var isIngredient: Bool {
        return self == .spinach || self == .broccoli || self == .carrot || self == .pasta || self == .tomatoSauce
    }
}
