//
//  ListDetailView.swift
//  ListTest
//
//  Created by Ivan Valero on 04/11/2021.
//

import SwiftUI

struct ListDetailView: View {
    
    @State var isLoading = true
    
    var listTest: ListTest
    
  
    
    var body: some View {
        VStack {
            Text("Texto número \(listTest.id)")
                .font(.title)
                .fontWeight(.bold)
                .padding()
            Divider()
            
            Text(listTest.title)
                .font(.title2)
                .padding()
            
            Text(listTest.body)
                .font(.footnote)
                
            
            Spacer()
        }
        .redacted(reason: isLoading ? .placeholder : [])
        .onAppear(perform: {
            viewData()
        })

        
    }
    
    func viewData() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            isLoading = false
        }
    }
    
}

struct ListDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ListDetailView(listTest: ListTest(userId: 0, id: 0, title: "No title", body: "No body"))
    }
}
