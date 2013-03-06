# Undr

Objective-C functional programming "utility-belt" with an [Underscore.js](http://underscorejs.org/#first/)-compatible API.

I'm writing this primarily as a learning experience (and also for fun) and will use this `README` to document where this library differs from Underscore itself (it will in a number of ways).

If you have any suggestions or requests, please let me know. I'm likely doing a lot of things sub-optimally and would love feedback on how this can be improved.

This is not an original idea and you should probably use [Underscore.m](https://github.com/robb/Underscore.m) or [_.m](https://github.com/kmalakoff/_.m) as they're both quite battle tested and this is anything but. That said, those libraries attempt to emulate JavaScript semantics in Objective-C which Undr will specifically aim to avoid. More on that below.

[BlocksKit](https://github.com/pandamonia/BlocksKit) is also probably a really good option albeit with very different goals.

## Goal

The goal is to use Objective-C to implement as many of the Underscore's [Collections](http://underscorejs.org/#collections) and [Arrays](http://underscorejs.org/#arrays) functions as it makes some deal of sense to.

I plan to also implement some of the [Functions](http://underscorejs.org/#functions), [Objects](http://underscorejs.org/#objects), and [Utility](http://underscorejs.org/#utility) functions, but those won't be a primary focus.

Initially I'm primarily focused on accuracy but hope to take a second pass with a goal at improving performance (e.g. actually doing things concurrently).

This library will support both functional and object-oriented programming styles, just like Underscore itself. The latter will be implemented using class categories. Focus will initially be on `NSArray` with `NSDictionary` to follow (and then maybe `NSSet`).

This library will specifically not overload Objective-C [dot syntax](http://developer.apple.com/library/ios/#documentation/cocoa/conceptual/ProgrammingWithObjectiveC/EncapsulatingData/EncapsulatingData.html#//apple_ref/doc/uid/TP40011210-CH5-SW10) to facilitate JavaScript-style method chaining.

Lastly, I'm hoping to port a good number of Underscore's [unit tests](https://github.com/documentcloud/underscore/tree/master/test) over, though I don't think a bunch of them apply due to the language differences.

## License
Available for use under the MIT license: [http://bryan.mit-license.org](http://bryan.mit-license.org)
