//
//  Reswelect.swift
//  Reswelect
//
//  Created by William Key on 6/6/16.
//  Copyright © 2016 William Key. All rights reserved.
//

import Foundation

// http://blog.scottlogic.com/2014/09/22/swift-memoization.html
// http://stackoverflow.com/questions/31129211/need-detailed-explanation-for-memoize-implementation-in-swift-wwdc-14-session

func memoize<T: Hashable, U>(fn: (T) -> U) -> (T) -> U {
    var memo = Dictionary<T, U>()
    
    func result(selector: T) -> U {
        if let q = memo[selector] { return q }
        let r = fn(selector)
        memo[selector] = r
        return r
    }
    
    return result
}

public func createSelector<TInput: Hashable, TOutput, T1>(selector1: (TInput) -> T1, _ combine: (T1) -> TOutput) -> (TInput) -> TOutput {
    return memoize({ (state) in
        return combine(selector1(state))
    })
}

public func createSelector<TInput: Hashable, TOutput, T1, T2>(selector1: (TInput) -> T1, _ selector2: (TInput) -> T2, _ combine: (T1, T2) -> TOutput) -> (TInput) -> TOutput {
    return memoize({ (state) in
        return combine(selector1(state), selector2(state))
    })
}

public func createSelector<TInput: Hashable, TOutput, T1, T2, T3>(selector1: (TInput) -> T1, _ selector2: (TInput) -> T2, selector3: (TInput) -> T3, _ combine: (T1, T2, T3) -> TOutput) -> (TInput) -> TOutput {
    return memoize({ (state) in
        return combine(selector1(state), selector2(state), selector3(state))
    })
}

public func createSelector<TInput: Hashable, TOutput, T1, T2, T3, T4>(selector1: (TInput) -> T1, _ selector2: (TInput) -> T2, selector3: (TInput) -> T3, selector4: (TInput) -> T4, _ combine: (T1, T2, T3, T4) -> TOutput) -> (TInput) -> TOutput {
    return memoize({ (state) in
        return combine(selector1(state), selector2(state), selector3(state), selector4(state))
    })
}

public func createSelector<TInput: Hashable, TOutput, T1, T2, T3, T4, T5>(selector1: (TInput) -> T1, _ selector2: (TInput) -> T2, selector3: (TInput) -> T3, selector4: (TInput) -> T4, selector5: (TInput) -> T5, _ combine: (T1, T2, T3, T4, T5) -> TOutput) -> (TInput) -> TOutput {
    return memoize({ (state) in
        return combine(selector1(state), selector2(state), selector3(state), selector4(state), selector5(state))
    })
}

public func createSelector<TInput: Hashable, TOutput, T1, T2, T3, T4, T5, T6>(selector1: (TInput) -> T1, _ selector2: (TInput) -> T2, selector3: (TInput) -> T3, selector4: (TInput) -> T4, selector5: (TInput) -> T5, selector6: (TInput) -> T6, _ combine: (T1, T2, T3, T4, T5, T6) -> TOutput) -> (TInput) -> TOutput {
    return memoize({ (state) in
        return combine(selector1(state), selector2(state), selector3(state), selector4(state), selector5(state), selector6(state))
    })
}

public func createSelector<TInput: Hashable, TOutput, T1, T2, T3, T4, T5, T6, T7>(selector1: (TInput) -> T1, _ selector2: (TInput) -> T2, selector3: (TInput) -> T3, selector4: (TInput) -> T4, selector5: (TInput) -> T5, selector6: (TInput) -> T6, selector7: (TInput) -> T7, _ combine: (T1, T2, T3, T4, T5, T6, T7) -> TOutput) -> (TInput) -> TOutput {
    return memoize({ (state) in
        return combine(selector1(state), selector2(state), selector3(state), selector4(state), selector5(state), selector6(state), selector7(state))
    })
}

public func createSelector<TInput: Hashable, TOutput, T1, T2, T3, T4, T5, T6, T7, T8>(selector1: (TInput) -> T1, _ selector2: (TInput) -> T2, selector3: (TInput) -> T3, selector4: (TInput) -> T4, selector5: (TInput) -> T5, selector6: (TInput) -> T6, selector7: (TInput) -> T7, selector8: (TInput) -> T8, _ combine: (T1, T2, T3, T4, T5, T6, T7, T8) -> TOutput) -> (TInput) -> TOutput {
    return memoize({ (state) in
        return combine(selector1(state), selector2(state), selector3(state), selector4(state), selector5(state), selector6(state), selector7(state), selector8(state))
    })
}

