//
//  SlotView.swift
//  random
//
//  Created by User20 on 2020/12/3.
//

import SwiftUI

struct SlotView: View {
    @State private var nums = [0, 0, 0]
    @State private var images = ["heart", "rabbit", "chicken"]
    @State private var win = false
    var body: some View {
        ZStack{
            VStack{
                Rectangle()
                    .foregroundColor(Color(red: 255/255, green: 238/255, blue: 190/255))
                    .edgesIgnoringSafeArea(.all)
                Rectangle()
                    .foregroundColor(Color(red: 105/255, green: 189/255, blue: 210))
                    .edgesIgnoringSafeArea(.all)
            }
            VStack{
                HStack{
                    Image(systemName: "star")
                        .foregroundColor(Color(red: 15/255, green: 163/255, blue: 255/255))
                    Text("可愛拉霸機")
                        .font(.system(size: 40))
                        .bold()
                        .foregroundColor(Color(red: 15/255, green: 163/255, blue: 255/255))
                    Image(systemName: "star")
                        .foregroundColor(Color(red: 15/255, green: 163/255, blue: 255/255))
                }
                .padding()

                HStack{
                    Image(images[nums[0]])
                        .resizable()
                        .scaledToFit()
                        .background(Color.white.opacity(0.5))
                        .cornerRadius(20)
                    Image(images[nums[1]])
                        .resizable()
                        .scaledToFit()
                        .background(Color.white.opacity(0.5))
                        .cornerRadius(20)
                    Image(images[nums[2]])
                        .resizable()
                        .scaledToFit()
                        .background(Color.white.opacity(0.5))
                        .cornerRadius(20)
                }
                
                Button(action: {
                    nums[0] = Int.random(in: 0..<images.count)
                    nums[1] = Int.random(in: 0..<images.count)
                    nums[2] = Int.random(in: 0..<images.count)
                    if(nums[0]==nums[1] && nums[0]==nums[2]){
                        win = true
                    }
                }, label: {
                    Text("Spin")
                        .padding(5)
                        .background(Color.white)
                        .cornerRadius(25)
                        .foregroundColor(Color(red: 15/255, green: 163/255, blue: 255/255))
                })

            }
            .alert(isPresented: $win, content: {
                return Alert(title: Text("你贏了！"))
            })
        }
    }
}

struct SlotView_Previews: PreviewProvider {
    static var previews: some View {
        SlotView()
    }
}
