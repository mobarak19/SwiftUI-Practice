//
//  ContentView.swift
//  Tic-Tac-Toa
//
//  Created by Mobarak on 11/9/21.
//

import SwiftUI

struct ContentView: View {
    let columns : [GridItem] = [GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible())]
    
    @State private var moves: [Move?] = Array(repeating: nil, count: 9)
    @State private var isGameBoardDisabled = false
    var body: some View {
        
        GeometryReader{ geometry in
            VStack{
                Spacer()
                LazyVGrid(columns: columns,spacing:5){
                    ForEach(0..<9){ i in
                        ZStack{
                            Circle()
                                .foregroundColor(.red).opacity(0.5)
                                .frame(width: geometry.size.width/3-15, height: geometry.size.width/3-15)
                            Image(systemName: moves[i]?.indicator ?? "")
                                .resizable()
                                .frame(width: 40, height: 40)
                                .foregroundColor(.white)

                        }.onTapGesture {
                            if isSqureOcupied(in: moves, forIndex: i){
                                return
                            }
                            moves[i] = Move(player: .human, boardIndex: i)
                            isGameBoardDisabled = true
                            //check if win or draw
                       
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                                let computerPosition = determineComputerPosition(in: moves)
                                moves[computerPosition] = Move(player: .computer, boardIndex: computerPosition)
                                isGameBoardDisabled = false 
                            }
                        }
                    }
                }
                Spacer()
            }.padding()
            .disabled(isGameBoardDisabled)
            
        }

    }
    
    
    
    func isSqureOcupied(in moves:[Move?],forIndex:Int) -> Bool {
        return moves.contains(where: {$0?.boardIndex==forIndex})
    }
    
    func determineComputerPosition(in moves:[Move?]) -> Int {
        var movePosition = Int.random(in: 0..<9)
        while isSqureOcupied(in: moves, forIndex: movePosition) {
            movePosition = Int.random(in: 0..<9)
        }
        return movePosition
    }
    
    
}

enum Player {
    case human, computer
}

struct Move {
    let player:Player
    let boardIndex:Int
    var indicator: String{
        return player == .human ? "xmark":"circle"
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
