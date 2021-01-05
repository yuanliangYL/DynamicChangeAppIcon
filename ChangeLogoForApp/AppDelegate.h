//
//  AppDelegate.h
//  ChangeLogoForApp
//
//  Created by AlbertYuan on 2021/1/5.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

