//
//  AjouterMatiereController.m
//  projet_ios_1
//
//  Created by hichem on 11/26/16.
//  Copyright © 2016 hichem. All rights reserved.
//

#import "AjouterMatiereController.h"
#import "ListeMatiereController.h"
#import "AppDelegate.h"
#import "Matiere.h"
@interface AjouterMatiereController ()

@end

@implementation AjouterMatiereController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(BOOL)verificationnom:(NSString*)mp
{
    if(!([mp isEqualToString:@""]))
    {
        if ([mp length]>6) {
            return YES;
        }else
        {
            _lab_err_nom.text=@"longeur de matiere doit superier a 6";
            return NO;
        }
    }else
    {
        _lab_err_nom.text=@"nom matiere de doit pas etre vide";
        return NO;
    }
    
}


-(BOOL)verificationnote:(NSString*)mp
{
    if(!([mp isEqualToString:@""]))
    {
        if ([mp length]>0) {
            return YES;
        }else
        {
            _lab_err_note.text=@"longeur de note doit superier a 3";
            return NO;
        }
    }else
    {
        _lab_err_note.text=@"note de doit pas etre vide";
        return NO;
    }
    
}


-(BOOL)verificationcoef:(NSString*)mp
{
    if(!([mp isEqualToString:@""]))
    {
        if ([mp length]>0) {
            return YES;
        }else
        {
            _lab_err_coef.text=@"longeur de coef doit superier a 3";
            return NO;
        }
    }else
    {
        _lab_err_coef.text=@"mot de coef pas etre vide";
        return NO;
    }
    
}

- (IBAction)ajouter_matiere:(id)sender {
 
    if ([self verificationnom:_txt_ajout_nom.text]==YES && [self verificationnote:_txt_ajout_note.text]==YES && [self verificationcoef:_txt_ajout_coeff.text]==YES) {
       /* Matiere* mat = [[Matiere alloc] initMatiereWithName:_txt_ajout_nom.text withCoef:_txt_ajout_coeff.text withNote:_txt_ajout_note.text];
        
        
        AppDelegate* appd = (AppDelegate*)[[UIApplication sharedApplication] delegate];
        
        
        [mat addMatiereToList:appd.listMatiere];
        //NSLog(@"sdf");
        */
        NSString* url=@"http://192.168.1.2/ios/matieres/setmatiere.php?";
        [self getservice:url];
        
        ListeMatiereController* liste_mat = [self.storyboard instantiateViewControllerWithIdentifier:@"ListeMatiereController"];
        
        [self.navigationController pushViewController:liste_mat animated:YES];
        
        
    }
    

    
    
    
   
}


-(void)getservice:(NSString*)url
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        _bt_ajou_mat.enabled=NO;
        
        NSData*  jsondata=[self sendrequest:url nom:_txt_ajout_nom.text note: _txt_ajout_note.text coeff:_txt_ajout_coeff.text];
        
        
        [self fetchJson:jsondata];
        
        
        dispatch_async(dispatch_get_main_queue(), ^{
            //Your main thread code goes in here
            NSLog(@"Im on the main thread");
            _bt_ajou_mat.enabled=YES;
            
        });
    });
    
    
}
-(void) fetchJson:(NSData*)jsonData {
    
    
    NSError *error;
    
    id jsonobject=[NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
    
    if ([jsonobject isKindOfClass:[NSDictionary class]]) {
        NSDictionary *dict=(NSDictionary *)jsonobject;
        NSLog(@"dict==%@",dict);
        NSString *msg = [dict objectForKey:@"msg"];
        
        NSLog(@"msg %@", msg);
        
        
    }
    else
    {
        NSArray *array=(NSArray *)jsonobject;
        NSLog(@"array==%@",array);
    }
    
    
    
}
-(NSData*)sendrequest:(NSString*)url nom:(NSString*)nom note:(NSString*)note coeff:(NSString*)coeff
{
    
    NSString *basePath =url;
    NSString *fullPath = [basePath stringByAppendingFormat:@"nom=%@&note=%@&coeff=%@",nom,note,coeff];
    NSData *jsonData = [NSData dataWithContentsOfURL:
                        [NSURL URLWithString:fullPath]];
    return jsonData;
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
