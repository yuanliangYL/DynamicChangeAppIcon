//
//  YLChangeAPPIcon.m
//  ChangeLogoForApp
//
//  Created by AlbertYuan on 2021/1/5.
//

#import "YLChangeAPPIcon.h"

@implementation YLChangeAPPIcon
+ (NSString *)getCurrentAppIconName {
    if (@available(iOS 10.3, *)) {
        
        return ([UIApplication sharedApplication].alternateIconName.length == 0) ? @"" : [UIApplication sharedApplication].alternateIconName;
    } else {
        // Fallback on earlier versions
        return @"";
    }
}


+ (BOOL)canChangeAppIcon {
    if (@available(iOS 10.3, *)) {
        return [[UIApplication sharedApplication] supportsAlternateIcons];
    } else {
        // Fallback on earlier versions
        return NO;
    }
}

+ (void)changeAppIconWithIconName:(NSString *)iconName completionHandler:(void (^)(NSError * _Nullable err))completionHandler {

    if (![self canChangeAppIcon]) {
        return;
    }

    if (@available(iOS 10.3, *)) {
        [[UIApplication sharedApplication] setAlternateIconName:iconName completionHandler:^(NSError * _Nullable error) {
            if (!error) {
                completionHandler(nil);
            } else {
                completionHandler(error);
            }
        }];
    } else {

        // Fallback on earlier versions
        NSDictionary *userInfo = @{
                                   NSLocalizedDescriptionKey: NSLocalizedString(@"AppIcon change failed", nil),
                                   NSLocalizedFailureReasonErrorKey: NSLocalizedString(@"The current system version does not support replacing the AppIcon.", nil),
                                   NSLocalizedRecoverySuggestionErrorKey: NSLocalizedString(@"", nil)
                                   };
        NSError *error = [NSError errorWithDomain:@"no right to change icon"
                                             code:34001
                                         userInfo:userInfo];
        completionHandler(error);
    }
}

@end
