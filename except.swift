import SwiftUI
// main view
struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {

                HStack {
                    Text("簡歷製作")
                        .font(.title)
                        .foregroundColor(.white)
                    Spacer()
                    NavigationLink(destination: SettingsView()) {
                        Image(systemName: "person.circle")
                            .imageScale(.large)
                            .foregroundColor(.white)
                    }
                }
                .padding()
                .background(Color.green)
                
                // file addent
                List {
                    Section(header: Text("基本資訊")) {
                        NavigationLink(destination: DetailView(title: "基本資訊", description: "尚未添加基本資訊，請填寫姓名，郵箱等資訊")) {
                            InfoRow(title: "尚未添加基本資訊", description: "請填寫姓名及詳細資訊")
                        }
                    }
                    
                    Section(header: Text("自我介紹")) {
                        NavigationLink(destination: DetailView(title: "自我介紹", description: "請用簡單幾句話來描述自己")) {
                            InfoRow(title: "尚未添加自我介紹", description: "讓大家更了解您")
                        }
                    }
                    
                    Section(header: Text("特殊技能")) {
                        NavigationLink(destination: DetailView(title: "精通技能", description: "範例：程式語言 python3 C/C++ java")) {
                            InfoRow(title: "尚未填寫經通技能", description: "請填寫善用技能，例如：python3,C/C++")
                        }
                    }
                    
                    Section(header: Text("競賽活動經歷")) {
                        NavigationLink(destination: DetailView(title: "經歷填寫", description: "請填寫活動經歷或是比賽經歷")) {
                            InfoRow(title: "尚未添加背景資訊", description: "請填寫您的教育背景和專業技能培訓經歷")
                        }
                    }
                    
                    Section(header: Text("其他連結說明")) {
                        NavigationLink(destination: DetailView(title: "其他", description: "其他補充說明的文字或檔案")) {
                            InfoRow(title: "尚未添加其他檔案", description: "請填寫其他資訊，讓大家更了解您")
                        }
                    }
                    
                    Section(header: Text("範例")) {
                        NavigationLink(destination: AboutView()) {
                            InfoRow(title: "範例簡歷", description: "查看您的簡歷預覽")
                        }
                    }
                }
                .listStyle(GroupedListStyle())
            }
            .navigationBarHidden(true)
        }
    }
}
//class
struct InfoRow: View {
    var title: String
    var description: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .foregroundColor(.red)
                .font(.headline)
            Text(description)
                .foregroundColor(.gray)
                .font(.subheadline)
        }
        .padding(.vertical, 5)
    }
}
//class
struct DetailView: View {
    var title: String
    var description: String
    
    var body: some View {
        VStack {
            Text(title)
                .font(.largeTitle)
                .padding(.bottom, 20)
            Text(description)
                .font(.body)
                .padding()
            Spacer()
        }
        .navigationBarTitle(Text(title), displayMode: .inline)
    }
}
//class
struct SettingsView: View {
    var body: some View {
        List {
            Section(header: Text("設定")) {
                NavigationLink(destination: Text("電子郵件: jun20061030@gmail.com")) {
                    Text("使用者")
                }
                NavigationLink(destination: Text("系統不會發送任何通知")) {
                    Text("通知")
                }
                NavigationLink(destination: Text("上傳僅供閱覽並無任何資料庫")) {
                    Text("隱私")
                }
                NavigationLink(destination: Text("陸興高中：陳閔駿")) {
                    Text("版權")
                }
            }
        }
        .listStyle(GroupedListStyle())
        .navigationBarTitle(Text("設定"), displayMode: .inline)
    }
}
//class
struct ContactView: View {
    @Binding var isShowing: Bool
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "phone.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.white)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 100).foregroundColor(.brown))

                ForEach(Resume.shared.url, id: \.name) { media in
                    Image(media.name)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(100)
                }
            }

            Button(action: {
                isShowing = false
                presentationMode.wrappedValue.dismiss()
            }) {
                Text("任意位置關閉")
            }
        }
        .transition(.slide)
    }
}

struct ContactView_Previews: PreviewProvider {
    static var previews: some View {
        ContactView(isShowing: .constant(true))
    }
}

struct AboutView: View {
    @State private var isShowingCont = false
    let me = Resume.shared
    
    var body: some View {
        ScrollView {
            VStack(spacing: 3) {
                HStack {
                    Image(me.had)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(Circle())
                        .frame(width: 200)
                    VStack(spacing: 20) {
                        Text(me.name)
                            .font(.title).bold()
                        Text(me.title)
                        HStack {
                            Image(systemName: "paperplane.circle.fill")
                            Text(me.taiwan)
                                .font(.caption2)
                                .foregroundColor(.secondary)
                        }
                        HStack {
                            Image(systemName: "person.fill")
                            Text(me.from)
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                    }
                }
                Text(me[keyPath: \.bio])
                    .lineLimit(10)
                    .font(.title3)
                Button(action: {
                    isShowingCont.toggle()
                }) {
                    Text("聯絡我!")
                        .foregroundColor(.white)
                        .padding(.vertical, 10)
                        .bold()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(.black))
                }
            }
            .padding()
            .overlay(alignment: .top) {
                if isShowingCont {
                    VStack {
                        ContactView(isShowing: $isShowingCont)
                            .transition(.slide)
                            .offset(y: UIScreen.main.bounds.maxY * 0.32)
                            .onTapGesture {
                                isShowingCont = false
                            }
                            .transition(.slide)
                    }
                    .animation(.spring(), value: isShowingCont)
                }
            }
            .background(Color(.secondarySystemBackground))
            
            Text("-----------------------------------------------")
            Text("")
            Text("關於")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(.orange)
                .underline()
                .italic() +
            Text("我的") +
            Text("撐")
                .font(.largeTitle)
                .foregroundColor(.red) +
            Text("竿跳高")
                .font(.title3)
                .bold()
            
            HStack {
                Text(me.seep) +
                (Text("全中錦第三")
                    .foregroundColor(.purple)
                    .font(.system(size: 22)))
                    .font(.system(size: 14, weight: .light, design: .serif))
                    .italic()
                Image(me.photo)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 250)
                    .padding(.leading, 16)
                    .font(.title2)
                Divider()
            }
            
            HStack {
                Image(me.good)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 250)
                Text(me.biop)
                    .font(.system(size: 14, weight: .light, design: .serif))
                Divider()
            }
            
            HStack {
                Text(me.codeBio)
                    .font(.system(size: 14, weight: .light, design: .serif))
                Image(me.code1)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 250)
            }
            
            HStack {
                Image(systemName: "person.fill")
                    .foregroundColor(.secondary)
                Text("開發者：") +
                Text("陳閔駿")
                    .foregroundColor(.brown)
                    .font(.title3)
            }
            .foregroundColor(.secondary)
            
            // Show More Button
            Button(action: {
                isShowingCont.toggle()
            }) {
                Text("看更多!")
                    .foregroundColor(.white)
                    .padding(.vertical, 4)
                    .bold()
                    .frame(maxWidth: 150)
                    .background(RoundedRectangle(cornerRadius: 5)
                        .foregroundColor(.black))
            }
            
            // Conditional Additional Content
            if isShowingCont {
                Text("這是我第一次做的 app 功能陽春\n期待功能會有更多")
                VStack(spacing: 20.0) {
                    Image("skiu")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 250)
                }
            }
        }
        .padding()
        .background(Color(.secondarySystemBackground))
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
