//
//  Animal.h
//  It's A Zoo
//
//  Created by Jocelyn on 1/14/15.
//  Copyright (c) 2015 Jocelyn. All rights reserved.
//

#ifndef It_s_A_Zoo_Animal_h
#define It_s_A_Zoo_Animal_h

#include <UIKit/UIKit.h>

@interface Animal : NSObject 

@property (nonatomic,strong) NSString *name;
@property (nonatomic,strong) NSString *species;
@property (nonatomic,strong) NSNumber *age;
@property (nonatomic,strong) UIImage *image;

-(NSString *)description;

@end


#endif
