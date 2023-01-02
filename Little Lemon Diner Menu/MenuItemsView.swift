import SwiftUI

let foodMenu = [
    menuItem(title: "Grilled Cheese Sandwich", ingredients: ["Bread", "Cheese", "Butter"]),
    menuItem(title: "BLT Sandwich", ingredients: ["Bread", "Bacon", "Lettuce", "Tomato", "Mayonnaise"]),
    menuItem(title: "Taco Salad", ingredients: ["Lettuce", "Ground Beef", "Tomatoes", "Cheese", "Sour Cream", "Taco Chips"]),
    menuItem(title: "Spaghetti and Meatballs", ingredients: ["Spaghetti", "Ground Beef", "Tomato Sauce", "Parmesan Cheese"]),
    menuItem(title: "Fried Chicken", ingredients: ["Chicken", "Flour", "Egg", "Breadcrumbs", "Oil"]),
    menuItem(title: "Baked Salmon", ingredients: ["Salmon", "Olive Oil", "Lemon", "Salt", "Pepper"]),
    menuItem(title: "Beef Stroganoff", ingredients: ["Beef", "Mushrooms", "Onions", "Sour Cream", "Egg Noodles"]),
    menuItem(title: "Vegetarian Chili", ingredients: ["Beans", "Tomatoes", "Onions", "Peppers", "Spices"]),
    menuItem(title: "Burgers and Fries", ingredients: ["Burgers", "Buns", "Lettuce", "Tomatoes", "Fries"]),
    menuItem(title: "Pepperoni Pizza", ingredients: ["Pizza Dough", "Tomato Sauce", "Pepperoni", "Mozzarella Cheese"]),
    menuItem(title: "Grilled Chicken Caesar Salad", ingredients: ["Lettuce", "Chicken", "Parmesan Cheese", "Croutons", "Caesar Dressing"]),
    menuItem(title: "Sushi Roll", ingredients: ["Sushi Rice", "Nori", "Fillings", "Soy Sauce", "Wasabi"])
]

let drinkMenu = [
    menuItem(title: "Coffee", ingredients: ["Coffee Beans", "Water"]),
    menuItem(title: "Tea", ingredients: ["Tea Leaves", "Water"]),
    menuItem(title: "Hot Chocolate", ingredients: ["Milk", "Chocolate"]),
    menuItem(title: "Lemonade", ingredients: ["Lemons", "Sugar", "Water"]),
    menuItem(title: "Soda", ingredients: ["Carbonated Water", "Sugar", "Flavorings"]),
    menuItem(title: "Milkshake", ingredients: ["Milk", "Ice Cream", "Flavorings"]),
    menuItem(title: "Smoothie", ingredients: ["Fruit", "Yogurt", "Milk"]),
    menuItem(title: "Craft Beer", ingredients: ["Barley", "Hops", "Yeast", "Water"])
]

let dessertMenu = [
    menuItem(title: "Chocolate Cake", ingredients: ["Flour", "Sugar", "Eggs", "Chocolate"]),
    menuItem(title: "Cheesecake", ingredients: ["Cream Cheese", "Sugar", "Graham Cracker Crust"]),
    menuItem(title: "Ice Cream Sundae", ingredients: ["Ice Cream", "Hot Fudge", "Sprinkles", "Whipped Cream"]),
    menuItem(title: "Fruit Tart", ingredients: ["Pie Crust", "Custard", "Fresh Fruit"])
]

struct menuItem: Identifiable {
    var id: UUID = UUID()
    var title: String
    var ingredients: [String]
    
    init(title: String, ingredients: [String]) {
            self.title = title
            self.ingredients = ingredients
        }
}

class MenuViewViewModel {
    var foodMenuItems: [MenuItemStruct]
    var drinkMenuItems: [MenuItemStruct]
    var dessertMenuItems: [MenuItemStruct]
    
    init(foodMenuItems: [MenuItemStruct], drinkMenuItems: [MenuItemStruct], dessertMenuItems: [MenuItemStruct]) {
        self.foodMenuItems = foodMenuItems
        self.drinkMenuItems = drinkMenuItems
        self.dessertMenuItems = dessertMenuItems
    }
}

protocol MenuItem {
    var id: UUID { get }
    var price: Double { get }
    var title: String { get }
    var menuCategory: MenuCategory { get }
    var ordersCount: Int { get set }
    var ingredients: [Ingredients] { get set }
}

struct MenuItemStruct: MenuItem {
    var id: UUID
    var price: Double
    var title: String
    var menuCategory: MenuCategory
    var ordersCount: Int
    var ingredients: [Ingredients]
    
    init(id: UUID, price: Double, title: String, menuCategory: MenuCategory, ordersCount: Int, ingredients: [Ingredients]) {
        self.id = id
        self.price = price
        self.title = title
        self.menuCategory = menuCategory
        self.ordersCount = ordersCount
        self.ingredients = ingredients
    }
}

struct ColorSquare: View {
    let color: Color
    
    var body: some View {
        color
            .frame(width: 100, height: 100)
            .padding(10)
    }
}

struct MenuItemsView: View {
    @State var food = foodMenu
    @State var drinks = foodMenu
    @State var dessert = foodMenu
    
    let columns = [
        GridItem(.adaptive(minimum: 80))
        ]
    
    var body: some View {
        NavigationView {
                ScrollView {
                    VStack {
                        Text("Food")
                            .frame(maxWidth: .infinity, alignment: .leadingFirstTextBaseline)
                            .font(.title)
                            .padding(.init(top: -5, leading: 16, bottom: 0, trailing: 0))
                        LazyVGrid(columns: columns, spacing: 5.0) {
                            ForEach(food, id: \.id) { item in
                                NavigationLink(destination: MenuItemDetailsView(menuItem: item)) {
                                    VStack {
                                        ColorSquare(color: .black)
                                        Text(item.title)
                                            .font(.body)
                                    }
                                }
                            }
                        }
                    }
                    VStack {
                        Text("Drinks")
                            .frame(maxWidth: .infinity, alignment: .leadingFirstTextBaseline)
                            .font(.title)
                            .padding(.init(top: -5, leading: 16, bottom: 0, trailing: 0))
                        LazyVGrid(columns: columns, spacing: 5.0) {
                            ForEach(drinks, id: \.id) { item in
                                NavigationLink(destination: MenuItemDetailsView(menuItem: item)) {
                                    VStack {
                                        ColorSquare(color: .black)
                                        Text(item.title)
                                            .font(.body)
                                    }
                                }
                            }
                        }
                    }
                    VStack {
                        Text("Desert")
                            .frame(maxWidth: .infinity, alignment: .leadingFirstTextBaseline)
                            .font(.title)
                            .padding(.init(top: -5, leading: 16, bottom: 0, trailing: 0))
                        LazyVGrid(columns: columns, spacing: 5.0) {
                            ForEach(dessert, id: \.id) { item in
                                NavigationLink(destination: MenuItemDetailsView(menuItem: item)) {
                                    VStack {
                                        ColorSquare(color: .black)
                                        Text(item.title)
                                            .font(.body)
                                    }
                                }
                            }
                        }
                    }
                }
                .navigationBarTitle("Menu")
                .navigationBarItems(trailing:
                    Button(action: {
                        print("Edit button pressed...")
                    }) {
                        NavigationLink(destination: MenuItemsOptionView()) {
                            Image(systemName: "slider.horizontal.3")
                        }
                    }
                )
            }
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MenuItemsView()
    }
}
