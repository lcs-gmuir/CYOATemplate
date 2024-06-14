//
//  Addition.swift
//  CYOATemplate
//
//  Created by Griffin Muir on 2024-06-14.
//

import SwiftUI



struct additionView: View {
    @Binding var showing: Bool

    @State var providedAnswer: Int = 0
    @State var x = Int.random(in: 1...20)

    @State var y = Int.random(in: 1...20)


    var body: some View {
        Text("\(x)+\(y)= ?")
     
        let z = x + y
        
        if z == providedAnswer {
            Text("yay")
        }
        else{
            Text("nooo")
        }
        TextField("Enter number", value: $providedAnswer, format: .number)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .keyboardType(.numberPad)
    }
}


