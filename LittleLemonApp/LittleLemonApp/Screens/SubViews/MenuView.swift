//
//  MenuView.swift
//  LittleLemonApp
//
//  Created by Pradeep Kumara on 4/25/25.
//

import SwiftUI

struct MenuView: View {
    @State var searchText:String = ""
    @State var searchCategory:String = ""
    
    var body: some View {
        VStack{
            AppHeroView(
                bottomView: AppTextView(label: "Search menu", value: $searchText,iconName: "magnifyingglass",onTapAction: {
                    if(!searchText.isEmpty && !searchCategory.isEmpty){
                        searchCategory = ""
                    }
                })
            )
            VStack(alignment: .leading){
                Text("ORDER FOR DELIVERY!").bold()
                ScrollView(.horizontal) {
                    HStack{
                        ForEach(allMenuCategory,id: \.self) { category in
                            Button {
                                searchText = ""
                                if(searchCategory == category){
                                    searchCategory = ""
                                }
                                else{
                                    searchCategory = category
                                }
                            } label: {
                                MenuCategoryListItem(title: category,isSelected: searchCategory == category)
                            }

                        }
                    }
                }.padding(.vertical,10)
                Divider()
            }.padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
            FetchedObjects(predicate: buildPredicate(), sortDescriptors: buildSortDescriptors()){ (dishes:[Dish]) in
                List {
                    ForEach(dishes, id: \.self) { dish in
                        
                        MenuItemView(dish: dish)

                    }
                }
                .listStyle(PlainListStyle())
            }
        }
    }
    
    func buildSortDescriptors()->[NSSortDescriptor]{
        return [
            NSSortDescriptor(
                key: "title",
                ascending: true,
                selector: #selector(NSString .localizedCaseInsensitiveCompare)
            ),
        ]
    }
    
    func buildPredicate() -> NSPredicate {
        if(searchText != ""){
            return NSPredicate(format: "title CONTAINS[cd] %@", searchText)
        }
        else if(searchCategory != ""){
            return NSPredicate(format: "category CONTAINS[cd] %@", searchCategory)
        }
        else
        {
          return NSPredicate(format: "TRUEPREDICATE")
        }
    }
}



struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
