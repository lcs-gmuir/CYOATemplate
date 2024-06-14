//
//  PageView.swift
//  CYOATemplate
//
//  Created by Russell Gordon on 2023-06-01.
//

import SwiftUI
import AVFoundation

struct PageView: View {

    // MARK: Stored properties
    
    @State private var currentFont: String = "System"
    
    @State private var currentSize: Int = 20
    @State var Texty: String = ""
    @State private var speechSynthesizer: AVSpeechSynthesizer?


    // Access the book state through the environment
    @Environment(BookStore.self) var book
    

    // The view model for the page view
    //
    // Making the view model a constant means
    // when the page number changes in the BookStore class
    // (which is fed to the initializer of PageViewModel)
    // then PageView will be re-loaded, updating the text
    let viewModel: PageViewModel
    // MARK: Computed properties
    
    func textT(){
        let utterance = AVSpeechUtterance(string: Texty)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-GB")
        let synthesizer = AVSpeechSynthesizer()
        synthesizer.speak(utterance)

    }
    var body: some View {
        
        ScrollView {
            VStack(spacing: 10) {
                                          
                // Has the page loaded yet?
                if let page = viewModel.page {
                    
                    // DEBUG
                    let _ = print("Text for this page is:\n\n\(page.narrative)\n\n")
                    let _ = print("Image for this page is:\n\n\(page.image ?? "(no image for this page)")\n\n")
                    
                    let Texty = page.narrative
                    
                    
                   
                    Text(
                        try! AttributedString(
                            markdown: page.narrative,
                            options: AttributedString.MarkdownParsingOptions(
                                interpretedSyntax: .inlineOnlyPreservingWhitespace
                            )
                        )
                    )
                        //.font(.title2)
                    .font(.custom(book.reader.currentFont ?? "System", fixedSize: CGFloat(book.reader.currentSize ?? 20)))
                    
                    Button(action: {
                                // Call the TextT function when the button is pressed
                                textT()
                            }) {
                                Text("Press Me")
                                    .padding()
                                    .background(Color.blue)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                            }
                        
                    
                    if let image = page.image {
                        
                        Image(image)
                            .resizable()
                            .scaledToFit()
                            .border(.black, width: 1)
                            .padding(.vertical, 10)

                    }
                    

                    Divider()
                    
                    
                    if page.isAnEndingOfTheStory {

                        // Page is an ending, so tell the user,
                        // and allow book to be re-started
                        Text("The End")
                            .bold()
                            .onTapGesture {
                                book.showCoverPage()
                            }

                    } else {
                        
                        // Page is not an ending, so show available edges
                        EdgesView(
                            viewModel: EdgesViewModel(book: book)
                        )
                        
                    }
                    
                    
                    Spacer()

                } else {
                    
                    // Page still loading from database
                    ProgressView()
                }
                
            }
            .padding()
        }

    }
}

#Preview {
    PageView(
        viewModel: PageViewModel(book: BookStore())
    )
}
