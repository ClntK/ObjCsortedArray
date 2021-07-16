//
//  main.m
//  Wk2Ch6Ex6
//
//  Created by user193857 on 7/9/21.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    
    @autoreleasepool {
        // creaet date format
        NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"MM-dd-yyyy"];
        // create an NSArray that stores 5 birth dates
        NSArray * birthDates = [NSArray arrayWithObjects:@"09-27-1988", @"10-14-1996", @"07-23-1991", @"10-17-1995", @"12-25-1991", nil];
        // create a mutable array to append ages to
        NSMutableArray * ageArray = [NSMutableArray new];
        // create a calendar object
        NSCalendar * greg = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
        // count items in arrays
        int birthDatesLength = [birthDates count];
        int ageArrayLength;
        
        
        //calculate age for each person in array and append the age value to the mutable array ageArray
        for (int i = 0; i < birthDatesLength; i++) {
            // get next item from array
            NSString * birthday = [birthDates objectAtIndex: i];
            // format the birthday value
            NSDate * bday = [formatter dateFromString:birthday];
            // calculate the amount of time between dates
            NSDateComponents * years = [greg components:NSCalendarUnitYear
                                                fromDate: bday
                                                 toDate:[NSDate date]
                                             options:0];
            int age = years.year;
            //NSLog(@"%i", age);
            // add the value of the years variable (the persons age) to the ageArray and convert value to integer
            [ageArray addObject: [NSNumber numberWithInt: age]];
            //NSLog(@"%@", ageArray);
            
        }
        // sort the array
        ageArrayLength = [ageArray count];
        NSArray * sortedArray = [ageArray sortedArrayUsingSelector:@selector(compare:)];
        // print array object
        NSLog(@"%@", sortedArray);
        // print lines independently
        for (int i = 0; i < ageArrayLength; i++){
            NSLog(@"%@", [sortedArray objectAtIndex:i]);
        }
    }
    return 0;
}
