//
//  DishMenuView.swift
//  LittleLemonApp
//
//  Created by Pradeep Kumara on 4/25/25.
//

import SwiftUI

struct DishMenuView: View {
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
                                MenuCategoryItem(title: category,isSelected: searchCategory == category)
                            }

                        }
                    }
                }.padding(.vertical,10)
                Divider()
            }.padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
            FetchedObjects(predicate: buildPredicate(), sortDescriptors: buildSortDescriptors()){ (dishes:[Dish]) in
                List {
                    ForEach(dishes, id: \.self) { dish in
                        
                        DishMenuItemView(dish: dish)

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

struct MenuCategoryItem:View {
    let title:String
    let isSelected:Bool
    
    init(title: String,isSelected:Bool) {
        self.title = title
        self.isSelected = isSelected
    }
    
    var body: some View{
        Text(title)
            .bold()
            .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
            .background(isSelected ? Color.primaryBlue : Color.secondaryWhite)
            .cornerRadius(30)
            .foregroundColor(isSelected ? Color.secondaryWhite : Color.primaryBlue)
    }
}

struct DishMenuItemView:View{
    let dish:Dish
    
    init(dish: Dish) {
        self.dish = dish
    }
    
    var body: some View{
        ZStack{
            HStack{
                VStack(alignment: .leading){
                    Text("\(dish.title ?? "")")
                        .font(.karlaLeadText)
                        .padding(EdgeInsets(top: 2, leading: 0, bottom: 2, trailing: 0))
                    Text("\(dish.desc ?? "")")
                        .lineLimit(2)
                        .fontWeight(.light)
                        .font(.karlaParagraph)
                        .foregroundColor(.primaryBlue)
                    Text("$ \(dish.price ?? "")")
                        .fontWeight(.heavy)
                        .font(.karlaLeadText)
                        .foregroundColor(.primaryBlue)
                        .padding(EdgeInsets(top: 2, leading: 0, bottom: 2, trailing: 0))
                }
                Spacer()
                AsyncImage(
                    url:URL(string: "\(dish.image ?? "")"),
                    content: { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: 100, maxHeight: 100)
                    },
                    placeholder: {
                        Rectangle().frame(width:  100, height: 70).foregroundColor(.secondaryBlack)
                    }
                )
            }
            NavigationLink(destination: DishDetailView(dish: dish)) {
                
            }.buttonStyle(PlainButtonStyle())
        }
    }
    
}

struct DishDetailView: View {
    let dish: Dish
    
    init(dish: Dish) {
        self.dish = dish
    }
    
    var body: some View {
        ScrollView{
            VStack{
                AsyncImage(
                    url:URL(string: "\(dish.image ?? "")"),
                    content: { image in
                        image.resizable()
                            .frame(maxWidth: .infinity)
                            .aspectRatio(contentMode: .fit)
                    },
                    placeholder: {
                        Rectangle()
                            .frame(maxWidth: .infinity, minHeight:300, maxHeight:300)
                            .foregroundColor(.secondaryBlack)
                    }
                )
                Text("$ \(dish.price ?? "")")
                    .fontWeight(.heavy)
                    .font(.karlaLeadText)
                    .foregroundColor(.primaryBlue)
                    .frame(maxWidth: .infinity,alignment: .trailing)
                    .padding(.horizontal,10)
                    .padding(.vertical,5)
                Text("\(dish.desc ?? "")")
                    .lineLimit(2)
                    .fontWeight(.light)
                    .font(.karlaParagraph)
                    .foregroundColor(.primaryBlue)
                    .padding(.horizontal,10)
                    .padding(.vertical,5)
            }.navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text("\(dish.title ?? "")")
                            .font(.karlaLeadText)
                            .padding(EdgeInsets(top: 2, leading: 0, bottom: 2, trailing: 0))
                    }
                }
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        DishMenuView()
    }
}
