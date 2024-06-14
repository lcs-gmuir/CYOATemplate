//
//  Addition.swift
//  CYOATemplate
//
//  Created by Griffin Muir on 2024-06-14.
//

import SwiftUI



struct Addition: View {
    @State var providedAnswer: Int = 1
    @State var x = Int.random(in: 1...20)

    @State var y = Int.random(in: 1...20)

 
    var body: some View {
        Text("\(x)")
        Text("\(y)")
        let z = x + y
        
        if z == providedAnswer {
            Text("yay")
        }
        else{
            Text("nooo")
        }
    }
}


