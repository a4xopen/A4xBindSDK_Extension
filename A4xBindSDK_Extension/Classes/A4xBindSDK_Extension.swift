//
//  A4xBindSDK_Extension.swift
//
//  Created by wjin on 2022/7/21.
//  Copyright © 2020 wjin. All rights reserved.
//

import CTMediator

fileprivate let ModuleName = "A4xBindSDK"

public extension CTMediator {
    @objc func A4xBindSDK_demo(name: String, callback: @escaping (String)->Void) -> UIViewController? {
        let params:[AnyHashable:Any] = [
            "name": name,
            "callback": callback,
            kCTMediatorParamsKeySwiftTargetModuleName: ModuleName
        ]
        if let viewController = performTarget(ModuleName, action: "demo", params: params, shouldCacheTarget: false) as? UIViewController {
            return viewController
        }
        return nil
    }
    
    @objc func A4xBindSDK_showSwift(callback: @escaping (String) -> Void) -> UIViewController? {
        let params = [
            "callback": callback,
            kCTMediatorParamsKeySwiftTargetModuleName:"\(ModuleName)_swift"
            ] as [AnyHashable : Any]
        if let viewController = self.performTarget(ModuleName, action: "Extension_ViewController", params: params, shouldCacheTarget: false) as? UIViewController {
            return viewController
        }
        return nil
    }
    
    @objc func A4xBindSDK_showObjc(callback: @escaping (String) -> Void) -> UIViewController? {
        let callbackBlock = callback as @convention(block) (String) -> Void
        let callbackBlockObject = unsafeBitCast(callbackBlock, to: AnyObject.self)
        let params = ["callback": callbackBlockObject] as [AnyHashable:Any]
        if let viewController = self.performTarget(ModuleName, action: "Extension_ViewController", params: params, shouldCacheTarget: false) as? UIViewController {
            return viewController
        }
        return nil
    }
}
