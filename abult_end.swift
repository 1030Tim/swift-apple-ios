# swift-apple-ios
import SwiftUI
import AVFoundation
struct Diamond: Shape {
    func path(in rect: CGRect) -> Path {
        Path { (path) in
            path.addLines([
                CGPoint(x: rect.midX, y: 0),
                CGPoint(x: rect.maxX, y: rect.midY),
                CGPoint(x: rect.midX, y: rect.maxY),
                CGPoint(x: 0, y: rect.midY)
            ])
        }
    }
    
}
struct ContentView: View {
    @State private var isShowingCont = false
    let me = Resume.shared
    
    var body: some View {
        ScrollView{
            VStack(spacing:3) {
                HStack {
                    Image("QQ图片20191012145957") // 人物頭像
                        .resizable().aspectRatio(contentMode: .fit)
                        .clipShape(Circle())
                        .frame(width: 200)
                    VStack(spacing: 20) {
                        Text(me.name)
                            .font(.title).bold()
                        Text(me.title)
                        HStack {
                            Image(systemName: "paperplane.circle.fill") // 小標誌
                            Text(me.taiwan)
                                .font(.caption2)
                                .foregroundColor(.secondary)
                        }
                        HStack {
                            Image(systemName: "person.fill") // 小標誌
                            Text(me.from)
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                    }
                }
                
                Text(me[keyPath: \.bio]) // 自介
                    .lineLimit(10)
                    .font(.title3)
                
                Button(action: {
                    isShowingCont.toggle()
                }, // 按鈕
                       label: {
                    Text("Contact Me!")
                        .foregroundColor(.white)
                        .padding(.vertical, 10).bold()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(.black))
                })
            }
            .padding()
            .overlay(alignment: .top) {
                if isShowingCont {
                    VStack {
                        SwiftUIView(isShowing: $isShowingCont)
                            .transition(.slide)
                        
                            .offset(y: UIScreen.main.bounds.maxY * 0.32)
                            .onTapGesture {
                                isShowingCont = false
                            }.transition(.slide)
                    }.animation(.spring(),value: isShowingCont)
                }
            }
            .background(Color(.secondarySystemBackground))
            Text("-------------------------------------------------")
            Text("")
            Text("關於").font(.largeTitle).fontWeight(.heavy) .foregroundColor(Color.orange).underline().italic()+Text("我的")+Text("撐").font(.largeTitle).foregroundColor(.red)+Text("竿跳高").font(.title3)
                .bold().font(.title)
            VStack(alignment:.leading,spacing: 3){
                Image(me.photo)
                    .resizable().aspectRatio(contentMode: .fit)
                    .frame(width:250)
                    .padding(.leading,16)
                    .font(.title2)
                HStack{
                    Text(me.seep)
                        .font(.system(size: 16,weight: .light,design: .serif))
                        .italic()
                }
                Divider()
            }
            VStack{
                Image(me.good)
                    .resizable().aspectRatio(contentMode: .fit)
                    .frame(width: 300)
                HStack{
                    Text(me.biop)
                        .font(.system(size: 16,weight: .light,design: .serif))
                    
                }
                Divider()
            }
            Image(me.code1)
                .resizable().aspectRatio(contentMode: .fit)
                .frame(width:300)
            Text(me.codeBio)
                .font(.system(size: 16,weight: .light,design: .serif))
            VStack{
                Text("-------------------------------------------------")
                Text("製作")+Text("歷程").font(.title).foregroundColor(.pink)+Text("及").font(.title3)+Text("時間").font(.largeTitle).foregroundColor(.yellow)
            }
            VStack{
                Text("10/13").font(.title2)+Text(":")+Text("學習基本配置")
                Text("10/20").font(.title2)+Text(":")+Text("制定計劃＋專案前不佈置")
                Text("10/27").font(.title2)+Text(":")+Text("學習基本語法")
                Text("11/3").font(.title2)+Text(":")+Text("加入圖片")
                Text("11/10").font(.title2)+Text(":")+Text("排版語法")
                Text("11/17").font(.title2)+Text(":")+Text("遇到錯誤")
                Text("11/24").font(.title2)+Text(":")+Text("debug")
                Text("12/1").font(.title2)+Text(":")+Text("debug")
                Text("11/8").font(.title2)+Text(":")+Text("做出功能")
                Text("11/11").font(.title2)+Text(":")+Text("debug")
                Text("11/12").font(.title2)+Text(":")+Text("debug")
                Text("11/13").font(.title2)+Text(":")+Text("debug")
            }

        }

    }
    
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()        }
    }
}
