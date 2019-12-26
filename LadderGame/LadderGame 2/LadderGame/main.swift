//
//  main.swift
//  LadderGame
//
//  Created by JINA on 2017. 12. 21..
//  Copyright © 2017년 김지나. All rights reserved.
//

import Foundation

// main (실행 부)
func main() {
    let player = InputView().getPlayer()
    let countPlayer = player.count
    let ladderHeight = InputView().getLadderHeight()
    ResultView().makeLadder(countPlayer, player, ladderHeight)
}
main()

