// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let agents = try? newJSONDecoder().decode(Agents.self, from: jsonData)

import Foundation
//
//// MARK: - Agents
//struct Agents: Codable, Hashable{
//    var status: Int
//    var agent: [Agent]
//}

// MARK: - Datum
struct Agent: Codable , Hashable {
    var id: Int
    var uuid, displayName, description, developerName: String
    var characterTags: [String]?
    var displayIcon, displayIconSmall: String
    var bustPortrait, fullPortrait, fullPortraitV2: String?
    var killfeedPortrait: String
    var background: String?
    var backgroundGradientColors: [String]?
    var assetPath: String
    var isFullPortraitRightFacing, isPlayableCharacter, isAvailableForTest, isBaseContent: Bool
    var role: Role?
    var abilities: [Ability]
    var voiceLine: VoiceLine

    enum CodingKeys: String, CodingKey {
        case uuid, displayName, id
        case description = "description"
        case developerName, characterTags, displayIcon, displayIconSmall, bustPortrait, fullPortrait, fullPortraitV2, killfeedPortrait, background, backgroundGradientColors, assetPath, isFullPortraitRightFacing, isPlayableCharacter, isAvailableForTest, isBaseContent, role, abilities, voiceLine
    }
}

// MARK: - Ability
struct Ability: Codable, Hashable{
    var slot: Slot
    var displayName, description: String
    var displayIcon: String?

    enum CodingKeys: String, CodingKey {
        case slot, displayName
        case description = "description"
        case displayIcon
    }
}

enum Slot: String, Codable, Hashable{
    case ability1 = "Ability1"
    case ability2 = "Ability2"
    case grenade = "Grenade"
    case passive = "Passive"
    case ultimate = "Ultimate"
}

// MARK: - Role
struct Role: Codable, Hashable {
    var uuid: String
    var displayName: DisplayName
    var description: String
    var displayIcon: String
    var assetPath: String

    enum CodingKeys: String, CodingKey {
        case uuid, displayName
        case description = "description"
        case displayIcon, assetPath
    }
}

enum DisplayName: String, Codable, Hashable{
    case controller = "Controller"
    case duelist = "Duelist"
    case initiator = "Initiator"
    case sentinel = "Sentinel"
}

// MARK: - VoiceLine
struct VoiceLine: Codable, Hashable {
    var minDuration, maxDuration: Double
    var mediaList: [MediaList]
}

// MARK: - MediaList
struct MediaList: Codable, Hashable {
    var id: Int
    var wwise: String
    var wave: String
}
