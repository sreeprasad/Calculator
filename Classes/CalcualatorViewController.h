//
//  CalcualatorViewController.h
//  Calcualator
//
//  Created by M.S.GOVINDANKUTTY KUTTY on 5/20/11.
//  Copyright 2011 AWROSTAMANI. All rights reserved.
//

#import <UIKit/UIKit.h>
#import"CalculatorBrain.h"	

@interface CalcualatorViewController : UIViewController {

	/* Connection from controller to view */
	IBOutlet UILabel *display;
	IBOutlet UILabel *memorydisplay;
	
	/* Connection from controller to model  */
	CalculatorBrain *brain;
	
	/* Instance variable to check if user is in the middle of typing number */
	BOOL user_is_middle_of_typing_number;
	
	BOOL user_has_used_pointer;
}

/*digitPressed and operationPressed */
-(IBAction)digitPressed:(UIButton *) sender;
-(IBAction)operationPressed:(UIButton *) sender;
-(IBAction)backspacePressed:(UIButton *)sender;


@end

