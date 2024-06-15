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
    @State var Right: Bool = false
    @State var y = Int.random(in: 1...20)
    @Binding var quizResult: QuizResult

   
    var body: some View {
        Text("\(x)+\(y)= ?")
     
        let z = x + y
        
        if z == providedAnswer {
            Button(action: {
                // Set quizResult to .wasCorrect
                quizResult = .wasCorrect
                // Print statement for debugging
                print("QuizResult set to .wasCorrect")
                // Dismiss the view
                showing = false
                // Print statement for debugging
                print("Sheet dismissed")

            }) {
                        Image(systemName: "checkmark.rectangle.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 60, height: 60)
                    }
            
                        }
        else{
            Text("type in the correct answer")
        }
        TextField("Enter number", value: $providedAnswer, format: .number)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .keyboardType(.numberPad)
    }
}



//import SwiftUI
//struct additionView: View {
//    
//    @Binding var showing: Bool
//    @Binding var quizResult: QuizResult
//    
//    var body: some View {
//        VStack {
//            Text("Quiz Question")
//            // Your quiz question goes here
//            
//            Button(action: {
//                // Set quizResult to .wasCorrect
//                quizResult = .wasCorrect
//                // Print statement for debugging
//                print("QuizResult set to .wasCorrect")
//                // Dismiss the view
//                showing = false
//                // Print statement for debugging
//                print("Sheet dismissed")
//            }) {
//                Text("Submit Answer")
//            }
//        }
//        .padding()
//    }
//}



