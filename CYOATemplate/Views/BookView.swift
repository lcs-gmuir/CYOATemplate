//
//  GameView.swift
//  CYOATemplate
//
//  Created by Russell Gordon on 2023-05-29.
//

import Supabase
import SwiftUI

struct BookView: View {
    
    // MARK: Stored properties
    @State private var book = BookStore()

    // Tracks overall state as the reader reads the book
    @State private var showConfirmation: Bool = false
    
    @State private var settingsDetent = PresentationDetent.medium
    // Whether the statistics view is being shown right now
    @State private var showingStatsView = false
    // makes the confirm view not show by default
    // Whether the settings view is being shown right now
    @State private var showingSettingsView = false
    
    //Auto Font
    @State private var currentFont: String = "System"
    
    //Auto Size
    @State private var currentSize: Int = 20
    
    // Track when app is foregrounded, backgrounded, or made inactive
    @Environment(\.scenePhase) var scenePhase

    // MARK: Computed properties
    var body: some View {
        NavigationStack {
            
            VStack {

                if book.isBeingRead {
                    
//                    HStack {
//                        Text("\(book.currentPageId!)")
//                            .font(.custom(book.reader.currentFont ?? "System", fixedSize: CGFloat(book.reader.currentSize ?? 20)))
//                        Spacer()
//                    }
//                    .padding()
                    
                    PageView(
                        viewModel: PageViewModel(book: book)
                    )
                    
                } else {
                    CoverView()
                }

            }
            // Add our object to track state into the environment
            // so it is accessible to the other views in the app
            .environment(book)
            
            // Toolbar to show buttons for various actions
            
            .toolbar {
                // Back button with improved styling
                ToolbarItem(placement: .topBarLeading) {
                    Image(systemName: "arrow.left")
                        .foregroundColor(.blue)
                        .padding()
                        .background(Circle().fill(Color.white).frame(width: 40, height: 40))
                        .shadow(radius: 5)
                        .onTapGesture {
                            showConfirmation.toggle()
                        }
                }

                // Show the statistics view
                ToolbarItem(placement: .automatic) {
                    Button(action: {
                        showingStatsView = true
                    }) {
                        Image(systemName: "chart.pie.fill")
                            .padding()
                            .background(Circle().fill(Color.white).frame(width: 40, height: 40))
                            .shadow(radius: 5)
                    }
                }

                // Show the settings view
                ToolbarItem(placement: .automatic) {
                    Button(action: {
                        showingSettingsView = true
                    }) {
                        Image(systemName: "gear")
                            .padding()
                            .background(Circle().fill(Color.white).frame(width: 40, height: 40))
                            .shadow(radius: 5)
                    }
                }
            }

                
            
            .confirmationDialog("ARE YOU SURE", isPresented: $showConfirmation, titleVisibility: .visible) {
                Button(role: .destructive) {
                    book.showCoverPage()
                    
                } label: {
                    Text("Yes")
                }
            }message: {
                    Text("if you press continue all progress within the book will be lost")
                    .bold()
                }
          
            // Show the statistics view
            .sheet(isPresented: $showingStatsView) {
                StatsView(showing: $showingStatsView)
            }
            // Show the settings view
            .sheet(isPresented: $showingSettingsView) {
                SettingsView(showing: $showingSettingsView)
                    // Make the book state accessible to SettingsView
                    .environment(book)
                    .presentationDetents([.fraction(0.6)])
            }
            // Respond when app is backgrounded, foregrounded, or made inactive
            .onChange(of: scenePhase) {
                if scenePhase == .inactive {
                    print("Active")
                    Task {
                        try await book.saveState()
                        print("Reader's state for this book has been restored.")
                    }
                } else if scenePhase == .active {
                    print("Active")
                    Task {
                        try await book.restoreState()
                        print("Reader's state for this book has been restored.")
                    }
                } else if scenePhase == .background {
                    print("Background")
                }
            }

        }
        // Dark / light mode toggle
        .preferredColorScheme(book.reader.prefersDarkMode ? .dark : .light)

    }
}

#Preview {
    BookView()
}
