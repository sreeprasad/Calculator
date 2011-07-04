//
//  CalculatorBrain.m
//  Calcualator
//
//  Created by M.S.GOVINDANKUTTY KUTTY on 5/20/11.
//  Copyright 2011 AWROSTAMANI. All rights reserved.
//

#import "CalculatorBrain.h"
#import <math.h>


/* #define DEGREES( radians ) ( radians * 180 / M_PI ) */

@implementation CalculatorBrain

/* Set operand */
-(void)setOperand:(double)anOperand
{
	operand= anOperand;
	
}

-(void)setMemoryOperand:(double)anOperand{
	memoryOperand= anOperand;
}
-(double)getMemoryOperand{
	return memoryOperand;
}



-(void)performWaitingOperation
{
	if([waitingOperation isEqual:@"+"])
		{
		operand=waitingOperand+operand;
		}
	else if ([waitingOperation isEqual:@"-"])
		{			
			operand=waitingOperand-operand;
		}
	else if([waitingOperation isEqual:@"/"])
		{ 
			if(operand)
			{
			operand=waitingOperand/operand;
			}else{
				UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"Cannot divide by Zero"
																	message:@"You are attempting to divide by Zero!" 
																   delegate:self 
																 cancelButtonTitle:@"OK" otherButtonTitles:nil];
				[alertView show];
				[alertView release];
			}
		}
	else if([waitingOperation isEqual:@"*"])
	{
		operand=waitingOperand*operand;
	}
	else if([waitingOperation isEqual:@"1/x"])
	{
		if(operand)
		{
			operand=1/waitingOperand;
		}
	}
		

}
 


/* Perform Operation */
-(double)performOperation:(NSString *)operation
{
	
	
	
	if([operation isEqual:@"sqrt"])
	{
		operand=sqrt(operand);
	}
	else if([operation isEqual:@"+/-"]){
		operand=operand*-1;
	}
    else if([operation isEqual:@"sin"]){
		operand = (operand*M_PI/180.0);
 
		operand=sin(operand);
	 }
	else if([operation isEqual:@"cos"]){
		operand= (operand*M_PI/180.0);
		operand=cos(operand);
	 	
	}else if([operation isEqual:@"MS" ]){
		[self setMemoryOperand:operand ];
	}else if([operation isEqual:@"MR" ]){
		operand=[self getMemoryOperand];
	}else if([operation isEqual:@"M+"]){
		double memory_value =[self getMemoryOperand];
		operand=memory_value+operand;
	}else if([operation isEqual:@"C"]){
		[self setMemoryOperand:0];
		operand=0;
	}else if([operation isEqual:@"B"]){
		
	}
	else
	{
		[self performWaitingOperation];
		waitingOperand= operand;
		waitingOperation= operation;
	}
	return operand;
}

 


@end
