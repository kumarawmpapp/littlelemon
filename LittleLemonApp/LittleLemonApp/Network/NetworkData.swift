//
//  NetworkData.swift
//  LittleLemonApp
//
//  Created by Pradeep Kumara on 4/25/25.
//

import CoreData
import SwiftUI

let kURL = "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json"

struct Menu {
    
    func getMenuData(_ context:NSManagedObjectContext){
        PersistenceController.shared.clear()
        let url = URL(string: kURL)!
        let request = URLRequest(url: url)
        let downloadTask = URLSession.shared.dataTask(with: request){data, response, error in
            if let data = data{
                let dish = try! JSONDecoder().decode(MenuList.self, from: data)
                if(!dish.menu.isEmpty){
                    for dishItem in dish.menu
                    {
                        let myDish = Dish(context: context)
                        myDish.image = dishItem.image
                        myDish.price = dishItem.price
                        myDish.title = dishItem.title
                        myDish.desc = dishItem.description
                        myDish.category = dishItem.category
                    }
                    try? context.save()
                }
            }
        }
        downloadTask.resume()
    }
}
