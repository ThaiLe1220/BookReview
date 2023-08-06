import SwiftUI

struct ContentView2: View {
    
    @State var orders: OrderModel = OrderModel()
    @State var isDarkMode: Bool = true
    @State var isShowingOrderRecap: Bool = true

    var body: some View {
        NavigationView {
            List {
                Text("Item 1")
                Text("Item 2")
                Text("Item 3")
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        withAnimation(.linear(duration: 1)) {
                            isShowingOrderRecap.toggle()
                        }
                    }) {
                        Image(systemName: orders.orderItems.isEmpty ? "cart" : "cart.fill")
                            .font(.system(size: 20))
                            .foregroundColor(Color("OrangePeel"))
                        
                        isShowingOrderRecap ? Text(orders.orderTotal, format: .currency(code: "VND"))
                                .foregroundColor(Color("OrangePeel")) : nil
                    }
                }

                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        isDarkMode.toggle()
                    }) {
                        Image(systemName: isDarkMode ? "moon" : "lightbulb")
                            .font(.system(size: 20))
                            .foregroundColor(Color("OrangePeel"))
                    }
                }

                ToolbarItem(placement: .bottomBar) {
                    Text("Some additional information")
                }
            }

        }
        
    }
}

struct ContentView2_Previews: PreviewProvider {
    static var previews: some View {
        ContentView2()
    }
}
