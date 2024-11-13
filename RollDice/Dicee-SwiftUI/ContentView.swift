//Its an simple iOS for dicee rolling
import SwiftUI

struct ContentView: View {
    
    @State var leftDiceNumber = 1
    @State var rightDiceNumber = 1
    
    @State var isRotated = false
    
    @State private var diceLoaded = false
    @State var Count1 = 0;
    @State var Count2 = 0;
    
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            VStack {
                Image("diceeLogo")
                Spacer()
                HStack {
                    DiceView(n: leftDiceNumber, isRotated: $isRotated)
                    DiceView(n: rightDiceNumber, isRotated: $isRotated)
                }
                .padding(.horizontal)
                Spacer()
                Button(action: {
                    if diceLoaded {
                        self.leftDiceNumber = Int.random(in: 5...6)
                        self.rightDiceNumber = Int.random(in: 5...6)
                    } else {
                        self.leftDiceNumber = Int.random(in: 1...6)
                        self.rightDiceNumber = Int.random(in: 1...6)
                    }
                    if self.leftDiceNumber>self.rightDiceNumber{
                        Count1 = Count1+1;
                    }else if self.leftDiceNumber<self.rightDiceNumber{
                        Count2=Count2+1;
                    }else{
                        
                    }
                    isRotated.toggle()
                    diceLoaded = false
                    
                }) {
                    Text("Roll")
                        .font(.system(size: 50))
                        .fontWeight(.heavy)
                        .foregroundColor(.black)
                        .padding(.horizontal)
                }
                .background(Color.green)
                Rectangle()
                    .frame(height: 100)
                    .opacity(0.001)
                    .onTapGesture {
                        //load the dice
                        print ("dice loaded")
                        diceLoaded = true
                    }
                HStack{
                    
                    Text("Player1: \(Count1)")
                           .font(.system(size: 30))
                           .fontWeight(.heavy)
                           .foregroundColor(.white)
                           .padding(.horizontal)
                    Spacer()
                       Text("Player2: \(Count2)")
                           .font(.system(size: 30))
                           .fontWeight(.heavy)
                           .foregroundColor(.white)
                           .padding(.horizontal)
                }
                Button(action: {
                                   // Reset the counters to 0
                                   Count1 = 0
                                   Count2 = 0
                               }) {
                                   Text("Reset")
                                       .font(.system(size: 30))
                                       .fontWeight(.medium)
                                       .foregroundColor(.white)
                                       .padding()
                                       .background(Color.blue)
                                       .cornerRadius(10)
                               }
               
            }
        }
    }
}

struct DiceView: View {
    
    let n: Int
    @Binding var isRotated: Bool
    
    var body: some View {
        Image("dice\(n)")
            .resizable()
            .aspectRatio(1, contentMode: .fit)
            .padding()
            .rotation3DEffect(Angle.degrees(isRotated ? 1800 : 0), axis: (x:1, y:0, z:0))
            .rotationEffect(Angle.degrees(isRotated ? 1800 : 0))
            .animation(Animation.easeOut(duration: 2), value: isRotated)
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

