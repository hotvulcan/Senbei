//
//  Campaign.m
//  Senbei
//
//  Created by Adrian on 1/21/10.
//  Copyright (c) 2010, akosma software / Adrian Kosmaczewski
//  All rights reserved.
//
//  Redistribution and use in source and binary forms, with or without
//  modification, are permitted provided that the following conditions are met:
//  1. Redistributions of source code must retain the above copyright
//  notice, this list of conditions and the following disclaimer.
//  2. Redistributions in binary form must reproduce the above copyright
//  notice, this list of conditions and the following disclaimer in the
//  documentation and/or other materials provided with the distribution.
//  3. All advertising materials mentioning features or use of this software
//  must display the following acknowledgement:
//  This product includes software developed by akosma software.
//  4. Neither the name of the akosma software nor the
//  names of its contributors may be used to endorse or promote products
//  derived from this software without specific prior written permission.
//
//  THIS SOFTWARE IS PROVIDED BY ADRIAN KOSMACZEWSKI ''AS IS'' AND ANY
//  EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
//  WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
//  DISCLAIMED. IN NO EVENT SHALL ADRIAN KOSMACZEWSKI BE LIABLE FOR ANY
//  DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
//  (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
//   LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
//  ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
//  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
//  SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//

#import "Campaign.h"

@implementation Campaign

@synthesize budget = _budget;
@synthesize endsOn = _endsOn;
@synthesize leadsCount = _leadsCount;
@synthesize objectives = _objectives;
@synthesize opportunitiesCount = _opportunitiesCount;
@synthesize revenue = _revenue;
@synthesize startsOn = _startsOn;
@synthesize status = _status;
@synthesize conversionTarget = _conversionTarget;
@synthesize leadsTarget = _leadsTarget;
@synthesize revenueTarget = _revenueTarget;

+ (NSString *)serverPath
{
    return @"campaigns";
}

- (id)initWithTBXMLElement:(TBXMLElement *)element
{
    if (self = [super initWithTBXMLElement:element])
    {
        self.budget = [[BaseEntity stringValueForElement:@"budget" parentElement:element] doubleValue];
        self.endsOn = [self.formatter dateFromString:[BaseEntity stringValueForElement:@"ends-on" 
                                                                         parentElement:element]];
        self.leadsCount = [[BaseEntity stringValueForElement:@"leads-count" 
                                               parentElement:element] intValue];
        self.objectives = [BaseEntity stringValueForElement:@"objectives" parentElement:element];
        self.opportunitiesCount = [[BaseEntity stringValueForElement:@"opportunities-count" 
                                                       parentElement:element] intValue];
        self.revenue = [[BaseEntity stringValueForElement:@"revenue" 
                                            parentElement:element] doubleValue];
        self.startsOn = [self.formatter dateFromString:[BaseEntity stringValueForElement:@"starts-on" 
                                                                           parentElement:element]];
        self.status = [BaseEntity stringValueForElement:@"status" parentElement:element];
        self.conversionTarget = [[BaseEntity stringValueForElement:@"target-conversion" parentElement:element] floatValue];
        self.leadsTarget = [[BaseEntity stringValueForElement:@"target-leads" parentElement:element] intValue];
        self.revenueTarget = [[BaseEntity stringValueForElement:@"target-revenue" parentElement:element] doubleValue];
    }
    return self;
}

- (void)dealloc
{
    self.endsOn = nil;
    self.objectives = nil;
    self.startsOn = nil;
    self.status = nil;
    [super dealloc];
}

- (NSString *)description
{
    return self.status;
}

@end
