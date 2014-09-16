//
//  PendingControllerSpec.m
//  HICrime
//
//  Created by George Lee on 9/15/14.
//  Copyright 2014 OUDL. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "ViewController.h"


SPEC_BEGIN(PendingControllerSpec)

describe(@"ViewController", ^{
    let(controller, ^{
        return [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"ViewController"];
    });

    describe(@"Table View Cell", ^{
        let(indexPath, ^{return [NSIndexPath indexPathForRow:0 inSection:0];});

        beforeEach(^{
            [controller loadView];
            [controller viewDidLoad];
            [controller setIncidents:@[@{@"blockaddress": @"4400 BLOCK KAPOLEI PKWY", @"type": @"THEFT/LARCENY"}]];
        });

        pending(@"cell should have a title", ^{
            UITableViewCell *cell = [controller tableView:[controller tableView] cellForRowAtIndexPath:indexPath];
        });

        pending(@"cell detail should be the type of the incident", ^{
            UITableViewCell *cell = [controller tableView:[controller tableView] cellForRowAtIndexPath:indexPath];
        });
    });
});

SPEC_END
