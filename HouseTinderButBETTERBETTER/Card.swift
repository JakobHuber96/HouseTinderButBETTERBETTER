import UIKit


//MARK: - DATA
struct Card: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let age: String
    let bio: String
    /// Card x position
    var x: CGFloat = 0.0
    /// Card y position
    var y: CGFloat = 0.0
    /// Card rotation angle
    var degree: Double = 0.0
    
    static var data: [Card] {
        [
            Card(name: "3732 big dipper drive", imageName: "house1", age: "$3,000,000,000", bio: "19bed 59bath"),
            Card(name: "3859 little dipper", imageName: "house3", age: "$900,690", bio: "1bd 9bath"),
            Card(name: "5751 red bridge drive", imageName: "house4", age: "$16,000", bio: "5bed 3bath"),
            Card(name: "5417 hilldale court", imageName: "house5", age: "$680,000", bio: "3bed 2 bath"),
            Card(name: "6795 timbow ball", imageName: "house6", age: "$21,000", bio: "4bed 2bath"),
            Card(name: "5513 bristow drive", imageName: "house7", age: "$245,000", bio: "5bd 3.5 bath"),
        ]
    }
    
}
