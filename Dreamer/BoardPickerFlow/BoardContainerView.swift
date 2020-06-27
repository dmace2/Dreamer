//
//  BoardContainerView.swift
//  Dreamer
//
//  Created by Dylan Mace on 6/25/20.
//  Copyright © 2020 Dylan Mace. All rights reserved.
//

import SwiftUI

struct BoardContainerView: View {
    @State var showMenu = false
    
    var body: some View {
        let drag = DragGesture().onEnded {
            if $0.translation.width < -100 {
                withAnimation {
                    self.showMenu = false
                }
            }
            if $0.translation.width > 0 {
                withAnimation {
                    self.showMenu = true
                }
            }
        }
        
        return NavigationView {
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    //BoardPickerView(showMenu: self.$showMenu)
                    BoardPickerView()
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .offset(x: self.showMenu ? geometry.size.width/2 : 0)
                    if self.showMenu {
                        MenuView()
                            .frame(width: geometry.size.width/2)
                            .transition(.move(edge: .leading))
                    }
                }
                .gesture(drag)
            }
            .navigationBarItems(leading: (
                Button(action: {
                    withAnimation {
                        self.showMenu.toggle()
                    }
                }) {
                    Image(systemName: "line.horizontal.3")
                        .imageScale(.large)
                }
            ))
        }
    }
}

struct BoardContainerView_Previews: PreviewProvider {
    static var previews: some View {
        BoardContainerView()
    }
}
