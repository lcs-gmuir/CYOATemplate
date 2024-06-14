//
//  CoverView.swift
//  CYOATemplate
//
//  Created by Russell Gordon on 2024-06-02.
//

import SwiftUI
import AVFoundation

@available(iOS 17.0, *)
struct CoverView: View {
    
    var player: AVPlayer {
        //loads the video from the app
        let fileUrl = Bundle.main.url(forResource: "sample_video", withExtension: "mp4")!
        return AVPlayer(url: fileUrl)
    }
    
    static let color0 = Color(red: 8/255, green: 28/255, blue: 83/255);
  
    static let color1 = Color(red: 67/255, green: 78/255, blue: 215/255);
  

let gradient = Gradient(colors: [color0, color1]);
    
    
    // MARK: Stored properties
    
    // Access the book state through the environment
    @Environment(BookStore.self) var book

    
    // MARK: Computed properties
    @State private var scale = 1.0
    var body: some View {
        
            VStack {
                
            
                    ZStack{
                        
                        covervideo()
                            .edgesIgnoringSafeArea(.all)
                        
                        VStack{
                            // Show the cover
                            Text("The Magical Forest")
                                .font(.system(size: 50))
                                        .fontWeight(.bold)
                                        .foregroundColor(Color(red: 0.68, green: 0.85, blue: 10)) // Light pastel blue color
                                        
                            
                            
                            Button(action: {
                                book.beginReading()
                                scale += 0.5
                                   }) {
                                       Text("Begin Story")
                                           .font(.title) 
                                           .foregroundColor(.white)
                                           .padding()
                                           .background((RadialGradient(
                                            gradient: gradient,
                                            center: .center,
                                            startRadius: 1,
                                            endRadius: 100)))
                                                         .cornerRadius(25)
                                           .scaleEffect(scale)
                                                  .animation(.linear(duration: 1), value: scale)
                                                  .padding(.top, 170)
                                           
                                   }
                                                           
                                
                            
                                  
                               
                          
                        }
                        
                    
                    
                    
                }
                

                
            }
            
        }
    }


#Preview {
    CoverView()
}
