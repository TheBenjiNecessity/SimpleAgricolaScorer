//
//  ASPlayer.swift
//  SimpleAgricolaScorer
//
//  Created by Benjamin Wishart on 2016-07-17.
//  Copyright © 2016 Benjamin Wishart. All rights reserved.
//

enum HouseType {
    case Wood
    case Clay
    case Stone
}

enum Field {
    case Fields
    case Pastures
    case Vegetables
    case Grain
    case Sheep
    case Boar
    case Cattle
    case UnusedSpaces
    case FencedStables
    case NumberOfRooms
    case RoomType
    case NumberOffamilyMembers
}

class ASPlayer {
    var title = ""
    
    let vegetableRule = ASRangesRule(pointRanges: [(0,0),(1,1),(2,2),(3,3),(4,-1)], translate: nil)
    let grainRule = ASRangesRule(pointRanges: [(0,0),(1,3),(4,5),(6,7),(8,-1)], translate: nil)
    
    let sheepRule = ASRangesRule(pointRanges: [(0,0),(1,3),(4,5),(6,7),(8,-1)], translate: nil)
    let boarRule = ASRangesRule(pointRanges: [(0,0),(1,2),(3,4),(5,6),(7,-1)], translate: nil)
    let cattleRule = ASRangesRule(pointRanges: [(0,0),(1,1),(2,3),(4,5),(6,-1)], translate: nil)
    
    let roomsRule = ASInputRule(per: 1)
    
    let membersRule = ASInputRule(per: 3)
    
    let plowedFieldsRule = ASRangesRule(pointRanges: [(0,1),(2,2),(3,3),(4,4),(5,-1)], translate: nil)
    
    let fencedPasturesRule = ASRangesRule(pointRanges: [(0,0),(1,1),(2,2),(3,3),(4,-1)], translate: nil)
    
    let unusedSpacesRule = ASInputRule(per: -1)
    
    let fencedStablesRule = ASInputRule(per: 1)
    
    init(title: String) {
        self.title = title
    }
    
    func displayTitle() -> String {
        return title + " Player"
    }
    
    func calculateScore() -> Int {
        var result = 0
        
        result += vegetableRule.points
        result += grainRule.points
        result += sheepRule.points
        result += boarRule.points
        result += cattleRule.points
        result += roomsRule.points
        result += membersRule.points
        result += plowedFieldsRule.points
        result += fencedStablesRule.points
        result += unusedSpacesRule.points
        result += fencedPasturesRule.points
        
        return result
    }
}
