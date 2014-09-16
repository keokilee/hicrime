//
//  ViewControllerSpec.m
//  HICrime
//
//  Created by George Lee on 9/15/14.
//  Copyright 2014 OUDL. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "ViewController.h"


SPEC_BEGIN(BasicViewControllerSpec)

describe(@"ViewController", ^{
    let(controller, ^{return [[ViewController alloc] init];});

    beforeEach(^{
        [controller viewDidLoad];
    });

    specify(^{[[controller should] conformToProtocol:@protocol(UITableViewDataSource)];});
    specify(^{[[controller should] conformToProtocol:@protocol(UITableViewDelegate)];});
    specify(^{[[controller should] beKindOfClass:[UITableViewController class]];});
    specify(^{[[controller should] respondToSelector:@selector(fetchIncidents)];});

    describe(@"initialization", ^{
        beforeEach(^{
            [controller viewDidLoad];
        });

        it(@"initializes an empty list of incidents", ^{
            [[[controller incidents] should] beEmpty];
        });
    });

    describe(@"table view", ^{
        beforeEach(^{
            [controller viewDidLoad];
        });

        it(@"has 0 rows by default", ^{
            [[theValue([controller tableView:nil numberOfRowsInSection:0]) should] equal:theValue(0)];
        });

        it(@"has the same number of rows as the number of incidents", ^{
            [controller setIncidents:@[@{}]];
            [[theValue([controller tableView:nil numberOfRowsInSection:0]) should] equal:theValue(1)];
        });
    });
});

SPEC_END
