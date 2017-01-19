//
//  People+CoreDataProperties.h
//  CoreData
//
//  Created by CSX on 2017/1/19.
//  Copyright © 2017年 宗盛商业. All rights reserved.
//

#import "People+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface People (CoreDataProperties)

+ (NSFetchRequest<People *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *name;
@property (nonatomic) int16_t age;
@property (nullable, nonatomic, copy) NSString *adress;

@end

NS_ASSUME_NONNULL_END
