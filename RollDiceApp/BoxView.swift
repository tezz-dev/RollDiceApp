//
//  BoxView.swift
//  RollDiceApp
//
//  Created by tezz on 12/12/20.
//

import SwiftUI

struct BoxView: View {
    @State var horizontalTranslation: Bool = true
    
    @State var diceNumber: Int = 1
    @State var intermediateDiceNumber: Int = 1
    
    @State var axes: [[Int]] = [[1,2,6,5], [1,3,6,4], [2,3,5,4]]
    @State var currentXAxis: [Int] = [1,2,6,5]
    
    @State var currentYAxis: [Int] = [1,3,6,4]
    
    var body: some View {
        VStack {
            
            
            
            ZStack {
                
                Rectangle()
                    .frame(width: 100, height: 100)
                    .foregroundColor(Color.green)
                    .overlay(
                        NumberThreeView()
                    )
                    .rotation3DEffect(
                        Angle.degrees(Double(horizontalTranslation ? diceNumberToXDegrees(3) : diceNumberToXDegrees(3))),
                        axis: (x: horizontalTranslation ? 0.0 : 1.0, y: horizontalTranslation ? 1.0 : 0.0, z: 0.0),
                        perspective: 0
                    )
                    
                    
                    .animation(.linear)
                    .offset(x: horizontalTranslation ? CGFloat(diceNumberToXOffset(3)) : 0, y: horizontalTranslation ? 0 : CGFloat(diceNumberToYOffset(3)))
                
                Rectangle()
                    .frame(width: 100, height: 100)
                    .foregroundColor(Color.green)
                    .overlay(
                        NumberOneView()
                    )
                    .rotation3DEffect(
                        Angle.degrees(Double(horizontalTranslation ? diceNumberToXDegrees(1) : diceNumberToXDegrees(1))),
                        axis: (x: horizontalTranslation ? 0.0 : 1.0, y: horizontalTranslation ? 1.0 : 0.0, z: 0.0),
                        perspective: 0
                    )
                    
                    
                    .animation(.linear)
                    .offset(x: horizontalTranslation ? CGFloat(diceNumberToXOffset(1)) : 0, y: horizontalTranslation ? 0 : CGFloat(diceNumberToYOffset(1)))
                    
                    
                
                Rectangle()
                    .frame(width: 100, height: 100)
                    .foregroundColor(Color.green)
                    .overlay(
                        NumberTwoView()
                    )
                    
                    .rotation3DEffect(
                        Angle.degrees(Double(horizontalTranslation ? diceNumberToXDegrees(2) : diceNumberToXDegrees(2))),
                        axis: (x: horizontalTranslation ? 0.0 : 1.0, y: horizontalTranslation ? 1.0 : 0.0, z: 0.0),
                        perspective: 0
                    )
                    
                    .animation(.linear)
                    .offset(x: horizontalTranslation ? CGFloat(diceNumberToXOffset(2)) : 0, y: horizontalTranslation ? 0 : CGFloat(diceNumberToYOffset(2)))
                
                
                Rectangle()
                    .frame(width: 100, height: 100)
                    .foregroundColor(Color.green)
                    .overlay(
                        NumberSixView()
                    )

                    .rotation3DEffect(
                        Angle.degrees(Double(horizontalTranslation ? diceNumberToXDegrees(6) : diceNumberToXDegrees(6))),
                        axis: (x: horizontalTranslation ? 0.0 : 1.0, y: horizontalTranslation ? 1.0 : 0.0, z: 0.0),
                        perspective: 0
                    )
                    
                    
                    .animation(.linear)
                    
                    .offset(x: horizontalTranslation ? CGFloat(diceNumberToXOffset(6)) : 0, y: horizontalTranslation ? 0 : CGFloat(diceNumberToYOffset(6)))
                
                
                Rectangle()
                    .frame(width: 100, height: 100)
                    .foregroundColor(Color.green)
                    .overlay(
                        NumberFiveView()
                    )
                    .rotation3DEffect(
                        Angle.degrees(Double(horizontalTranslation ? diceNumberToXDegrees(5) : diceNumberToXDegrees(5))),
                        axis: (x: horizontalTranslation ? 0.0 : 1.0, y: horizontalTranslation ? 1.0 : 0.0, z: 0.0),
                        perspective: 0
                    )
                    
                    .animation(.linear)
                    .offset(x: horizontalTranslation ? CGFloat(diceNumberToXOffset(5)) : 0, y: horizontalTranslation ? 0 : CGFloat(diceNumberToYOffset(5)))
                
                Rectangle()
                    .frame(width: 100, height: 100)
                    .foregroundColor(Color.green)
                    .overlay(
                        NumberFourView()
                    )
                    .rotation3DEffect(
                        Angle.degrees(Double(horizontalTranslation ? diceNumberToXDegrees(4) : diceNumberToXDegrees(4))),
                        axis: (x: horizontalTranslation ? 0.0 : 1.0, y: horizontalTranslation ? 1.0 : 0.0, z: 0.0),
                        perspective: 0
                    )
                    
                    .animation(.linear)
                    
                    .offset(x: horizontalTranslation ? CGFloat(diceNumberToXOffset(4)) : 0, y: horizontalTranslation ? 0 : CGFloat(diceNumberToYOffset(4)))

            }
            
            
            
            
            VStack {
                Text("Currently rolled = \(self.diceNumber)")
                
                Text("Currently rolled = \(self.horizontalTranslation ? "True" : "False")")
            }
        }
        .gesture(DragGesture(minimumDistance: 60, coordinateSpace: .local)
                            .onEnded({ value in
                                if value.translation.width < -60 {
                                    self.currentYAxis = getCurrentAxis(diceNumber)
                                    self.intermediateDiceNumber = self.diceNumber
                                    self.diceNumber = diceNumberLeft(diceNumber)
                                    withAnimation {
                                        self.horizontalTranslation = true
                                    }
                                    print("left")
                                }

                                else if value.translation.width > 60 {
                                    self.currentYAxis = getCurrentAxis(diceNumber)
                                    self.intermediateDiceNumber = self.diceNumber
                                    self.diceNumber = diceNumberRight(diceNumber)
                                    withAnimation {
                                        self.horizontalTranslation = true
                                    }
                                    print("right")
                                }
                                else if value.translation.height < -60 {
                                    self.currentXAxis = getCurrentAxis(diceNumber)
                                    self.intermediateDiceNumber = self.diceNumber
                                    self.diceNumber = diceNumberUp(diceNumber)
                                    withAnimation {
                                        self.horizontalTranslation = false
                                    }
                                    print("up")
                                }

                                else if value.translation.height > 60 {
                                    self.currentXAxis = getCurrentAxis(diceNumber)
                                    self.intermediateDiceNumber = self.diceNumber
                                    self.diceNumber = diceNumberDown(diceNumber)
                                    withAnimation {
                                        self.horizontalTranslation = false
                                    }
                                    print("down")
                                }
                            }
                            )
                 )
    }
    
