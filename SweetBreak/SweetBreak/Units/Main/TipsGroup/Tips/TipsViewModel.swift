//
//  TipsViewModel.swift
//  SweetBreak
//
//  Created by Andrii Momot on 21.02.2025.
//

import Foundation

extension TipsView {
    final class ViewModel: ObservableObject {
        let tips: [Tip] = [
            .init(
                imageName: Asset.tip1.name,
                title: "How to recognize hidden sugar in foods?",
                text: "Sugar is often hidden under many different names, making it hard to spot. It can be labeled as syrup (like high-fructose corn syrup), glucose, dextrose, maltose, and other sweeteners. Manufacturers use these terms to make it harder for consumers to recognize the sugar content. It's essential to check the ingredients list for any of these terms, especially if they appear early in the list, which indicates higher amounts. Even foods you might not expect, like salad dressings or bread, could contain hidden sugars."
            ),
            .init(
                imageName: Asset.tip2.name,
                title: "How does sugar addiction work?",
                text: "Sugar addiction works through a similar mechanism as other addictions. When you eat sugar, it triggers a release of dopamine, the 'feel-good' neurotransmitter, in the brain. This creates a pleasurable feeling, reinforcing the desire to consume more sugar. However, over time, your body can become tolerant to sugar, requiring more to achieve the same effect. Additionally, sugar causes rapid spikes in blood sugar levels, followed by crashes that leave you feeling tired and craving more, perpetuating the cycle of addiction."
            ),
            .init(
                imageName: Asset.tip3.name,
                title: "What to drink instead of sugary beverages?",
                text: "Sugary drinks, such as sodas, energy drinks, and sugary coffees, can contribute to many health problems. Instead of these beverages, try drinking water with a squeeze of lemon or lime for a refreshing, low-calorie option. Herbal teas, like chamomile or peppermint, can be soothing and naturally free of sugar. Homemade smoothies made from fresh fruits and vegetables can provide natural sweetness without added sugar. If you prefer something more substantial, try making a green smoothie with spinach, kale, and berries to give you energy and nutrients without any sugar spikes."
            ),
            .init(
                imageName: Asset.tip4.name,
                title: "How to make food taste great without sugar?",
                text: "Making food delicious without added sugar can be achieved by using natural flavors and spices. Spices like cinnamon, nutmeg, ginger, and vanilla can add sweetness and depth to dishes without any sugar. For savory dishes, herbs and seasonings like garlic, basil, turmeric, or paprika can enhance flavor naturally. If you crave sweetness, try using natural sweeteners like stevia, monk fruit, or a small amount of honey, which have a lower glycemic index compared to refined sugar. Experiment with different combinations to find flavors that work for you!"
            ),
            .init(
                imageName: Asset.tip5.name,
                title: "Why does sugar cause energy crashes?",
                text: "Consuming sugar causes a rapid increase in blood glucose levels, leading to a quick burst of energy. However, this spike is followed by a sharp decline, often referred to as a 'sugar crash.' The sudden drop in blood sugar can leave you feeling fatigued, irritable, and craving more sugar to restore energy levels. To maintain steady energy, opt for complex carbohydrates, healthy fats, and protein-rich foods that provide a more gradual and sustained release of energy."
            ),
            .init(
                imageName: Asset.tip6.name,
                title: "How does sugar affect your skin?",
                text: "Excess sugar consumption can negatively impact your skin by accelerating aging and causing breakouts. High sugar intake leads to glycation, a process where sugar molecules attach to proteins like collagen and elastin, making the skin less firm and more prone to wrinkles. Additionally, sugar spikes insulin levels, triggering inflammation that can worsen acne. Reducing sugar intake and maintaining a balanced diet can help keep your skin healthier and more radiant."
            ),
            .init(
                imageName: Asset.tip7.name,
                title: "Can quitting sugar improve mental clarity?",
                text: "Yes! Reducing sugar intake can improve mental clarity and focus. Sugar consumption leads to blood sugar fluctuations that cause brain fog and difficulty concentrating. Additionally, excessive sugar intake can contribute to inflammation in the brain, which has been linked to cognitive decline and mood disorders. By replacing sugar with nutrient-dense foods, you can support better brain function and sustained mental energy throughout the day."
            ),
            .init(
                imageName: Asset.tip8.name,
                title: "How much sugar is too much?",
                text: "The American Heart Association recommends limiting added sugar intake to no more than 25 grams (6 teaspoons) per day for women and 36 grams (9 teaspoons) for men. However, the average person consumes far more than this due to hidden sugars in processed foods. Reading nutrition labels and choosing whole, unprocessed foods can help you stay within a healthy range and reduce your risk of health issues linked to excessive sugar consumption."
            ),
            .init(
                imageName: Asset.tip9.name,
                title: "Does fruit contain too much sugar?",
                text: "While fruit contains natural sugar, it is also packed with fiber, vitamins, and antioxidants that make it a much healthier choice compared to refined sugar. The fiber in fruit slows down sugar absorption, preventing blood sugar spikes. However, it's best to consume whole fruits rather than fruit juices, which lack fiber and can lead to faster sugar absorption. Eating a variety of fruits in moderation as part of a balanced diet is beneficial for overall health."
            ),
            .init(
                imageName: Asset.tip10.name,
                title: "How to reduce sugar cravings?",
                text: "Reducing sugar cravings involves balancing your diet with proteins, healthy fats, and fiber-rich foods to keep blood sugar levels stable. Drinking plenty of water, getting enough sleep, and managing stress can also help curb cravings. Sometimes, sugar cravings are triggered by emotional factors rather than actual hunger. Replacing sugary snacks with naturally sweet alternatives like berries, nuts, or dark chocolate can satisfy cravings without overloading on sugar."
            )
        ]

    }
}

struct Tip: Identifiable {
    let imageName: String
    let title: String
    let text: String
    
    var id: String { UUID().uuidString }
}
