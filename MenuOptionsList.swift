//
//  MenuOptionsList.swift
//  Medicine-Bar
//
//  Created by Kaif Ali Khan Pathan on 28/03/2023.
//

import SwiftUI

struct MenuOptionsList: View {
    @Binding var currentOption: MenuBarOptions
    @Namespace var animation
    
    var body: some View {
        ScrollViewReader { proxy in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 30) {
                    ForEach(MenuBarOptions.allCases, id: \.self) { item in
                        VStack{
                            Text(item.title)
                                .foregroundColor(item == currentOption ? .black : .gray)
                            
                            if currentOption == item {
                                Capsule()
                                    .fill(.black)
                                    .matchedGeometryEffect(id: "item", in: animation)
                                    .frame(height: 3)
                                    .padding(.horizontal, -10)
                            } else {
                                Capsule()
                                    .fill(.clear)
                                    .frame(height: 3)
                                    .padding(.horizontal, -10)
                            }
                        }
                        .onTapGesture {
                            withAnimation(.easeInOut) {
                                self.currentOption = item
                                proxy.scrollTo(item, anchor: .topTrailing)
                            }
                        }
                    }
                    .onChange(of: currentOption) { _ in
                        proxy.scrollTo(currentOption, anchor: .topTrailing)
                    }
                    
                }
            }
            
        }
    }
}
/*
struct MenuOptionsList_Previews: PreviewProvider {
    static var previews: some View {
        MenuOptionsList(selectedOption: .constant(.japanese))
    }
}
*/
