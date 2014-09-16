//
//  ViewControllerSpecSpec.m
//  HICrime
//
//  Created by George Lee on 9/15/14.
//  Copyright 2014 OUDL. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "ViewController.h"
#import "Nocilla.h"

SPEC_BEGIN(AsyncControllerSpec)

describe(@"ViewController", ^{
    let(controller, ^{
        return [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"ViewController"];
    });

    context(@"Stubbed requests", ^{
        let(dataUrl, ^{return @"http://data.honolulu.gov/resource/a96q-gyhq.json";});

        beforeAll(^{
            [[LSNocilla sharedInstance] start];
        });

        afterAll(^{
            [[LSNocilla sharedInstance] stop];
        });

        afterEach(^{
            [[LSNocilla sharedInstance] clearStubs];
        });

        beforeEach(^{
            [controller loadView];
        });

        it(@"reloads the data eventually.", ^{
            stubRequest(@"GET", dataUrl).andReturn(200);

            [[[controller tableView] shouldEventually] receive:@selector(reloadData)];
            [controller fetchIncidents];
        });

        it(@"adds incidents eventually.", ^{
            stubRequest(@"GET", dataUrl).andReturn(200);
            [controller fetchIncidents];
            [[controller shouldEventually] receive:@selector(setIncidents:)];
        });
    });
});

SPEC_END
