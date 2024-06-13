import PhotosUI
import SwiftUI

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }

    func dismissKeyboardOnTap() -> some View {
        self.onTapGesture {
            self.hideKeyboard()
        }
    }
}

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
    let frameWidth: CGFloat = 350
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.systemBackground)
                    .edgesIgnoringSafeArea(.all)
                
                ScrollView {
                    VStack(spacing: 20) {
                        VStack(alignment: .center, spacing: 15) {
                            Group {
                                TextField("Item Name", text: $viewModel.itemNameText)
                                    .padding()
                                    .frame(width: frameWidth)
                                    .background(Color(.systemGray6))
                                    .cornerRadius(10)
                                    .shadow(color: .gray.opacity(0.5), radius: 5, x: 0, y: 2)
                                    .submitLabel(.done)
                                    .onSubmit {
                                        hideKeyboard()
                                    }
                                
                                TextField("Pickup Location", text: $viewModel.pickupLocation)
                                    .padding()
                                    .frame(width: frameWidth)
                                    .background(Color(.systemGray6))
                                    .cornerRadius(10)
                                    .shadow(color: .gray.opacity(0.5), radius: 5, x: 0, y: 2)
                                    .submitLabel(.done)
                                    .onSubmit {
                                        hideKeyboard()
                                    }
                                
                                Text("Description")
                                    .foregroundColor(.blue)
                                
                                TextEditor(text: $viewModel.descriptionText)
                                    .padding(4)
                                    .background(Color(.systemGray6))
                                    .cornerRadius(10)
                                    .shadow(color: .gray.opacity(0.5), radius: 5, x: 0, y: 2)
                                    .frame(width: frameWidth, height: 150)
                                    .submitLabel(.done)
                                    .onSubmit {
                                        hideKeyboard()
                                    }
                                
                            }
                            
                            PhotosPicker("Select Images", selection: $viewModel.pickerItems, matching: .images)
                                .padding()
                                .frame(width: frameWidth, height: 40)
                                .background(Color(.systemGray6))
                                .foregroundColor(Color(red: 0.03, green: 0.49, blue: 0.55))
                                .cornerRadius(10)
                                .shadow(color: .gray.opacity(0.5), radius: 5, x: 0, y: 2)
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack {
                                    if viewModel.selectedImages.isEmpty {
                                        ForEach(0..<3) { _ in
                                            RoundedRectangle(cornerRadius: 10)
                                                .fill(Color(.systemGray6))
                                                .frame(width: 200, height: 200)
                                                .overlay(Text("No Images Selected")
                                                    .foregroundColor(.gray)
                                                    .font(.subheadline))
                                                .shadow(color: .gray.opacity(0.5), radius: 5, x: 0, y: 2)
                                        }
                                    } else {
                                        ForEach(viewModel.selectedImages, id: \.self) { image in
                                            Image(uiImage: image)
                                                .resizable()
                                                .frame(width: 250, height: 250)
                                                .cornerRadius(10)
                                                .shadow(color: .gray.opacity(0.5), radius: 5, x: 0, y: 2)
                                        }
                                    }
                                }
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .center) // Center the HStack
                            }
                            .onChange(of: viewModel.pickerItems) { newItems in
                                Task {
                                    var newImages: [UIImage] = []
                                    for item in newItems {
                                        if let data = try? await item.loadTransferable(type: Data.self), let uiImage = UIImage(data: data) {
                                            newImages.append(uiImage)
                                        }
                                    }
                                    viewModel.selectedImages = newImages
                                }
                            }
                            
                            Picker("Category", selection: $viewModel.selectedCategory) {
                                ForEach(dataProvider.categories, id: \.self) { category in
                                    Text(category.name).tag(category as Category?)
                                        .foregroundColor(Color(red: 0.03, green: 0.49, blue: 0.55))
                                }
                            }
                            .pickerStyle(MenuPickerStyle())
                            .padding()
                            .frame(width: frameWidth, height: 40)
                            .background(Color(red: 0.03, green: 0.49, blue: 0.55))
                            .cornerRadius(10)
                            .shadow(color: .gray.opacity(0.5), radius: 5, x: 0, y: 2)
                            
                            Picker("Condition", selection: $viewModel.condition) {
                                ForEach(viewModel.conditions, id: \.self) { condition in
                                    Text(condition).tag(condition)
                                        .foregroundColor(Color(red: 0.03, green: 0.49, blue: 0.55))
                                }
                            }
                            .pickerStyle(MenuPickerStyle())
                            .padding()
                            .frame(width: frameWidth, height: 40)
                            .background(Color(red: 0.03, green: 0.49, blue: 0.55))
                            .cornerRadius(10)
                            .shadow(color: .gray.opacity(0.5), radius: 5, x: 0, y: 2)
                        }
                        
                        HStack {
                            Button(action: {
                                viewModel.clearFields()
                            }) {
                                Text("Cancel")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .cornerRadius(10)
                                    .foregroundColor(Color(red: 0.03, green: 0.49, blue: 0.55))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 8)
                                            .inset(by: 1)
                                            .stroke(Color(red: 0.03, green: 0.49, blue: 0.55), lineWidth: 2)
                                    )
                            }
                            
                            Button(action: {
                                guard let selectedCategory = viewModel.selectedCategory else { return }
                                let imageNames = saveImages(viewModel.selectedImages)
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
                                    .shadow(color: .gray.opacity(0.5), radius: 5, x: 0, y: 2)
                            }
                        }
                        .padding(.horizontal)
                        .sheet(isPresented: $isSheetPresented) {
                            SheetView()
                        }
                        
                        Spacer()
                            .frame(height: 50) // Add this spacer to create space between the buttons and the bottom of the scroll view
                    }
                    .padding([.horizontal, .bottom], 20) // Added horizontal and bottom padding
                    .background(Color(.systemBackground))
                    .dismissKeyboardOnTap()
                }
                .navigationBarTitle("Add New Item", displayMode: .inline)
                .padding()
            }
        }
    }
    
    private func saveImages(_ images: [UIImage]) -> [String] {
        var imageNames: [String] = []
        
        for image in images {
            if let data = image.jpegData(compressionQuality: 0.8) {
                let imageName = UUID().uuidString + ".jpg"
                let imagePath = getDocumentsDirectory().appendingPathComponent(imageName)
                try? data.write(to: imagePath)
                imageNames.append(imageName)
            }
        }
        
        return imageNames
    }
    
    private func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
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
                    .foregroundColor(.gray)
                Spacer()
                Text("Congratulations!")
                    .font(.title)
                    .foregroundColor(Color(red: 0.03, green: 0.49, blue: 0.55))
                    .shadow(color: .gray.opacity(0.5), radius: 5, x: 0, y: 2)
                Text("Item added to your list.")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                Spacer()
            }
        }
    }
}

#Preview {
    AddItemView()
        .environmentObject(DataProvider())
}
