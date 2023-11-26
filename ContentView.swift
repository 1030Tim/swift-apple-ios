//
//  ContentView.swift
//  myone_app
//
//  Created by juhn on 2023/11/19.
//

import SwiftUI

struct ContentView: View {
    let me = Resume.shared
    var body: some View {
        ScrollView{
            VStack(spacing:30){
                HStack{
                    Image("meme")//圖片
                        .resizable().aspectRatio(contentMode: .fit)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)//圓
                        .frame(width: 200)//大小
                    VStack (spacing:20){
                        Text(me.name)//姓名
                            .font(.title).bold()
                        Text(me.title)//大小
                        HStack{
                            Image(systemName:"location.fill")//標誌
                            Text(me.location)
                                .font(.caption2)
                            
                            
                        }.foregroundColor(.secondary)
                        
                    }
                }
                //Text(me.bio).font(.title3).lineSpacing(10)
                Text(me[keyPath: \.bio]).lineSpacing(10).font(.title3)
                //按鈕
                /*寫法1
                Button("Contact Me !"){print("f")}
                    .foregroundStyle(.white)
                    .padding(.vertical,10).bold()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(.black))
                 */
                Button(action: {print("u")},
                       label: {
                    Text("Contact Me !")
                        .foregroundStyle(.white)
                        .padding(.vertical,10).bold()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(.black))
                    
                })
                //===========
                
            }//.padding()
                //.overlay(juju())
            Text("<精通語言>").bold().font(.title2)
                .frame(maxWidth:.infinity,alignment:.leading)
            HStack{
                ForEach(me.skills, id: \.self){skill in
                    VStack{
                        Image(skill)
                            .resizable().aspectRatio(contentMode: .fit)
                            .frame(width:50)
                        Text(skill)
                    }.frame(width:80)
                }
            }
            Text("<Experience>")
                .bold().font(.title2)
                .frame(maxWidth:.infinity,alignment:.leading)
            VStack(spacing:10){
                Text("APCS：").font(.title2)
                Text("實作2級 觀念1級")
                Text("2023年10月")
                Text("pandas:").font(.title2)
                Text("整理表格狀資料")
                Text("2023年2月")
                Text("初入python")
                
            }
            VStack{
                Text("<了解更多>").bold().font(.title2)
                    .frame(maxWidth:.infinity,alignment: .leading)
                Text("大家好！我是陳閔駿目前是高二生，這是我第一個app，雖然沒有沒成的很好但我覺得是我的里程碑")
                Text("我是位程式設計愛好者，目前處於熱戀其中")
                Text("如果你覺得程式很有趣，那就一起加入寫程式的領域吧！")
            }
        }
    }
    }
    
    


#Preview {
    ContentView()
}
