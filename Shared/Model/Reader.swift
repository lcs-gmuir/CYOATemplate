//
//  Reader.swift
//  CYOATemplate
//
//  Created by Russell Gordon on 2024-06-02.
//

import Foundation
import SwiftUI

struct Reader: Identifiable, Codable {
    
    var id: Int?
    var name: String?
    var prefersDarkMode: Bool
    var currentBackground: String?
    var currentFont: String?
    var currentColour: String?
    var currentSize: Int?
    var lastPageReadId: Int?

    // When decoding and encoding from JSON, translate snake_case
    // column names into camelCase
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case currentBackground = "current_background"
        case currentFont = "current_font"
        case currentColour = "current_colour"
        case currentSize = "current_size"
        case prefersDarkMode = "prefers_dark_mode"
        case lastPageReadId = "last_page_read_id"
    }
    
    // convert currentColour string to Color
     var color: Color {
         return colorFromString(currentColour ?? "primary")
     }
    
    // Function to convert colour strings to SwiftUI Color
    func colorFromString(_ color: String) -> Color {
        switch color.lowercased() {
        case "primary":
            return Color.primary
        case "red":
            return Color.red
        case "orange":
            return Color.orange
        case "yellow":
            return Color.yellow
        case "green":
            return Color.green
        case "blue":
            return Color.blue
        case "purple":
            return Color.purple
        default:
            return Color.primary // Fallback to primary color
        }
    }

 }


