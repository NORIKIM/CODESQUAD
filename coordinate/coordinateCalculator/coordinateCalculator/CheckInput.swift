//
//  Check.swift
//  coordinateCalculator
//
//  Created by JINA on 03/12/2018.
//  Copyright © 2018 JINA KIM. All rights reserved.
//

import Foundation

//오류 메시지
enum ErrorMessage: String {
    case reEntered = "입력 형식을 확인 후 다시 입력해주세요"
    case notRect = "직사각형 혹은 정사각형이 아닙니다. 다시입력해주세요"
    case outOfRange = "입력 가능한 숫자 범위는 0~24 입니다."
    case notErr
}

// 사용자의 입력을 확인하여 MyPoint에 값 넘김
struct CheckInput {
    //사용자의 입력 가능한 문자 확인
    private static func isInputable(_ input: String) -> Bool {
        let customCharacterSet = CharacterSet.init(charactersIn: "(),-0123456789")
        let checkedInput = input.trimmingCharacters(in: customCharacterSet)
        guard checkedInput.isEmpty else {
            return false
        }
        return true
    }
    
    //사용자의 입력값에 괄호가 있는지 확인
    private static func hasParenthesis(_ input: String) -> Bool {
        return input.contains("(") && input.contains(")")
    }
    
    //사용자의 입력값의 개수 확인하기
    private static func canBecomeFigure(_ inputNum: [Int?]) -> Bool {
        return inputNum.count >= 2
    }
    
    //사용자의 입력값이 허용범위인지 확인
    private static func isWhitinRange(_ inputNum: [Int?]) -> Bool {
        for nums in inputNum {
            let numRange = nums! >= 0 && nums! <= 24
            if numRange == false {
                return numRange
            }
        }
        return true
    }
    
    //사각형을 그릴 때 입력받은 좌표가 정사각형 or 직사각형인지 확인
    private static func ableToDrawRect(_ inputNum: [Int?]) -> Bool {
        return inputNum[2] == inputNum[4] && inputNum[3] == inputNum[1] && inputNum[6] == inputNum[0] && inputNum[7] == inputNum[5]
    }
    
    static func validData(_ input: String, _ inputNum: [Int?]) -> ErrorMessage {
        guard isInputable(input) && hasParenthesis(input) && canBecomeFigure(inputNum) else { return .reEntered }
        guard isWhitinRange(inputNum) else { return .outOfRange }
        if inputNum.count == 8{
            guard ableToDrawRect(inputNum) else { return .notRect }
        }
        return .notErr
    }
}

