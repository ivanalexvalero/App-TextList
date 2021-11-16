//
//  ListViewModel.swift
//  ListTest
//
//  Created by Ivan Valero on 04/11/2021.
//

import Foundation




final class ListViewModel: ObservableObject {
    
    var refreshData = { () -> () in}
    
    @Published var dataList: [ListTest] = [] {
        didSet {
            refreshData()
        }
    }
    
    func getList() {
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            
            guard let data = data else { return }
                
            do {
                
                let jsonDataList = try! JSONDecoder().decode([ListTest].self, from: data)
//                DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                DispatchQueue.main.async {
    
                        self.dataList = jsonDataList
                }
                
            } catch {
                print("Error")
            }
                
                
                
                
            
            
        }.resume()
        
        
    }
    
    
    
}
