//
//  Reader.swift
//  CYOATemplate
//
//  Created by Russell Gordon on 2024-06-02.
//

import Foundation

struct Reader: Identifiable, Codable {
    
    var id: Int?
    var name: String?
    var prefersDarkMode: Bool
//    var perfersTextSpeech: Bool
    var currentFont: String?
    var currentSize: Int?
    var lastPageReadId: Int?

    // When decoding and encoding from JSON, translate snake_case
    // column names into camelCase
    enum CodingKeys: String, CodingKey {
        case id
        case name
//        case prefersTextSpeech = "prefers_text_speech"
        case currentFont = "current_font"
        case currentSize = "current_size"
        case prefersDarkMode = "prefers_dark_mode"
        case lastPageReadId = "last_page_read_id"
    }
    
}
