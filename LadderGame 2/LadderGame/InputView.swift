//
//  InputView.swift
//  LadderGame
//
//  Created by JINA on 2018. 2. 6..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct InputView {
    // 참여인원 입력 받기
    func getPlayer() -> Array<String> {
        print("참여할 사람 이름을 입력하세요. (이름은 쉽표(,)로 구분하세요)")
        let player = readLine() ?? ""
        let names = player.split(separator: ",").map(String.init)
        return names
    }
    
    func playerCount() -> Int{
        let inputNames = getPlayer()
        let names = inputNames.split(separator: ",")
        let countPlayer = names.count
        
        return countPlayer
    }
    
    // 사다리 높이 입력 받기
    func getLadderHeight() -> Int {
        print("최대 사다리 높이는 몇 개인가요?")
        let ladderHeight = readLine()
        return Int(ladderHeight ?? "") ?? 0
    }
}

