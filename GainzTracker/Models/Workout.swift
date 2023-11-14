//
//  Workout.swift
//  GainzTracker
//
//  Created by Karolyn Carcache on 11/13/23.
//

import Foundation

struct Workout: Decodable{
    
    let name: String
      let type: String
      let muscle: String
      let equipment: String
      let difficulty: String
      let instructions: String
    
}

extension Workout{
    
    static var mockWorkouts: [Workout] = [
        Workout(name: "Rickshaw Carry", type: "Strongman", muscle: "Forearms", equipment: "Other", difficulty: "Beginner", instructions: "Position the frame at the starting point, and load with the appropriate weight. Standing in the center of the frame, begin by gripping the handles and driving through your heels to lift the frame. Ensure your chest and head are up and your back is straight. Immediately begin walking briskly with quick, controlled steps. Keep your chest up and head forward, and make sure you continue breathing. Bring the frame to the ground after you have reached the end point."),
        Workout(name: "Single-Leg Press", type: "Strength", muscle: "Quadriceps", equipment: "Machine", difficulty: "Intermediate", instructions: "Load the sled to an appropriate weight. Seat yourself on the machine, planting one foot on the platform in line with your hip. Your free foot can be placed on the ground. Maintain good spinal position with your head and chest up. Supporting the weight, fully extend the knee and unlock the sled. This will be your starting position. Lower the weight by flexing the hip and knee, continuing as far as flexibility allows. Do not allow your lumbar to take the load by moving your pelvis. At the bottom of the motion pause briefly and then return to the starting position by extending the hip and knee. Complete all repetitions for one leg before switching to the other."),
        Workout(name: "Landmine Twist", type: "Strength", muscle: "Abdominals", equipment: "Other", difficulty: "Intermediate", instructions: "Position a bar into a landmine or securely anchor it in a corner. Load the bar to an appropriate weight. Raise the bar from the floor, taking it to shoulder height with both hands with your arms extended in front of you. Adopt a wide stance. This will be your starting position. Perform the movement by rotating the trunk and hips as you swing the weight all the way down to one side. Keep your arms extended throughout the exercise. Reverse the motion to swing the weight all the way to the opposite side. Continue alternating the movement until the set is complete."),
        Workout(name: "Weighted Pull-up", type: "Strength", muscle: "Lats", equipment: "Other", difficulty: "Intermediate", instructions: "Attach a weight to a dip belt and secure it around your waist. Grab the pull-up bar with the palms of your hands facing forward. For a medium grip, your hands should be spaced at shoulder width. Both arms should be extended in front of you holding the bar at the chosen grip. You'll want to bring your torso back about 30 degrees while creating a curvature in your lower back and sticking your chest out. This will be your starting position. Now, exhale and pull your torso up until your head is above your hands. Concentrate on squeezing your shoulder blades back and down as you reach the top contracted position. After a brief moment at the top contracted position, inhale and slowly lower your torso back to the starting position with your arms extended and your lats fully stretched."),
        Workout(name: "T-Bar Row with Handle", type: "Strength", muscle: "Middle Back", equipment: "Other", difficulty: "Intermediate", instructions: "Position a bar into a landmine or in a corner to keep it from moving. Load an appropriate weight onto your end. Stand over the bar, and position a Double D row handle around the bar next to the collar. Using your hips and legs, rise to a standing position. Assume a wide stance with your hips back and your chest up. Your arms should be extended. This will be your starting position. Pull the weight to your upper abdomen by retracting the shoulder blades and flexing the elbows. Do not jerk the weight or cheat during the movement. After a brief pause, return to the starting position."),
        Workout(name: "Palms-Down Wrist Curl Over Bench", type: "Strength", muscle: "Forearms", equipment: "Barbell", difficulty: "Intermediate", instructions: "Start out by placing a barbell on one side of a flat bench. Kneel down on both of your knees so that your body is facing the flat bench. Use your arms to grab the barbell with a pronated grip (palms down) and bring them up so that your forearms are resting against the flat bench. Your wrists should be hanging over the edge. Start out by curling your wrist upwards and exhaling. Slowly lower your wrists back down to the starting position while inhaling. Your forearms should be stationary as your wrist is the only movement needed to perform this exercise. Repeat for the recommended amount of repetitions. Variations: This exercise can also be performed sitting down by using your thighs as a resting position for your forearms. Your wrist can hang over your knees and the same movements as mentioned above can be performed. You can also use a dumbbell instead of a barbell."),
        Workout(name: "Atlas Stones", type: "Strongman", muscle: "Lower Back", equipment: "Other", difficulty: "Intermediate", instructions: "Begin with the atlas stone between your feet. Bend at the hips to wrap your arms vertically around the Atlas Stone, attempting to get your fingers underneath the stone. Many stones will have a small flat portion on the bottom, which will make the stone easier to hold. Pulling the stone into your torso, drive through the back half of your feet to pull the stone from the ground. As the stone passes the knees, lap it by sitting backward, pulling the stone on top of your thighs. Sit low, getting the stone high onto your chest as you change your grip to reach over the stone. Stand, driving through with your hips. Close distance to the loading platform, and lean back, extending the hips to get the stone as high as possible."),
        Workout(name: "Dumbbell Front Raise to Lateral Raise", type: "Strength", muscle: "Shoulders", equipment: "Dumbbell", difficulty: "Intermediate", instructions: "In a standing position, hold a pair of dumbbells at your side. This will be your starting position. Keeping your elbows slightly bent, raise the weights directly in front of you to shoulder height, avoiding any swinging or cheating. At the top of the exercise, move the weights out in front of you, keeping your arms extended. Lower the weights with a controlled motion. On the next repetition, raise the weights in front of you to shoulder height before moving the weights laterally to your sides. Lower the weights to the starting position.")

        
    ]
}
struct WorkoutResponse: Decodable {
    var results: [Workout] = []
}
