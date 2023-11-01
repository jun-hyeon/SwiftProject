//
//  ContentView.swift
//  MyCalculcator
//
//  Created by 최준현 on 10/27/23.
//

import SwiftUI

enum CalcButton: String{
    case clear = "AC"
    case change = "-/+"
    case add = "+"
    case subtract = "-"
    case divide = "/"
    case multiply = "x"
    case nine = "9"
    case eight = "8"
    case seven = "7"
    case six = "6"
    case five = "5"
    case four = "4"
    case three = "3"
    case two = "2"
    case one = "1"
    case zero = "0"
    case decimal = "."
    case percent = "%"
    case equal = "="
    
}

enum CurrentOper: String{
    case add, subtract, divide, multiply, none
}

struct ContentView: View {
    @State private var value = "0"
    @State var preValue = ""
    @State private var currentOper : CurrentOper = .none
    
    let buttons: [[CalcButton]] = [
        [.clear, .change, .percent, .divide],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .subtract],
        [.one, .two, .three, .add],
        [.zero, .decimal, .equal]
    ]
    
    var body: some View {
        VStack{
                GeometryReader{ geometry in
                    VStack(){
                        HStack{
                            Text(value)
                                .lineLimit(1)
                                .frame(maxWidth: .infinity, alignment: .trailing)
                                .font(.system(size: 60))
                                .fontWeight(.light)
                                .foregroundStyle(.white)
                                .padding()
                        }//HStack
                        ForEach(buttons, id: \.self){ row in
                            HStack{
                                ForEach(row, id: \.self){ button in
                                    MyButton(button: button, value: $value, preValue: $preValue, currentOper: $currentOper)
                                        .frame(
                                            width: getWidth(button: button, proxy: geometry),
                                            height: getHeight(button: button, proxy: geometry)
                                        )
                                }
                            }//HStack
                        }//ForEach
                    }//VStack
                    .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
                }//GeometryReader
        }//VStack
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black, ignoresSafeAreaEdges: .all)
        
                
    }
    func getWidth(button: CalcButton, proxy: GeometryProxy)->CGFloat{
        if button == .zero {
            return proxy.size.width  / 4 * 2
        }else{
            return proxy.size.width  / 4
        }
    }
    
    func getHeight(button: CalcButton, proxy: GeometryProxy)->CGFloat{
        if button == .zero {
            return (proxy.size.height) / 8
        }else{
            return (proxy.size.height) / 8
        }
    }
}

struct MyButton: View{
    @Environment(\.verticalSizeClass) private var verticalSizeClass
    var button: CalcButton
    @Binding var value: String
    @Binding var preValue: String
    @Binding  var currentOper : CurrentOper
    
    
    
    var body: some View{
        
        ZStack{
            if button == .zero || verticalSizeClass == .compact{
                Capsule()
                    .foregroundStyle(buttonColor(button: button))
            }else {
                Circle()
                    .foregroundStyle(buttonColor(button: button))
            }
            
            Button {
                
                buttonAction(button: button)
                
                
            }label: {
                Text(button.rawValue)
                    .foregroundStyle(.white)
                    .font(.title)
                    .frame(maxWidth: .infinity, alignment: button == .zero ? .leading : .center)
                    .padding(.horizontal)
            }
            
        }
        
        
    }
    
    
    func buttonColor(button: CalcButton) -> Color{
        switch button{
        case .add, .multiply, .subtract, .equal, .divide:
            return Color(.systemOrange)
        case .clear, .change,.percent:
            return Color(.lightGray)
        case .one, .two, .three, .four, .five, .six, .seven, .eight, .nine, .zero, .decimal:
            return Color(.darkGray)
        }
    }
    
    func buttonAction(button: CalcButton){
        switch button{
        case .add, .subtract, .multiply, .divide, .equal:
            
            if button == .add{
                currentOper = .add
                preValue = value
                value = "0"
                print(preValue)
                
            }else if button == .subtract{
                currentOper = .subtract
                preValue = value
                value = "0"
                
            }else if button == .divide{
                currentOper = .divide
                preValue = value
                value = "0"
                
            }else if button == .multiply{
                currentOper = .multiply
                preValue = value
                value = "0"
                
            }else if button == .equal{
                let pre = Double(preValue) ?? 0
                let now = Double(value) ?? 0
                
                var result: Double = 0
                print("value", pre)
                print("pre", now)
                print("oper",currentOper)
                
                
                switch currentOper {
                case .add:
                    result = (pre + now)
                    value = checkInteger(result)
                case .subtract:
                    result = (pre  - now)
                    value = checkInteger(result)
                case .divide:
                    result = (pre / now)
                    value = checkInteger(result)
                case .multiply:
                    result = (pre * now)
                    value = checkInteger(result)
                case .none:
                    break
                }
            }
            

        case .change:
            let result = (Double(value) ?? 0.0) * -1
            value = checkInteger(result)
            print(value)
           
        case .nine, .eight, .seven, .six, .five, .four, .three, .two, .one, .zero:
            let number = button.rawValue
            if "0" == value{
                value = number
            }else{
                if value.count < 9{
                    value = "\(value)\(number)"
                }
            }
            
            
        case .clear:
            value = "0"

        case .decimal:
            value.append(button.rawValue)
            
        case .percent:
            value = "\(Double((Double(value) ?? 0) * 0.01))"
        }
        
    }
    
    func checkInteger(_ result: Double)-> String{
        if floor(result) == result{
            return "\(Int(result))"
        }else{
            return "\(Double(result))"
        }
    }

}


#Preview {
    ContentView()
}
