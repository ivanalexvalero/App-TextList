//
//  RowView.swift
//  ListTest
//
//  Created by Ivan Valero on 04/11/2021.
//

import SwiftUI
//import SkeletonView

//private func loadData() {
//    nameLabel.showSkeleton()
//}


struct RowView: View {
    
    // creamos esta variable para validar la precarga
    @State var isLoading = true
    
    var listTest: ListTest
    
    var body: some View {
        HStack (alignment: .top) {
            Text("\(listTest.id)")
                .font(.title)
                .fontWeight(.bold)
                .padding(5)
                .redacted(reason: isLoading ? .placeholder : [])
                
                
            
            VStack (alignment: .leading) {
                
                Text(listTest.title)
                    .font(.title3)
                
                Text(listTest.body)
                    .font(.footnote)
                    
                    
                
            }
            .redacted(reason: isLoading ? .placeholder : [])
            Spacer()
        }
        // llamamos a la funcion para que desactive la precarga
        .onAppear(perform: {
            viewData()
        })
    }
    
    func viewData() {
        // funcion para desactivar la precarga despues de 3 seg
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            isLoading = false
        }
    }
    
}





struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        RowView(listTest: ListTest(userId: 0, id: 0, title: "No title", body: "No body")).previewLayout(.fixed(width: 400, height: 80))
    }
}
