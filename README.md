# Shop

## Problem Statement 
**Basic sales tax** is applicable at a rate of **10%** on all goods, **except** books, food, and medical products that are exempt. **Import duty** is an additional sales tax applicable on all imported goods at a rate of 5%, with no exemptions.

When I purchase items I receive a receipt which lists the name of all the items and their price (including tax), finishing with the total cost of the items, and the total amounts of sales taxes paid. The rounding rules for sales tax are that for a tax rate of n%, a shelf price of p contains (np/100 rounded up to the nearest 0.05) amount of sales tax.


Write an application that prints out the receipt details for these shopping baskets:

### Input

#### Input 1:
```
2 book at 12.49
1 music CD at 14.99
1 chocolate bar at 0.85
```

#### Input 2:
```
1 imported box of chocolates at 10.00
1 imported bottle of perfume at 47.50
```

#### Input 3:
```
1 imported bottle of perfume at 27.99
1 bottle of perfume at 18.99
1 packet of headache pills at 9.75
3 imported boxes of chocolates at 11.25
```

### Output

#### Output 1:
```
2 book: 24.98
1 music CD: 16.49
1 chocolate bar: 0.85
Sales Taxes: 1.50
Total: 42.32
```

#### Output 2:
```
1 imported box of chocolates: 10.50
1 imported bottle of perfume: 54.65
Sales Taxes: 7.65
Total: 65.15
```

#### Output 3:
```
1 imported bottle of perfume: 32.19
1 bottle of perfume: 20.89
1 packet of headache pills: 9.75
3 imported box of chocolates: 35.55
Sales Taxes: 7.90
Total: 98.38
```


## Requirements
 Ruby 2.43 and above

## Setup Guide
- Clone this repo: `git clone https://github.com/ozone4real/subscribe-challenge.git`
- "cd" into the root directory and run `bundle install`

## Running The Application
  From the root directory, run:
  ```
    ruby app/shop.rb <input_file>
  ```
  `<input_file>` should contain the items input listed in the format above. The file can be in any format
  
## Running tests
From the root directory, run:
```
  ruby test.rb
```

## Observations
In the problem statement, there was this instruction:
`The rounding rules for sales tax are that for a tax rate of n%, a shelf price of p contains (np/100 **rounded up to the nearest 0.05**)`

Based on the test input and results in the example, I think the statement in bold above should be `rounded up to the next 0.05`, i.e `next` instead of `nearest`.
