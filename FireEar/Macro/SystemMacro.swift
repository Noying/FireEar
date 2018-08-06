//
//  SystemMacro.swift
//  FireEar
//  这个文件会很大，主要是用于处理系统事件，比如注册通知，比如返回长宽高
//
//  Created by roy on 2018/8/4.
//  Copyright © 2018年 Iceroy. All rights reserved.
//

import UIKit
import AVFoundation
import UserNotifications

class SystemMacro: NSObject {
    // 让音乐后台运行
    static func registarMusicPlayBack(application :UIApplication) -> Void {
        do{
            let session = AVAudioSession.sharedInstance()
            try session.setCategory(AVAudioSessionCategoryPlayback)
            try session.setActive(true)
        }catch{
            print(error)
        }
    }
    
    //开启本地通知权限
    static func permissLocationNotification(_ application:UIApplication)->Void{
        do{
            if #available(iOS 10.0, *) {
                let center = UNUserNotificationCenter.current()
                center.requestAuthorization(options: [UNAuthorizationOptions.alert,UNAuthorizationOptions.sound], completionHandler: {(granted:Bool,error:Error?) -> Void in
                    //主要做未给授权的处理，我这里就不做任何处理了，不然要改整个函数结构
                })
            } else {
                // Fallback on earlier versions
                //低于10.0版本的
                if(application.currentUserNotificationSettings?.types == UIUserNotificationTypeNone){
                    application.registerUserNotificationSettings(UIUserNotificationSettings.init(types: UIUserNotificationType.alert|UIUserNotificationType.sound|UIUserNotificationType.badge, categories: nil))
                }
            }
        
            
        }catch{
            print(error)
        }
    }
    
    
}
