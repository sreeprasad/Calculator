//
//  CalcualatorViewController.m
//  Calcualator
//
//  Created by M.S.GOVINDANKUTTY KUTTY on 5/20/11.
//  Copyright 2011 AWROSTAMANI. All rights reserved.
//

#import "CalcualatorViewController.h"

@implementation CalcualatorViewController

/* Return calculator brain if not used. Lazy instantiation.*/
-(CalculatorBrain *)brain{
	if(!brain){
		brain=[[CalculatorBrain alloc] init];
	}
	return brain;
}

/*digitPressed and operationPressed */-(IBAction)digitPressed:(UIButton *)sender
{

	NSString *digit = [[sender titleLabel]text];
 
	NSRange range = [[display text] rangeOfString:@"."];
	
	if(user_is_middle_of_typing_number){
		if(!([digit isEqual:@"."] && (range.location !=NSNotFound)))
			if([digit isEqual:@"B"]){
			
				NSString *myString =[display text];
				if(([[display text] length]>1)){
					myString =[myString substringToIndex:([myString length]-1)];
					[display setText:myString];
				}else{
					[display setText:@"0"];
				}
		 
			}else
			 [display setText:[[display text] stringByAppendingString:digit]];
	}else{
			if([digit isEqual:@"."])
				[display setText:@"0."];
				else
					if([digit isEqual:@"B"]){
						
						NSString *myString =[display text];
						if(([[display text] length]>1)){
							myString =[myString substringToIndex:([myString length]-1)];
							[display setText:myString];
						}else{
							[display setText:@"0"];
						}

						
					}else
						if([digit isEqual:@"PI"]){
							
							[display setText: [NSString stringWithFormat:@"%16.5g",M_PI]];
													user_is_middle_of_typing_number= YES;
							
						}else 
					{
						
					
					[display setText: digit];
			 
						user_is_middle_of_typing_number= YES;
					}
	
		}
		
}

-(IBAction)operationPressed:(UIButton *) sender{

 
	/* If user is in middle of typing number then set the text as operand */
	if(user_is_middle_of_typing_number){
	 
		 
		[[self brain] setOperand:[[display text] doubleValue]];
		user_is_middle_of_typing_number=NO;
	}
	
	
	/* send a message to an object that is obtained by sending another message
	 sender title sends title label to sender. Title button uses title label for text
	 sender sends title label and asks for its text
	 */
	NSString *operation =[[sender titleLabel] text];
	
	/* Getting result. Tell brain instance to perform operation
	 return self brain to self & pefrom title */
	double result = [[self brain] performOperation:operation];
	
	/* UILabel reponds to set text */
	[display setText:[NSString stringWithFormat:@"%g",result]];
	
}
-(IBAction)backspacePressed:(UIButton *)sender{
	
}


@end
