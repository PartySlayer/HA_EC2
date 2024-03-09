This module creates a subnet inside the most available zone within the same region, given any number of CIDR block ranges.

This is possible thanks to the data source feature of terraform and the "count" method (like a for-each loop).