[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage) 
[![](https://img.shields.io/badge/license-MIT-blue.svg)](https://github.com/wpK/reswelect/blob/master/LICENSE.md)
![Platform support](https://img.shields.io/badge/platform-ios%20%7C%20osx%20%7C%20tvos%20%7C%20watchos-lightgrey.svg?style=flat-square)


A port of [reselect](https://github.com/reactjs/reselect) to ReSwift. This is a proof of concept, still has a long way to go!

#Installation

##CocoaPods

You can install Reswelect via CocoaPods by adding it to your `Podfile`:

	use_frameworks!

	source 'https://github.com/CocoaPods/Specs.git'
	platform :ios, '8.0'

	pod 'Reswelect'
	
And run `pod install`.

##Carthage

You can install Reswelect via [Carthage]() by adding the following line to your Cartfile:

	github "wpK/Reswelect"

#Usage

Define your state. Because of the memoization feature, your state must conform to the Hashable protocol:

````swift
struct Item: Hashable {
    let name: String
    let value: Double
    
    var hashValue: Int {
        var hash = 17
        hash = hash * 23 + name.hashValue
        hash = hash * 23 + value.hashValue
        return hash
    }
}

func ==(lhs: Item, rhs: Item) -> Bool {
    return lhs.name == rhs.name && lhs.value == rhs.value
}

struct Shop: Hashable {
    let taxPercent: Double
    let items: [Item]
    
    var hashValue: Int {
        var hash = 17
        hash = hash * 23 + taxPercent.hashValue
        // TODO: Add items
        return hash
    }
}

func ==(lhs: Shop, rhs: Shop) -> Bool {
    return lhs.taxPercent == rhs.taxPercent && lhs.items == rhs.items
}

struct AppState: Hashable {
    let shop: Shop
    
    var hashValue: Int {
        var hash = 17
        hash = hash * 23 + shop.hashValue
        return hash
    }
}

func ==(lhs: AppState, rhs: AppState) -> Bool {
    return lhs.shop == rhs.shop
}
````

A few `selectors`:

````swift
let shopItemsSelector = { (state: AppState) in return state.shop.items }
let taxPercentSelector = { (state: AppState) in return state.shop.taxPercent }

let subtotalSelector = Reswelect.createSelector(shopItemsSelector, { (items: [Item]) in
    return items.reduce(0, combine: {$0 + $1.value})
})

let taxSelector = Reswelect.createSelector(subtotalSelector, taxPercentSelector, { (subtotal, taxPercent) in
    return subtotal * (taxPercent / 100)
})

let totalSelector = Reswelect.createSelector(subtotalSelector, taxSelector, { (subtotal, tax) in
    return subtotal + tax
})
````

Using the selectors:

````swift
let exampleState = AppState(
    shop: Shop(
        taxPercent: 8,
        items: [
            Item(name: "apple", value: 1.20),
            Item(name: "orange", value: 0.95)
        ]
    )
)

print(subtotalSelector(exampleState)) // 2.15
print(taxSelector(exampleState))      // 0.172
print(totalSelector(exampleState))    // 2.322
````

#Credits

- [ReSwift](https://github.com/ReSwift/ReSwift)
- [Reselect](https://github.com/reactjs/reselect)
