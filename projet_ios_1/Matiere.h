//
//  Matiere.h
//  projet_ios_1
//
//  Created by hichem on 11/26/16.
//  Copyright © 2016 hichem. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Matiere : NSObject
@property (strong, nonatomic) NSString* nom_mat;
@property (strong, nonatomic) NSString* note;
@property (strong, nonatomic) NSString* coef;
-(id)initMatiereWithName:(NSString*)name withCoef:(NSString*) coef withNote:(NSString*)note;
-(void)addMatiereToList:(NSMutableArray*) list;
@end
