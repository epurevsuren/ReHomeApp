import PhotosUI
import SwiftUI

class AddItemViewModel: ObservableObject {
    @Published var descriptionText: String = ""
    @Published var itemNameText: String = ""
    @Published var pickerItems: [PhotosPickerItem] = []
    @Published var selectedImages: [UIImage] = []
    @Published var selectedCategory: Category?
    @Published var pickupLocation: String = ""
    @Published var condition: String = ""
    
    let conditions = ["New", "Used - like new", "Used - good", "Used - acceptable"]
    
    func clearFields() {
        descriptionText = ""
        itemNameText = ""
        pickerItems = []
        selectedImages = []
        selectedCategory = nil
        pickupLocation = ""
        condition = ""
    }
}

struct AddItemView: View {
    @StateObject private var viewModel = AddItemViewModel()
    @EnvironmentObject var dataProvider: DataProvider
    @State private var isSheetPresented = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    Text("Add Item to List")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color(red: 0.03, green: 0.49, blue: 0.55))
                        .padding(.top, 20)
                    
                    TextField("Item Name", text: $viewModel.itemNameText)
                        .font(.title2)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .padding(.horizontal)
                    
                    PhotosPicker("Select Images", selection: $viewModel.pickerItems, matching: .images)
                        .font(.title2)
                        .padding()
                        .foregroundStyle(Color(red: 0.03, green: 0.49, blue: 0.55))
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .padding(.horizontal)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            if viewModel.selectedImages.isEmpty {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color(.systemGray6))
                                    .frame(width: 250, height: 250)
                                    .overlay(Text("No Images Selected")
                                        .foregroundColor(.black)
                                        .font(.subheadline))
                            } else {
                                ForEach(0..<viewModel.selectedImages.count, id: \.self) { i in
                                    Image(uiImage: viewModel.selectedImages[i])
                                        .resizable()
                                        .frame(width: 250, height: 250)
                                        .cornerRadius(10)
                                }
                            }
                        }
                        .padding()
                    }
                    .onChange(of: viewModel.pickerItems) { newValue in
                        Task {
                            viewModel.selectedImages.removeAll()
                            
                            for item in viewModel.pickerItems {
                                if let data = try? await item.loadTransferable(type: Data.self), let uiImage = UIImage(data: data) {
                                    viewModel.selectedImages.append(uiImage)
                                }
                            }
                        }
                    }
                    
                    Picker("Category", selection: $viewModel.selectedCategory) {
                        ForEach(dataProvider.categories, id: \.self) { category in
                            Text(category.name).tag(category as Category?)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal)
                    
                    TextField("Pickup Location", text: $viewModel.pickupLocation)
                        .font(.title2)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .padding(.horizontal)
                    
                    Picker("Condition", selection: $viewModel.condition) {
                        ForEach(viewModel.conditions, id: \.self) { condition in
                            Text(condition).tag(condition)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal)
                    
                    Text("Description")
                        .font(.title2)
                        .padding(.top)
                    
                    TextField("Add description here", text: $viewModel.descriptionText)
                        .font(.title2)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .padding(.horizontal)
                    
                    HStack {
                        Button(action: {
                            viewModel.clearFields()
                        }) {
                            Text("Cancel")
                                .font(.title2)
                                .fontWeight(.bold)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color(red: 0.71, green: 0.71, blue: 0.71))
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                        
                        Button(action: {
                            guard let selectedCategory = viewModel.selectedCategory else { return }
                            let imageNames = viewModel.selectedImages.map { _ in UUID().uuidString }
                            let newItem = Listing(
                                id: UUID().hashValue,
                                userId: 1, // Assuming the current user ID is 1
                                name: viewModel.itemNameText,
                                imageNames: imageNames,
                                category: selectedCategory.name,
                                user: "Current User", // Replace with actual user data
                                userImage: "p1", // Placeholder image
                                condition: viewModel.condition,
                                pickupLocation: viewModel.pickupLocation,
                                description: viewModel.descriptionText
                            )
                            dataProvider.addItem(newItem)
                            viewModel.clearFields()
                            isSheetPresented.toggle()
                        }) {
                            Text("Rehome")
                                .font(.title2)
                                .fontWeight(.bold)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color(red: 0.03, green: 0.49, blue: 0.55))
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                    }
                    .padding()
                    .sheet(isPresented: $isSheetPresented) {
                        SheetView()
                    }
                    
                    Spacer()
                }
                .padding(.bottom, 20)
            }
        }
    }
}

struct SheetView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Rectangle()
                    .foregroundStyle(.clear)
                    .frame(maxHeight: 10)
                Image(systemName: "chevron.compact.down")
                    .resizable()
                    .frame(width: 60, height: 15)
                Spacer()
                Text("Congratulations!")
                    .font(.title)
                Text("Item added to your list.")
                    .font(.subheadline)
                Spacer()
            }
        }
    }
}

#Preview {
    AddItemView()
        .environmentObject(DataProvider())
}
