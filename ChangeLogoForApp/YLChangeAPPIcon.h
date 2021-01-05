//
//  YLChangeAPPIcon.h
//  ChangeLogoForApp
//
//  Created by AlbertYuan on 2021/1/5.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface YLChangeAPPIcon : NSObject

+ (NSString *)getCurrentAppIconName ;


+ (BOOL)canChangeAppIcon;


+ (void)changeAppIconWithIconName:(NSString *)iconName completionHandler:(void (^)(NSError * _Nullable err))completionHandler;


@end

NS_ASSUME_NONNULL_END
