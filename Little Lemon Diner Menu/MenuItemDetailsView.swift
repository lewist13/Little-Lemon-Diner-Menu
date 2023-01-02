import SwiftUI

struct MenuItemDetailsView: View {
    var menuItem: menuItem
    
    var body: some View {
        VStack {
            Image("little_lemon_logo.png")
                .resizable()
                .scaledToFit()
                .padding(3)
            VStack(spacing: 10) {
                Text("Price:")
                    .font(.headline)
                Text("10.99")
                VStack(spacing: 10) {
                    Text("Ordered:")
                        .font(.headline)
                    Text("1,000")
                    Text("Ingredients:")
                        .font(.headline)
                    ForEach(menuItem.ingredients, id: \.self) { ingredient in
                        Text(ingredient)
                    }
                }
            }
            .padding(.vertical, 10)
        }
        .navigationBarTitle(menuItem.title)
    }
}


struct MenuItemDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        let food = menuItem(title: "Grilled Cheese Sandwich", ingredients: ["Bread", "Cheese", "Butter"])
        let drink = menuItem(title: "Lemonade", ingredients: ["Lemons", "Sugar", "Water"])
        let dessert = menuItem(title: "Chocolate Cake", ingredients: ["Flour", "Sugar", "Eggs", "Chocolate"])

        return Group {
            NavigationView {
                MenuItemDetailsView(menuItem: food)
            }
            .previewDisplayName("Food")

            NavigationView {
                MenuItemDetailsView(menuItem: drink)
            }
            .previewDisplayName("Drink")

            NavigationView {
                MenuItemDetailsView(menuItem: dessert)
            }
            .previewDisplayName("Dessert")
        }
    }
}


