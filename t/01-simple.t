use strict;
use warnings;

use Test::More;

use HTTP::Status::Constants;
use HTTP::Status ':constants';

is $HTTP_OK, HTTP_OK, 'HTTP OK';

done_testing;

