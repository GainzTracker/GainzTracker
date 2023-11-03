//
//  Workout.swift
//  GainzTracker
//
//  Created by Abigail Johnson on 10/26/23.
//

//import UIKit
//
//struct WorkoutResponse: Decodable {
//    let from: Int
//    let to: Int
//    let count: Int
//    let _links: Links
//    let hits: [Hit]
//}
//
//struct Links: Decodable {
//    let `self`: Link
//    let next: Link
//}
//
//struct Link: Decodable {
//    let href: String
//    let title: String
//}
//
//struct Hit: Decodable {
//    let workout: Workout
//}
//
//struct Workout: Decodable {
//    let uri: String
//    let label: String
//    let image: String
//    let images: ImageTypes
//    let source: String
//    let url: String
//    let shareAs: String
//    let yield: Double
//    let exerciseLabels: [String]
//    let equipmentLabels: [String]
//    let cautions: [String]
//    let exerciseSteps: [String]
//    let exercises: [Exercise]
//    let duration: Double
//    let difficultyIndex: Int
//    let totalCaloriesBurned: Double
//    let muscleGroups: [String]
//    let workoutType: [String]
//    let tags: [String]
//    let externalId: String
//    let nutrientsGained: [String: NutrientInfo]
//    let dailyNutrientsGained: [String: NutrientInfo]
//    let digest: [Digest]
//}
//
//struct ImageTypes: Decodable {
//    let THUMBNAIL: ImageDetail
//    let SMALL: ImageDetail
//    let REGULAR: ImageDetail
//    let LARGE: ImageDetail
//}
//
//struct ImageDetail: Decodable {
//    let url: String
//    let width: Int
//    let height: Int
//}
//
//struct Exercise: Decodable {
//    let text: String
//    let duration: Double
//    let equipment: String
//    let muscleGroup: String
//    let repetitions: Int
//    let exerciseId: String
//}
//
//struct NutrientInfo: Decodable {
//    let label: String
//    let quantity: Double
//    let unit: String
//}
//
//struct Digest: Decodable {
//    let label: String
//    let tag: String
//    let schemaOrgTag: String
//    let total: Double
//    let hasRDI: Bool
//    let daily: Double
//    let unit: String
//    let sub: [String: NutrientInfo]
//}
//
//class WorkoutViewController: UIViewController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        fetchWorkouts()
//    }
//
//    func fetchWorkouts() {
//        let url = URL(string: "YOUR_WORKOUT_API_URL_HERE")!
//        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
//            if let error = error {
//                print("Error fetching data: \(error)")
//                return
//            }
//            
//            guard let safeData = data else {
//                print("No data received.")
//                return
//            }
//
//            do {
//                let decoder = JSONDecoder()
//                let workoutsResponse = try decoder.decode(WorkoutResponse.self, from: safeData)
//                print(workoutsResponse)
//            } catch {
//                print("Error decoding data: \(error)")
//            }
//        }
//        
//        task.resume()
//    }
//}
