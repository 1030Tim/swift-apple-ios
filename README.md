# swift-apple-ios
import SwiftUI

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
            Text("<關於我的一點點小歷程>")
                .bold().font(.title)
                .frame(maxWidth:.infinity,alignment: .leading)
            Text("<撐竿跳比賽經歷>")
                .frame(maxWidth:.infinity,alignment: .leading)
            VStack(alignment:.leading,spacing: 3){
                Image(me.photo)
                    .resizable().aspectRatio(contentMode: .fit)
                    .frame(width:300)
                    .padding(.leading,16)
                    
                    
                Divider()
            }
            
        }
        }
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    
    }
}

