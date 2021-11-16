//
//  ContentView.swift
//  ListTest
//
//  Created by Ivan Valero on 04/11/2021.
//

import SwiftUI

struct ContentView: View {
    

    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some View {
        NavigationView {
            Form {
                ForEach(listViewModel.dataList, id: \.id) { listFull in
                    
                    NavigationLink (destination: ListDetailView(listTest: listFull)) {
                    
                        RowView(listTest: listFull)
                    
                    }
                }
            }
            .navigationBarTitle("Listado de textos")
        }.onAppear{
            listViewModel.getList()
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
