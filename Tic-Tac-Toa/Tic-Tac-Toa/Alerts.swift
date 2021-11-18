//
//  Alerts.swift
//  Tic-Tac-Toa
//
//  Created by Mobarak on 11/18/21.
//

import SwiftUI

struct AlertItem:Identifiable {
    let id = UUID()
    var title:Text
    var message:Text
    var buttonTitle : Text
    
    
}

struct AlertContext {

    static  let humanWin = AlertItem( title:  Text("You win!"),
                                      message: Text("You are so smart"),
                                      buttonTitle: Text("Ok"))
    
    static let computerWin = AlertItem( title:  Text("You lost the game!"),
                                        message: Text("Good luck next time"),
                                        buttonTitle: Text("Ok"))
    static let draw = AlertItem( title:  Text("Game draw"),
                                 message: Text("Good play"),
                                 buttonTitle: Text("Try again"))
}
