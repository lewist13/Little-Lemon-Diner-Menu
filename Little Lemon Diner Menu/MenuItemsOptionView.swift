import SwiftUI

struct FilterHeader: View {
    let title: String

    var body: some View {
        Text(title)
    }
}

struct MenuItemsOptionView: View {
    var body: some View {
        NavigationView {
            List {
                Section(header: FilterHeader(title: Filter.selectedCategories.rawValue)) {
                    ForEach(MenuCategory.allCases, id: \.self) { filter in
                        if filter.isCategory {
                            Text(filter.rawValue)
                        }
                    }
                }
                Section(header: FilterHeader(title: Filter.sortBy.rawValue)) {
                    ForEach(Filter.allCases, id: \.self) { filter in
                        if filter.isSortBy {
                            Text(filter.rawValue)
                        }
                    }
                }
            }
            .navigationBarTitle("Filter")
            .navigationBarItems(trailing:
                Button(action: {
                    print("Done button pressed...")
                }) {
                    NavigationLink(destination: MenuItemsView()) {
                        Text("Done")
                    }
                }
            )
        }
    }
}

enum Filter: String, CaseIterable {
    case mostPopular = "Most Popular"
    case price = "Price $-$$$"
    case alphabeticalOrder = "A-Z"
    case selectedCategories = "SELECTED CATEGORIES"
    case sortBy = "SORT BY"

    var isSortBy: Bool {
        return self == .mostPopular || self == .price || self == .alphabeticalOrder
    }
}


struct MenuItemsOptionView_Previews: PreviewProvider {
    static var previews: some View {
        MenuItemsOptionView()
    }
}