public func createSelector<TInput: Hashable, TOutput, T1, T2, T3, T4, T5, T6, T7, T8, T9>(selector1: (TInput) -> T1, _ selector2: (TInput) -> T2, selector3: (TInput) -> T3, selector4: (TInput) -> T4, selector5: (TInput) -> T5, selector6: (TInput) -> T6, selector7: (TInput) -> T7, selector8: (TInput) -> T8, selector9: (TInput) -> T9, _ combine: (T1, T2, T3, T4, T5, T6, T7, T8, T9) -> TOutput) -> (TInput) -> TOutput {
    return memoize({ (state) in
        return combine(selector1(state), selector2(state), selector3(state), selector4(state), selector5(state), selector6(state), selector7(state), selector8(state), selector9(state))
    })
}

public func createSelector<TInput: Hashable, TOutput, T1, T2, T3, T4, T5, T6, T7, T8, T9, T10>(selector1: (TInput) -> T1, _ selector2: (TInput) -> T2, selector3: (TInput) -> T3, selector4: (TInput) -> T4, selector5: (TInput) -> T5, selector6: (TInput) -> T6, selector7: (TInput) -> T7, selector8: (TInput) -> T8, selector9: (TInput) -> T9, selector10: (TInput) -> T10, _ combine: (T1, T2, T3, T4, T5, T6, T7, T8, T9, T10) -> TOutput) -> (TInput) -> TOutput {
    return memoize({ (state) in
        return combine(selector1(state), selector2(state), selector3(state), selector4(state), selector5(state), selector6(state), selector7(state), selector8(state), selector9(state), selector10(state))
    })
}

public func createSelector<TInput: Hashable, TOutput, T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11>(selector1: (TInput) -> T1, _ selector2: (TInput) -> T2, selector3: (TInput) -> T3, selector4: (TInput) -> T4, selector5: (TInput) -> T5, selector6: (TInput) -> T6, selector7: (TInput) -> T7, selector8: (TInput) -> T8, selector9: (TInput) -> T9, selector10: (TInput) -> T10, selector11: (TInput) -> T11, _ combine: (T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11) -> TOutput) -> (TInput) -> TOutput {
    return memoize({ (state) in
        return combine(selector1(state), selector2(state), selector3(state), selector4(state), selector5(state), selector6(state), selector7(state), selector8(state), selector9(state), selector10(state), selector11(state))
    })
}

public func createSelector<TInput: Hashable, TOutput, T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12>(selector1: (TInput) -> T1, _ selector2: (TInput) -> T2, selector3: (TInput) -> T3, selector4: (TInput) -> T4, selector5: (TInput) -> T5, selector6: (TInput) -> T6, selector7: (TInput) -> T7, selector8: (TInput) -> T8, selector9: (TInput) -> T9, selector10: (TInput) -> T10, selector11: (TInput) -> T11, selector12: (TInput) -> T12, _ combine: (T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12) -> TOutput) -> (TInput) -> TOutput {
    return memoize({ (state) in
        return combine(selector1(state), selector2(state), selector3(state), selector4(state), selector5(state), selector6(state), selector7(state), selector8(state), selector9(state), selector10(state), selector11(state), selector12(state))
    })
}

public func createSelector<TInput: Hashable, TOutput, T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13>(selector1: (TInput) -> T1, _ selector2: (TInput) -> T2, selector3: (TInput) -> T3, selector4: (TInput) -> T4, selector5: (TInput) -> T5, selector6: (TInput) -> T6, selector7: (TInput) -> T7, selector8: (TInput) -> T8, selector9: (TInput) -> T9, selector10: (TInput) -> T10, selector11: (TInput) -> T11, selector12: (TInput) -> T12, selector13: (TInput) -> T13, _ combine: (T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13) -> TOutput) -> (TInput) -> TOutput {
    return memoize({ (state) in
        return combine(selector1(state), selector2(state), selector3(state), selector4(state), selector5(state), selector6(state), selector7(state), selector8(state), selector9(state), selector10(state), selector11(state), selector12(state), selector13(state))
    })
}

public func createSelector<TInput: Hashable, TOutput, T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14>(selector1: (TInput) -> T1, _ selector2: (TInput) -> T2, selector3: (TInput) -> T3, selector4: (TInput) -> T4, selector5: (TInput) -> T5, selector6: (TInput) -> T6, selector7: (TInput) -> T7, selector8: (TInput) -> T8, selector9: (TInput) -> T9, selector10: (TInput) -> T10, selector11: (TInput) -> T11, selector12: (TInput) -> T12, selector13: (TInput) -> T13, selector14: (TInput) -> T14, _ combine: (T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14) -> TOutput) -> (TInput) -> TOutput {
    return memoize({ (state) in
        return combine(selector1(state), selector2(state), selector3(state), selector4(state), selector5(state), selector6(state), selector7(state), selector8(state), selector9(state), selector10(state), selector11(state), selector12(state), selector13(state), selector14(state))
    })
}