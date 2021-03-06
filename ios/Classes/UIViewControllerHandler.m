//
//  UIViewControllerHandler.m
//  foundation_fluttify
//
//  Created by Yohom Bao on 2020/6/6.
//

#import "UIViewControllerHandler.h"
#import <Flutter/Flutter.h>

extern NSMutableDictionary<NSString *, NSObject *> *STACK;
extern NSMutableDictionary<NSNumber *, NSObject *> *HEAP;
extern BOOL enableLog;

void UIViewControllerHandler(NSString* method, id args, FlutterResult methodResult) {
    if ([@"UIViewController::get" isEqualToString:method]) {
        UIViewController* controller = [UIApplication sharedApplication].keyWindow.rootViewController;

        HEAP[@(controller.hash)] = controller;
        
        methodResult(@(controller.hash));
    } else {
        methodResult(FlutterMethodNotImplemented);
    }
}
