//
//  CalculatorBrain.h
//  Calcualator
//
//  Created by M.S.GOVINDANKUTTY KUTTY on 5/20/11.
//  Copyright 2011 AWROSTAMANI. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface CalculatorBrain : NSObject {
	
	double operand;
	double memoryOperand;
	double waitingOperand;
	NSString *waitingOperation;

}
/* Set operand */
-(void)setOperand:(double)anOperand;
/* peform waiting operation */
-(void)performWaitingOperation;
/* Perform Operation */
-(double)performOperation:(NSString *)operation;
/* Set the memory operand */
-(void)setMemoryOperand:(double)anOperand;
/* Get memory operand */
-(double)getMemoryOperand;
 
 
@end
