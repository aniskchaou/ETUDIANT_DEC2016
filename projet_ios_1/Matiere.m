//
//  Matiere.m
//  projet_ios_1
//
//  Created by hichem on 11/26/16.
//  Copyright © 2016 hichem. All rights reserved.
//

#import "Matiere.h"

@implementation Matiere
//constructeurs
-(id)initMatiereWithName:(NSString*)name withCoef:(NSString*) coef withNote:(NSString*)note{
    if( self == [super init])
    {
        self.nom_mat = name;
        self.coef = coef;
        self.note=note;
    }
    return self;
}
//ajouter un etudiant
-(void)addMatiereToList:(NSMutableArray*) list{
    [list addObject:self];
}
@end
