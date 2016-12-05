//
//  AjouterMatiereController.h
//  projet_ios_1
//
//  Created by hichem on 11/26/16.
//  Copyright © 2016 hichem. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AjouterMatiereController : UIViewController
@property IBOutlet UITextField* txt_ajout_nom;
@property IBOutlet UITextField* txt_ajout_note;
@property IBOutlet UITextField* txt_ajout_coeff;
@property IBOutlet UIButton*  bt_ajou_mat;
@property IBOutlet UILabel* lab_err_nom;
@property IBOutlet UILabel* lab_err_note;
@property IBOutlet UILabel* lab_err_coef;
-(BOOL)verificationnom:(NSString*)mp;
-(BOOL)verificationnote:(NSString*)mp;
-(BOOL)verificationcoef:(NSString*)mp;

@end
