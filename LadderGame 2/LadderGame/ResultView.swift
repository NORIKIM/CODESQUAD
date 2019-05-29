//
//  ResultView.swift
//  LadderGame
//
//  Created by JINA on 2018. 2. 6..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct ResultView {
    // 사다리 발판 만들기
    // 발판 요소
    enum LadderFootBoardElements: String {
        case hasFootBoard = "-----"
        case noFootBoard = "     "
    }
    
    // readyToMakeFootBoard에서 만든 불값2차원배열을 발판 요소들로 대체시키기
    func exchangeWithHorizon(booleanElement: Bool) -> String {
        return booleanElement ? LadderFootBoardElements.hasFootBoard.rawValue : LadderFootBoardElements.noFootBoard.rawValue
    }
    
    // 사다리 모양 완성시키기 - 서브
    func makeWall(_ readyFootBoard:[Bool],_ player: Int) {
        for val in 0 ..< player - 1 {
            let footboard = exchangeWithHorizon(booleanElement: readyFootBoard[val])
            print ("\(footboard)", terminator : "|")
        }
    }
    
    // 사다리 모양 완성시키기 - 메인
    func makeLadder(_ player: Int, _ ladderHeight:Int) {
        let readyFootBoard = LadderGame(height: InputView().getLadderHeight(), names: InputView().getPlayer()).preparadeToMakeFootBoard(player, ladderHeight)
        for row in 0 ..< ladderHeight  {
            print ("|", terminator: "")
            makeWall(readyFootBoard[row], player)
            print()
        }
    }
}
