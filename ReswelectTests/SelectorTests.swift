//
//  StoreTests.swift
//  Reswelect
//
//  Created by William Key on 6/2/16.
//  Copyright © 2016 William Key. All rights reserved.
//

import Quick
import Nimble
@testable import Reswelect

class SelectorSpecs: QuickSpec {
    override func spec() {
        describe("selector") {
            it("basic selector") {
                var recomputations = 0
                
                let selector = Reswelect.createSelector(
                    { (state: BasicState) in return state.a },
                    { (a) in
                        return inc(&recomputations, a)
                })
                    
                expect(selector(BasicState(a: 1))).to(equal(1))
                expect(selector(BasicState(a: 1))).to(equal(1))
                expect(recomputations).to(equal(1))
                expect(selector(BasicState(a: 2))).to(equal(2))
                expect(recomputations).to(equal(2))
            }
            
            it("basic selector multiple keys") {
                var recomputations = 0
                
                let selector = Reswelect.createSelector(
                    { (state: BasicState2) in return state.a },
                    { (state: BasicState2) in return state.b },
                    { (a, b) in
                        return inc(&recomputations, a + b)
                })
                
                expect(selector(BasicState2(a: 1, b: 2))).to(equal(3))
                expect(selector(BasicState2(a: 1, b: 2))).to(equal(3))
                expect(recomputations).to(equal(1))
                expect(selector(BasicState2(a: 3, b: 2))).to(equal(5))
                expect(selector(BasicState2(a: 3, b: 2))).to(equal(5))
                expect(recomputations).to(equal(2))
            }
            
            it("chained selector") {
                var recomputations1 = 0
                var recomputations2 = 0
                
                let selector1 = Reswelect.createSelector(
                    { (state: BasicState3) in return state.sub },
                    { (sub) in
                        return inc(&recomputations1, sub)
                })
                
                let selector2 = Reswelect.createSelector(
                    selector1,
                    { (sub) in
                        return inc(&recomputations2, sub.value)
                })
                
                let state1 = BasicState3(sub: Sub(value: 1))
                expect(selector2(state1)).to(equal(1))
                expect(selector2(state1)).to(equal(1))
                expect(recomputations2).to(equal(1))
                let state2 = BasicState3(sub: Sub(value: 2))
                expect(selector2(state2)).to(equal(2))
                expect(recomputations2).to(equal(2))
            }
    
            it("Tests for readme") {
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
                
                let exampleState = AppState(
                    shop: Shop(
                        taxPercent: 8,
                        items: [
                            Item(name: "apple", value: 1.20),
                            Item(name: "orange", value: 0.95)
                        ]
                    )
                )
                
                expect(subtotalSelector(exampleState)).to(equal(2.15))
                expect(taxSelector(exampleState)).to(equal(0.172))
                expect(totalSelector(exampleState)).to(equal(2.322))
            }
        }
    }
}

func inc<T>(inout recomputations: Int, _ result: T) -> T {
    recomputations = recomputations + 1
    return result
}

struct BasicState: Hashable {
    let a: Int
    
    var hashValue: Int {
        var hash = 17
        hash = hash * 23 + a.hashValue
        return hash
    }
}

func ==(lhs: BasicState, rhs: BasicState) -> Bool {
    return lhs.a == rhs.a
}

struct BasicState2: Hashable {
    let a: Int
    let b: Int
    
    var hashValue: Int {
        var hash = 17
        hash = hash * 23 + a.hashValue
        hash = hash * 23 + b.hashValue
        return hash
    }
}

func ==(lhs: BasicState2, rhs: BasicState2) -> Bool {
    return lhs.a == rhs.a && lhs.b == rhs.b
}

struct Sub: Hashable {
    let value: Int
    
    var hashValue: Int {
        var hash = 17
        hash = hash * 23 + value.hashValue
        return hash
    }
}

func ==(lhs: Sub, rhs: Sub) -> Bool {
    return lhs.value == rhs.value
}

struct BasicState3: Hashable {
    let sub: Sub
    
    var hashValue: Int {
        var hash = 17
        hash = hash * 23 + sub.hashValue
        return hash
    }
}

func ==(lhs: BasicState3, rhs: BasicState3) -> Bool {
    return lhs.sub == rhs.sub
}

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

func ==(lhs: Shop, rhs: Shop) -> Bool {
    return lhs.taxPercent == rhs.taxPercent && lhs.items == rhs.items
}

func ==(lhs: Item, rhs: Item) -> Bool {
    return lhs.name == rhs.name && lhs.value == rhs.value
}