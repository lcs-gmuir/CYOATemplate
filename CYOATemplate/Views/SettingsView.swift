//
//  SettingsView.swift
//  CYOATemplate
//
//  Created by Russell Gordon on 2024-06-02.
//

import SwiftUI

struct SettingsView: View {
    
    // MARK: Stored properties
    
    @State private var currentFont: String = "System"
    
    @State private var currentSize: Int = 20
    
    // Whether this view is showing in the sheet right now
    @Binding var showing: Bool
    
    // Access the book state through the environment
    @Environment(BookStore.self) var book
    
    // MARK: Computed properties
    var body: some View {
        
        // Make the connection to the book state a two-way binding
        // (By default when accessing through environment it is read-only)
        @Bindable var book = book
        
        // The user interface
        return NavigationStack {
            ScrollView{
                VStack {
                    
//                    Toggle(isOn: $book.reader.preferstextspeech) {
//                        Label {
//                            Text("Text To Speech")
//                        } icon: {
//                            Image(systemName: "moonphase.first.quarter")
//                        }
//                    }
                    
                    Toggle(isOn: $book.reader.prefersDarkMode) {
                        Label {
                            Text("Dark Mode")
                        } icon: {
                            Image(systemName: "moonphase.first.quarter")
                        }
                    }
                    
                    .padding()
                    
                    HStack{
                        VStack{
                            // user can select a font type
                            Text("Select Font")
                                .bold()
                                .underline()
                            
                            
                            Button("Font 1"){
                                book.reader.currentFont = "Superclarendon-Light"
                                currentFont = "Superclarendon-Light"
                            }
                            .font(.custom("Superclarendon-Light", size: 30))
                            .foregroundColor(.primary)
                            
                            
                            Button("Font 2"){
                                book.reader.currentFont = "Chalkduster"
                                currentFont = "Chalkduster"
                            }
                            .font(.custom("Chalkduster", size: 30))
                            .foregroundColor(.primary)
                            
                            
                            Button("Font 3"){
                                book.reader.currentFont = "TimesNewRomanPSMT"
                                currentFont = "TimesNewRomanPSMT"
                            }
                            .font(.custom("TimesNewRomanPSMT", size: 30))
                            .foregroundColor(.primary)
                            
                            Button("Font 4"){
                                book.reader.currentFont = "SnellRoundhand-Bold"
                                currentFont = "SnellRoundhand-Bold"
                            }
                            .font(.custom("SnellRoundhand-Bold", size: 30))
                            .foregroundColor(.primary)
                        }
                        
                        VStack{
                            // user can select a font size
                            Text("Select Font Size")
                                .bold()
                                .underline()
                                .padding()
                            
                            
                            Button("Aa"){
                                book.reader.currentSize = 15
                                currentSize = 15
                            }
                            .font(.custom("System", size: 15))
                            .foregroundColor(.primary)

                            
                            Button("Aa"){
                                book.reader.currentSize = 20
                                currentSize = 20
                            }
                            .font(.custom("System", size: 20))
                            .foregroundColor(.primary)
                            
                            
                            Button("Aa"){
                                book.reader.currentSize = 25
                                currentSize = 25
                            }
                            .font(.custom("System", size: 25))
                            .foregroundColor(.primary)
                            
                            Button("Aa"){
                                book.reader.currentSize = 35
                                currentSize = 35
                            }
                            .font(.custom("System", size: 35))
                            .foregroundColor(.primary)
                            
                        }
                        
                    }
                 
                  
                    Spacer()
                    
                    
                }
            }
            
            .padding()
            .navigationTitle("Statistics")
            // Toolbar to show buttons for various actions
            .toolbar {
                
                // Hide this view
                ToolbarItem(placement: .automatic) {
                    Button {
                        showing = false
                    } label: {
                        Text("Done")
                            .bold()
                    }
                    
                }
            }
            
        }
        // Dark / light mode toggle
        .preferredColorScheme(book.reader.prefersDarkMode ? .dark : .light)
        
    }
}

#Preview {
    SettingsView(showing: Binding.constant(true))
}