    func diceNumberRight(_ diceValue: Int) -> Int {
        if currentXAxis == axes[0] {
            switch diceValue {
                case 1:
                    return 5
                case 2:
                    return 1
                case 6:
                    return 2
                case 5:
                    return 6
                default:
                    return 5
            }
        }
        else if currentXAxis == axes[1] {
            switch diceValue {
                case 1:
                    return 4
                case 3:
                    return 1
                case 6:
                    return 3
                case 4:
                    return 6
                default:
                    return 0
            }
        }
        else {
            switch diceValue {
                case 2:
                    return 4
                case 3:
                    return 2
                case 5:
                    return 3
                case 4:
                    return 5
                default:
                    return 0
            }
        }
    }
    
    func diceNumberLeft(_ diceValue: Int) -> Int {
        if currentXAxis == axes[0] {
            switch diceValue {
                case 1:
                    return 2
                case 2:
                    return 6
                case 6:
                    return 5
                case 5:
                    return 1
                default:
                    return 0
            }
        }
        else if currentXAxis == axes[1] {
            switch diceValue {
                case 1:
                    return 3
                case 3:
                    return 6
                case 6:
                    return 4
                case 4:
                    return 1
                default:
                    return 0
            }
        }
        else {
            switch diceValue {
                case 2:
                    return 3
                case 3:
                    return 5
                case 5:
                    return 4
                case 4:
                    return 2
                default:
                    return 0
            }
        }
        
    }
    
