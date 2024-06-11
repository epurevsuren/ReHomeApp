import SwiftUI

@main
struct ReHomeAppApp: App {
    @StateObject private var dataProvider = DataProvider()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(dataProvider)
        }
    }
}
