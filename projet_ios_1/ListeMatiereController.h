//
//  ListeMatiereController.h
//  projet_ios_1
//
//  Created by hichem on 11/26/16.
//  Copyright © 2016 hichem. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListeMatiereController : UIViewController
@property IBOutlet UITableView* matieres_table;
@property IBOutlet UIButton* bt_afficher_moy;
@property IBOutlet UIButton* bt_ajouter_matiere_menu;
@property  (strong,nonatomic) NSString*  result;
-(NSInteger)calculer_somme;
@end
