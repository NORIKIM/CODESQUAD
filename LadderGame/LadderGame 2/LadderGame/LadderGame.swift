//
//  LadderGame.swift
//  LadderGame
//
//  Created by JINA on 2018. 2. 6..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

//높이와 참여자를 array로 포함
struct LadderGame {
    var height = 0
    var names:[String]
    
    // 사다리 발판 준비 - 서브
    // false 값을 가지고 있는 배열을 랜덤값에 따라 랜덤하게 false를 true로 바꿈
    func randomChange(_ arrLadder:[Bool]) -> [Bool]{
        var ladderArr:[Bool] = arrLadder
        
        for val in 0 ..< ladderArr.count {
            let random = arc4random_uniform(2)
            ladderArr[val] = (random == 0)
        }
        return ladderArr
    }
    
    // 사다리 발판 준비 - 메인
    // bool값 2차원 배열 만들기
    func makeLadderFrame(_ player:Int, _ ladderHeight:Int) -> [[Bool]] {
        let arrLadder: [[Bool]] = Array(repeating: Array(repeating: false, count: player - 1), count: ladderHeight)
        return arrLadder
    }
    // 불값으로 만든 2차원 배열로 사다리 준비
    func preparadeToMakeFootBoard(_ player: Int, _ ladderHeight: Int) -> [[Bool]] {
        var arrLadder = makeLadderFrame(player,ladderHeight)
        
        for row in 0 ..< ladderHeight {
            arrLadder[row] = randomChange(arrLadder[row])
        }
        return arrLadder
    }
}