    func diceNumberUp(_ diceValue: Int) -> Int {
        if currentYAxis == axes[0] {
            switch diceValue {
                case 1:
                    return 2
                case 5:
                    return 1
                case 6:
                    return 5
                case 2:
                    return 6
                default:
                    return 0
            }
        }
        else if currentYAxis == axes[1] {
            switch diceValue {
                case 1:
                    return 4
                case 4:
                    return 6
                case 6:
                    return 3
                case 3:
                    return 1
                default:
                    return 0
            }
        }
        else {
            switch diceValue {
                case 2:
                    return 4
                case 4:
                    return 5
                case 5:
                    return 3
                case 3:
                    return 2
                default:
                    return 0
            }
        }
        
    }
    
    func diceNumberDown(_ diceValue: Int) -> Int {
        if currentYAxis == axes[0] {
            switch diceValue {
                case 1:
                    return 5
                case 5:
                    return 6
                case 6:
                    return 2
                case 2:
                    return 1
                default:
                    return 0
            }
        }
        else if currentYAxis == axes[1] {
            switch diceValue {
                case 1:
                    return 3
                case 4:
                    return 1
                case 6:
                    return 4
                case 3:
                    return 6
                default:
                    return 0
            }
        }
        else {
            switch diceValue {
                case 2:
                    return 3
                case 4:
                    return 2
                case 5:
                    return 4
                case 3:
                    return 5
                default:
                    return 0
            }
        }
    }
    
    func getCurrentAxis(_ diceValue: Int) -> [Int] {
        for axis in axes {
            var count = 0
            for value in axis {
                if diceValue == value {
                    break
                }
                count += 1
            }
            if count == 4 {
                return axis
            }
        }
        return axes[1]
    }
    
    func diceNumberToXOffset(_ diceValue: Int) -> Int {
        switch diceValue {
            case 1:
                switch diceNumber {
                    case 1:
                        return 0
                    case 2:
                        return -50
                    case 6:
                        return 50
                    case 5:
                        return 50
                    case 3:
                        return -50
                    case 4:
                        return 50
                    default:
                        return 50
                }
                
            case 2:
                switch diceNumber {
                    case 1:
                        return 50
                    case 2:
                        return 0
                    case 6:
                        return -50
                    case 5:
                        return 50
                    case 3:
                        return -50
                    case 4:
                        return 50
                    default:
                        return 50
                }
                
                
            case 6:
                switch diceNumber {
                    case 1:
                        return 50
                    case 2:
                        return 50
                    case 6:
                        return 0
                    case 5:
                        return -50
                    case 3:
                        return 50
                    case 4:
                        return -50
                    default:
                        return 50
                }
                
            case 5:
                switch diceNumber {
                    case 1:
                        return -50
                    case 2:
                        return 50
                    case 6:
                        return 50
                    case 5:
                        return 0
                    case 3:
                        return 50
                    case 4:
                        return -50
                    default:
                        return 50
                }
                
            case 3:
                switch diceNumber {
                    case 1:
                        return 50
                    case 2:
                        return 50
                    case 6:
                        return -50
                    case 5:
                        return -50
                    case 3:
                        return 0
                    case 4:
                        return 50
                    default:
                        return 50
                }
                
            case 4:
                switch diceNumber {
                    case 1:
                        return -50
                    case 2:
                        return -50
                    case 6:
                        return 50
                    case 5:
                        return 50
                    case 3:
                        return 50
                    case 4:
                        return 0
                    default:
                        return 50
                }
            
            
            default:
                return 0
        }
    }
    
    func diceNumberToXDegrees(_ diceValue: Int) -> Int {
        switch diceValue {
            case 1:
                switch diceNumber {
                    case 1:
                        return 0
                    case 2:
                        return -90
                    case 6:
                        return -90
                    case 5:
                        return -90
                    case 3:
                        return -90
                    case 4:
                        return -90
                    default:
                        return -90
                }
                
            case 2:
                switch diceNumber {
                    case 1:
                        return -90
                    case 2:
                        return 0
                    case 6:
                        return -90
                    case 5:
                        return -90
                    case 3:
                        return -90
                    case 4:
                        return -90
                    default:
                        return -90
                }
                
                
            case 6:
                switch diceNumber {
                    case 1:
                        return -90
                    case 2:
                        return -90
                    case 6:
                        return 0
                    case 5:
                        return -90
                    case 3:
                        return -90
                    case 4:
                        return -90
                    default:
                        return -90
                }
                
            case 5:
                switch diceNumber {
                    case 1:
                        return -90
                    case 2:
                        return -90
                    case 6:
                        return -90
                    case 5:
                        return 0
                    case 3:
                        return -90
                    case 4:
                        return -90
                    default:
                        return -90
                }
                
            case 3:
                switch diceNumber {
                    case 1:
                        return -90
                    case 2:
                        return -90
                    case 6:
                        return -90
                    case 5:
                        return -90
                    case 3:
                        return 0
                    case 4:
                        return -90
                    default:
                        return -90
                }
                
            case 4:
                switch diceNumber {
                    case 1:
                        return -90
                    case 2:
                        return -90
                    case 6:
                        return -90
                    case 5:
                        return -90
                    case 3:
                        return -90
                    case 4:
                        return 0
                    default:
                        return -90
                }
            
            
            default:
                return 0
        }
    }
    
