//
//  ContentView.swift
//  osx
//
//  Created by cubicinc on 2023/05/02.
//

import SwiftUI

struct ContentView: View {
    @State private var isUpdate: Bool = false
    let columns = [GridItem(.flexible(),spacing: 4), GridItem(.flexible(),spacing: 4), GridItem(.flexible(),spacing: 4), GridItem(.flexible(),spacing: 4), GridItem(.flexible(),spacing: 4), GridItem(.flexible(),spacing: 4), GridItem(.flexible(),spacing: 4)]
    let colors: [Color] = [.black, .blue, .cyan, .indigo, .mint, .yellow, .orange]
    
    var body: some View {
        VStack {
            LazyVGrid(
                columns: columns,
                alignment: .center,
                spacing: 10,
                content: {
                    ForEach(0..<49) { index in
                        Circle()
                            .fill(Color.orange)
                            .frame(width: 20, height: 20)
                    }
                })
            Divider()
            CircleView(move: MovePose())
            Button("update") {
                isUpdate.toggle()
            }
        }
        .padding()
    }
}

struct CircleView: View {
    @StateObject var move: MovePose
    
    var body: some View {
        VStack {
            Circle()
                .fill(Color.blue)
                .frame(width: 10, height: 10)
                .offset(y: move.moveY)
            Button("jump") {
                move.jump()
            }
        }
    }
}

class MovePose: ObservableObject {
    @Published private(set) var moveY: CGFloat = 0
    
    init() {
        print(#function)
    }
    
    func jump() {
        moveY -= 10
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
