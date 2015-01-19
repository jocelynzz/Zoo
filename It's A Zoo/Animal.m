//
//  Animal.m
//  It's A Zoo
//
//  Created by Jocelyn on 1/14/15.
//  Copyright (c) 2015 Jocelyn. All rights reserved.
//

#import "Animal.h"

@interface Animal ()

@end

@implementation Animal


- (NSString *)description
{
    return [NSString stringWithFormat:@"Animal Object: name= %@ species= %@ age= %@ image= %@", _name, _species, _age,_image];
}



@end