    func diceNumberToYOffset(_ diceValue: Int) -> Int {
        switch diceValue {
            case 1:
                switch diceNumber {
                    case 1:
                        return 0
                    case 2:
                        return -50
                    case 6:
                        return 50
                    case 5:
                        return 50
                    case 3:
                        return 50
                    case 4:
                        return -50
                    default:
                        return 50
                }
                
            case 2:
                switch diceNumber {
                    case 1:
                        return 50
                    case 2:
                        return 0
                    case 6:
                        return -50
                    case 5:
                        return 50
                    case 3:
                        return 50
                    case 4:
                        return -50
                    default:
                        return 50
                }
                
                
            case 6:
                switch diceNumber {
                    case 1:
                        return 50
                    case 2:
                        return 50
                    case 6:
                        return 0
                    case 5:
                        return -50
                    case 3:
                        return -50
                    case 4:
                        return 50
                    default:
                        return 50
                }
                
            case 5:
                switch diceNumber {
                    case 1:
                        return -50
                    case 2:
                        return 50
                    case 6:
                        return 50
                    case 5:
                        return 0
                    case 3:
                        return -50
                    case 4:
                        return 50
                    default:
                        return 50
                }
                
            case 3:
                switch diceNumber {
                    case 1:
                        return -50
                    case 2:
                        return -50
                    case 6:
                        return 50
                    case 5:
                        return 50
                    case 3:
                        return 0
                    case 4:
                        return 50
                    default:
                        return 50
                }
                
            case 4
            :
                switch diceNumber {
                    case 1:
                        return 50
                    case 2:
                        return 50
                    case 6:
                        return -50
                    case 5:
                        return -50
                    case 3:
                        return 50
                    case 4:
                        return 0
                    default:
                        return 50
                }
            
            
            default:
                return 0
        }
    }
    
    func diceNumberToYDegrees(_ diceValue: Int) -> Int {
        switch diceValue {
            case 1:
                switch diceNumber {
                    case 1:
                        return 0
                    case 2:
                        return -90
                    case 6:
                        return -90
                    case 5:
                        return -90
                    case 3:
                        return -90
                    case 4:
                        return -90
                    default:
                        return -90
                }
                
            case 2:
                switch diceNumber {
                    case 1:
                        return -90
                    case 2:
                        return 0
                    case 6:
                        return -90
                    case 5:
                        return -90
                    case 3:
                        return -90
                    case 4:
                        return -90
                    default:
                        return -90
                }
                
                
            case 6:
                switch diceNumber {
                    case 1:
                        return -90
                    case 2:
                        return -90
                    case 6:
                        return 0
                    case 5:
                        return -90
                    case 3:
                        return -90
                    case 4:
                        return -90
                    default:
                        return -90
                }
                
            case 5:
                switch diceNumber {
                    case 1:
                        return -90
                    case 2:
                        return -90
                    case 6:
                        return -90
                    case 5:
                        return 0
                    case 3:
                        return -90
                    case 4:
                        return -90
                    default:
                        return -90
                }
                
            case 3:
                switch diceNumber {
                    case 1:
                        return -90
                    case 2:
                        return -90
                    case 6:
                        return -90
                    case 5:
                        return -90
                    case 3:
                        return 0
                    case 4:
                        return -90
                    default:
                        return -90
                }
                
            case 4:
                switch diceNumber {
                    case 1:
                        return -90
                    case 2:
                        return -90
                    case 6:
                        return -90
                    case 5:
                        return -90
                    case 3:
                        return -90
                    case 4:
                        return 0
                    default:
                        return -90
                }
            
            
            default:
                return 0
        }
    }
    
    func oppositeDiceNumber(_ diceValue: Int) -> Int {
        return 7 - diceValue
    }
}

struct BoxView_Previews: PreviewProvider {
    static var previews: some View {
        BoxView()
    }
}
