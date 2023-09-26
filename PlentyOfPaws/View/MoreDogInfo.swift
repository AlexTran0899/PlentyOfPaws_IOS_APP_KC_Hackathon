import SwiftUI
import AVKit

struct MoreDogInfo: View {
  var dog: Dog
  @Binding var isDetailViewShowing: Bool
  @State var currSelectedContentIDX: Int = 0
  @State var isScrollingDown: Bool = true
  var body: some View {
    GeometryReader { geo in
      ZStack {
        ScrollView {
          VStack {
            Text(dog.name)
              .font(.system(size: 48, weight: .bold, design: .rounded))
            TabView(selection: $currSelectedContentIDX) {
              ForEach(1..<dog.images.count + dog.videos.count, id: \.self) { index in
                if index < dog.images.count {
                  AsyncImage(
                    url: URL(string: dog.images[index].image_url),
                    content: { image in
                      image.resizable()
                        .scaledToFill()
                        .frame(width: geo.size.width - 40, height: (geo.size.width / 1.33) - 40)
                        .cornerRadius(10)
                        .shadow(radius: 10)
                    },
                    placeholder: {
                      ProgressView()
                    }
                  )
                } else {
                  let videoIndex = index - dog.images.count
                  let player = AVPlayer(url:  URL(string: dog.videos[videoIndex].video_url)!)
                  VideoPlayer(player: player)
                    .onAppear(perform: {
                      player.play()
                    })
                    .scaledToFill()
                    .frame(width: geo.size.width - 40, height: (geo.size.width / 1.33) - 40)
                    .cornerRadius(10)
                    .shadow(radius: 10)
                  
                }
              }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .indexViewStyle(PageIndexViewStyle())
            .frame(height: geo.size.width / 1.33) // set a fixed height
            VStack{
              DetailRow(key: "Breed", value: dog.breed)
              DetailRow(key: "Age", value: dog.age + " y.o")
              HStack {
                Text("Energy Level" + ":")
                  .font(.system(size: 20, weight: .bold, design: .rounded))
                  .bold()
                Spacer()
                StarsView(rating: CGFloat(dog.energy_level), maxRating: 5)
              }.padding(.bottom,10)
                .frame(height: 30)
              HStack {
                Text("Maintenance Level" + ":")
                  .font(.system(size: 20, weight: .bold, design: .rounded))
                  .bold()
                Spacer()
                StarsView(rating: CGFloat(dog.maintenance_level), maxRating: 5)
              }.padding(.bottom,10)
                .frame(height: 30)
              VStack(alignment: .leading) {
                Text("Description:")
                  .font(.system(size: 20, weight: .bold, design: .rounded))
                  .padding(.bottom,10)
                Text(dog.description ?? "")
                  .font(.system(size: 20, weight: .thin, design: .rounded))
              }
              
              
            }.padding([.leading,.trailing], 20)
            Spacer()
          }
          
        }
        .gesture(DragGesture().onChanged({ value in
          if value.translation.height > 0 { withAnimation(.easeInOut(duration: 0.05)) {isScrollingDown = true}}
          else {withAnimation(.easeInOut(duration: 0.05)) {isScrollingDown = false}
          }
        }))
        VStack {
          Spacer()
          HStack {
            Image( systemName: "x.circle.fill")
              .foregroundColor(.gray)
              .font(.system(size: 58, weight: .bold))
              .background(Color.white)
              .clipShape(Circle())
              .shadow(radius: 10)
              .onTapGesture {
                isDetailViewShowing.toggle()
              }
            Spacer()
            Image(systemName: "message.circle")
              .font(.system(size: 58, weight: .bold))
              .foregroundColor(.blue)
              .background(Color.white)
              .clipShape(Circle())
              .shadow(radius: 10)
              .onTapGesture {
                isDetailViewShowing.toggle()
              }
          }
          .opacity(isScrollingDown ? 1.0 : 0.0)
          .padding(20)
          .ignoresSafeArea()
        }
      }
    }
  }
}

//#Preview {
//  MoreDogInfo(dog: Dog(user_id: 1, dog_id: 1,name: "Max", breed: "Golden Retriever", age: "1", energy_level: 3, maintenance_level: 3, cost: "$500",created_at: "2023-09-24T08:04:46.452Z",
//                         updated_at: "2023-09-24T08:04:46.452Z",[]), isDetailViewShowing: Binding.constant(true))
//}
