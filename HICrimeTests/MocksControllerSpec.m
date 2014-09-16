//
//  ViewControllerSpec.m
//  HICrime
//
//  Created by George Lee on 9/15/14.
//  Copyright 2014 OUDL. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "ViewController.h"
#import "AFHTTPRequestOperationManager.h"

SPEC_BEGIN(MocksControllerSpec)

describe(@"ViewController", ^{
    let(controller, ^{
        return [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"ViewController"];
    });

    specify(^{[[controller should] beKindOfClass:[ViewController class]];});

    describe(@"mocked fetch locations", ^{
        let(mockManager, ^{return [AFHTTPRequestOperationManager mock];});

        beforeEach(^{
            [AFHTTPRequestOperationManager stub:@selector(manager) andReturn:mockManager];
        });

        it(@"fetches locations at initialization AFNetworking", ^{
            [[mockManager should] receive:@selector(GET:parameters:success:failure:)];
            [controller loadView];
            [controller viewDidLoad];
        });

        it(@"fetches using the data.honolulu.gov endpoint", ^{
            KWCaptureSpy *spy = [mockManager captureArgument:@selector(GET:parameters:success:failure:) atIndex:0];
            [controller loadView];
            [controller viewDidLoad];

            [[[spy argument] should] equal:@"http://data.honolulu.gov/resource/a96q-gyhq.json"];
        });
    });
});

SPEC_END
