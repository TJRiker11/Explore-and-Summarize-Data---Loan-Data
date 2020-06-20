# Explore and Summarize Data - Loan Data

## Introduction

> The purspose of this project is to explore and analyze a certain data set. The data set I have chosen for this project is Prosper Loan Data. This data set contains 113,937 loans with 81 variables on each loan, including loan amount, borrower rate (or interest rate), current loan status, borrower income, borrower employment status, borrower credit history, and the latest payment information. The full dataset can be seen [Here](https://github.com/TrikerDev/Explore-and-Summarize-Data---Loan-Data/blob/master/Explore%20and%20Summarize%20Data%20-%20Loan%20Data/prosperLoanData.csv) and the definitions the variables can be seen [Here](https://github.com/TrikerDev/Explore-and-Summarize-Data---Loan-Data/blob/master/Explore%20and%20Summarize%20Data%20-%20Loan%20Data/Prosper%20Loan%20Data%20-%20Variable%20Definitions%20-%20Sheet1.pdf). This full project and all files and work can be seen on [This Github Repository](https://github.com/TrikerDev/Explore-and-Summarize-Data---Loan-Data). This project was carried out through Jupyter Notebooks using [IRkernal, which allows for the use of R in Jupyter](https://irkernel.github.io/installation/#binary-panel).

## Loading Data


```R
# Installing packages to be used
install.packages("ggplot2", dependencies = T) 
install.packages("knitr", dependencies = T)
install.packages("dplyr", dependencies = T)
# They have already been installed before, hence the warning message. It is only necessary for the first time running
```

    Warning message:
    "package 'ggplot2' is in use and will not be installed"
    Warning message:
    "package 'knitr' is in use and will not be installed"
    Warning message:
    "package 'dplyr' is in use and will not be installed"
    


```R
# Importing packages to be used
library(ggplot2)
library(knitr)
library(dplyr)
```


```R
# Loading in dataset, setting to variable 'data'
data <- read.csv('prosperLoanData.csv')
```


```R
# Summary of dataset
summary(data)
```


      ListingKey        ListingNumber     ListingCreationDate CreditGrade       
     Length:113937      Min.   :      4   Length:113937       Length:113937     
     Class :character   1st Qu.: 400919   Class :character    Class :character  
     Mode  :character   Median : 600554   Mode  :character    Mode  :character  
                        Mean   : 627886                                         
                        3rd Qu.: 892634                                         
                        Max.   :1255725                                         
                                                                                
          Term        LoanStatus         ClosedDate         BorrowerAPR     
     Min.   :12.00   Length:113937      Length:113937      Min.   :0.00653  
     1st Qu.:36.00   Class :character   Class :character   1st Qu.:0.15629  
     Median :36.00   Mode  :character   Mode  :character   Median :0.20976  
     Mean   :40.83                                         Mean   :0.21883  
     3rd Qu.:36.00                                         3rd Qu.:0.28381  
     Max.   :60.00                                         Max.   :0.51229  
                                                           NA's   :25       
      BorrowerRate     LenderYield      EstimatedEffectiveYield EstimatedLoss  
     Min.   :0.0000   Min.   :-0.0100   Min.   :-0.183          Min.   :0.005  
     1st Qu.:0.1340   1st Qu.: 0.1242   1st Qu.: 0.116          1st Qu.:0.042  
     Median :0.1840   Median : 0.1730   Median : 0.162          Median :0.072  
     Mean   :0.1928   Mean   : 0.1827   Mean   : 0.169          Mean   :0.080  
     3rd Qu.:0.2500   3rd Qu.: 0.2400   3rd Qu.: 0.224          3rd Qu.:0.112  
     Max.   :0.4975   Max.   : 0.4925   Max.   : 0.320          Max.   :0.366  
                                        NA's   :29084           NA's   :29084  
     EstimatedReturn  ProsperRating..numeric. ProsperRating..Alpha.  ProsperScore  
     Min.   :-0.183   Min.   :1.000           Length:113937         Min.   : 1.00  
     1st Qu.: 0.074   1st Qu.:3.000           Class :character      1st Qu.: 4.00  
     Median : 0.092   Median :4.000           Mode  :character      Median : 6.00  
     Mean   : 0.096   Mean   :4.072                                 Mean   : 5.95  
     3rd Qu.: 0.117   3rd Qu.:5.000                                 3rd Qu.: 8.00  
     Max.   : 0.284   Max.   :7.000                                 Max.   :11.00  
     NA's   :29084    NA's   :29084                                 NA's   :29084  
     ListingCategory..numeric. BorrowerState       Occupation       
     Min.   : 0.000            Length:113937      Length:113937     
     1st Qu.: 1.000            Class :character   Class :character  
     Median : 1.000            Mode  :character   Mode  :character  
     Mean   : 2.774                                                 
     3rd Qu.: 3.000                                                 
     Max.   :20.000                                                 
                                                                    
     EmploymentStatus   EmploymentStatusDuration IsBorrowerHomeowner
     Length:113937      Min.   :  0.00           Length:113937      
     Class :character   1st Qu.: 26.00           Class :character   
     Mode  :character   Median : 67.00           Mode  :character   
                        Mean   : 96.07                              
                        3rd Qu.:137.00                              
                        Max.   :755.00                              
                        NA's   :7625                                
     CurrentlyInGroup     GroupKey         DateCreditPulled   CreditScoreRangeLower
     Length:113937      Length:113937      Length:113937      Min.   :  0.0        
     Class :character   Class :character   Class :character   1st Qu.:660.0        
     Mode  :character   Mode  :character   Mode  :character   Median :680.0        
                                                              Mean   :685.6        
                                                              3rd Qu.:720.0        
                                                              Max.   :880.0        
                                                              NA's   :591          
     CreditScoreRangeUpper FirstRecordedCreditLine CurrentCreditLines
     Min.   : 19.0         Length:113937           Min.   : 0.00     
     1st Qu.:679.0         Class :character        1st Qu.: 7.00     
     Median :699.0         Mode  :character        Median :10.00     
     Mean   :704.6                                 Mean   :10.32     
     3rd Qu.:739.0                                 3rd Qu.:13.00     
     Max.   :899.0                                 Max.   :59.00     
     NA's   :591                                   NA's   :7604      
     OpenCreditLines TotalCreditLinespast7years OpenRevolvingAccounts
     Min.   : 0.00   Min.   :  2.00             Min.   : 0.00        
     1st Qu.: 6.00   1st Qu.: 17.00             1st Qu.: 4.00        
     Median : 9.00   Median : 25.00             Median : 6.00        
     Mean   : 9.26   Mean   : 26.75             Mean   : 6.97        
     3rd Qu.:12.00   3rd Qu.: 35.00             3rd Qu.: 9.00        
     Max.   :54.00   Max.   :136.00             Max.   :51.00        
     NA's   :7604    NA's   :697                                     
     OpenRevolvingMonthlyPayment InquiriesLast6Months TotalInquiries   
     Min.   :    0.0             Min.   :  0.000      Min.   :  0.000  
     1st Qu.:  114.0             1st Qu.:  0.000      1st Qu.:  2.000  
     Median :  271.0             Median :  1.000      Median :  4.000  
     Mean   :  398.3             Mean   :  1.435      Mean   :  5.584  
     3rd Qu.:  525.0             3rd Qu.:  2.000      3rd Qu.:  7.000  
     Max.   :14985.0             Max.   :105.000      Max.   :379.000  
                                 NA's   :697          NA's   :1159     
     CurrentDelinquencies AmountDelinquent   DelinquenciesLast7Years
     Min.   : 0.0000      Min.   :     0.0   Min.   : 0.000         
     1st Qu.: 0.0000      1st Qu.:     0.0   1st Qu.: 0.000         
     Median : 0.0000      Median :     0.0   Median : 0.000         
     Mean   : 0.5921      Mean   :   984.5   Mean   : 4.155         
     3rd Qu.: 0.0000      3rd Qu.:     0.0   3rd Qu.: 3.000         
     Max.   :83.0000      Max.   :463881.0   Max.   :99.000         
     NA's   :697          NA's   :7622       NA's   :990            
     PublicRecordsLast10Years PublicRecordsLast12Months RevolvingCreditBalance
     Min.   : 0.0000          Min.   : 0.000            Min.   :      0       
     1st Qu.: 0.0000          1st Qu.: 0.000            1st Qu.:   3121       
     Median : 0.0000          Median : 0.000            Median :   8549       
     Mean   : 0.3126          Mean   : 0.015            Mean   :  17599       
     3rd Qu.: 0.0000          3rd Qu.: 0.000            3rd Qu.:  19521       
     Max.   :38.0000          Max.   :20.000            Max.   :1435667       
     NA's   :697              NA's   :7604              NA's   :7604          
     BankcardUtilization AvailableBankcardCredit  TotalTrades    
     Min.   :0.000       Min.   :     0          Min.   :  0.00  
     1st Qu.:0.310       1st Qu.:   880          1st Qu.: 15.00  
     Median :0.600       Median :  4100          Median : 22.00  
     Mean   :0.561       Mean   : 11210          Mean   : 23.23  
     3rd Qu.:0.840       3rd Qu.: 13180          3rd Qu.: 30.00  
     Max.   :5.950       Max.   :646285          Max.   :126.00  
     NA's   :7604        NA's   :7544            NA's   :7544    
     TradesNeverDelinquent..percentage. TradesOpenedLast6Months DebtToIncomeRatio
     Min.   :0.000                      Min.   : 0.000          Min.   : 0.000   
     1st Qu.:0.820                      1st Qu.: 0.000          1st Qu.: 0.140   
     Median :0.940                      Median : 0.000          Median : 0.220   
     Mean   :0.886                      Mean   : 0.802          Mean   : 0.276   
     3rd Qu.:1.000                      3rd Qu.: 1.000          3rd Qu.: 0.320   
     Max.   :1.000                      Max.   :20.000          Max.   :10.010   
     NA's   :7544                       NA's   :7544            NA's   :8554     
     IncomeRange        IncomeVerifiable   StatedMonthlyIncome   LoanKey         
     Length:113937      Length:113937      Min.   :      0     Length:113937     
     Class :character   Class :character   1st Qu.:   3200     Class :character  
     Mode  :character   Mode  :character   Median :   4667     Mode  :character  
                                           Mean   :   5608                       
                                           3rd Qu.:   6825                       
                                           Max.   :1750003                       
                                                                                 
     TotalProsperLoans TotalProsperPaymentsBilled OnTimeProsperPayments
     Min.   :0.00      Min.   :  0.00             Min.   :  0.00       
     1st Qu.:1.00      1st Qu.:  9.00             1st Qu.:  9.00       
     Median :1.00      Median : 16.00             Median : 15.00       
     Mean   :1.42      Mean   : 22.93             Mean   : 22.27       
     3rd Qu.:2.00      3rd Qu.: 33.00             3rd Qu.: 32.00       
     Max.   :8.00      Max.   :141.00             Max.   :141.00       
     NA's   :91852     NA's   :91852              NA's   :91852        
     ProsperPaymentsLessThanOneMonthLate ProsperPaymentsOneMonthPlusLate
     Min.   : 0.00                       Min.   : 0.00                  
     1st Qu.: 0.00                       1st Qu.: 0.00                  
     Median : 0.00                       Median : 0.00                  
     Mean   : 0.61                       Mean   : 0.05                  
     3rd Qu.: 0.00                       3rd Qu.: 0.00                  
     Max.   :42.00                       Max.   :21.00                  
     NA's   :91852                       NA's   :91852                  
     ProsperPrincipalBorrowed ProsperPrincipalOutstanding
     Min.   :    0            Min.   :    0              
     1st Qu.: 3500            1st Qu.:    0              
     Median : 6000            Median : 1627              
     Mean   : 8472            Mean   : 2930              
     3rd Qu.:11000            3rd Qu.: 4127              
     Max.   :72499            Max.   :23451              
     NA's   :91852            NA's   :91852              
     ScorexChangeAtTimeOfListing LoanCurrentDaysDelinquent
     Min.   :-209.00             Min.   :   0.0           
     1st Qu.: -35.00             1st Qu.:   0.0           
     Median :  -3.00             Median :   0.0           
     Mean   :  -3.22             Mean   : 152.8           
     3rd Qu.:  25.00             3rd Qu.:   0.0           
     Max.   : 286.00             Max.   :2704.0           
     NA's   :95009                                        
     LoanFirstDefaultedCycleNumber LoanMonthsSinceOrigination   LoanNumber    
     Min.   : 0.00                 Min.   :  0.0              Min.   :     1  
     1st Qu.: 9.00                 1st Qu.:  6.0              1st Qu.: 37332  
     Median :14.00                 Median : 21.0              Median : 68599  
     Mean   :16.27                 Mean   : 31.9              Mean   : 69444  
     3rd Qu.:22.00                 3rd Qu.: 65.0              3rd Qu.:101901  
     Max.   :44.00                 Max.   :100.0              Max.   :136486  
     NA's   :96985                                                            
     LoanOriginalAmount LoanOriginationDate LoanOriginationQuarter
     Min.   : 1000      Length:113937       Length:113937         
     1st Qu.: 4000      Class :character    Class :character      
     Median : 6500      Mode  :character    Mode  :character      
     Mean   : 8337                                                
     3rd Qu.:12000                                                
     Max.   :35000                                                
                                                                  
      MemberKey         MonthlyLoanPayment LP_CustomerPayments
     Length:113937      Min.   :   0.0     Min.   :   -2.35   
     Class :character   1st Qu.: 131.6     1st Qu.: 1005.76   
     Mode  :character   Median : 217.7     Median : 2583.83   
                        Mean   : 272.5     Mean   : 4183.08   
                        3rd Qu.: 371.6     3rd Qu.: 5548.40   
                        Max.   :2251.5     Max.   :40702.39   
                                                              
     LP_CustomerPrincipalPayments LP_InterestandFees LP_ServiceFees   
     Min.   :    0.0              Min.   :   -2.35   Min.   :-664.87  
     1st Qu.:  500.9              1st Qu.:  274.87   1st Qu.: -73.18  
     Median : 1587.5              Median :  700.84   Median : -34.44  
     Mean   : 3105.5              Mean   : 1077.54   Mean   : -54.73  
     3rd Qu.: 4000.0              3rd Qu.: 1458.54   3rd Qu.: -13.92  
     Max.   :35000.0              Max.   :15617.03   Max.   :  32.06  
                                                                      
     LP_CollectionFees  LP_GrossPrincipalLoss LP_NetPrincipalLoss
     Min.   :-9274.75   Min.   :  -94.2       Min.   : -954.5    
     1st Qu.:    0.00   1st Qu.:    0.0       1st Qu.:    0.0    
     Median :    0.00   Median :    0.0       Median :    0.0    
     Mean   :  -14.24   Mean   :  700.4       Mean   :  681.4    
     3rd Qu.:    0.00   3rd Qu.:    0.0       3rd Qu.:    0.0    
     Max.   :    0.00   Max.   :25000.0       Max.   :25000.0    
                                                                 
     LP_NonPrincipalRecoverypayments PercentFunded    Recommendations   
     Min.   :    0.00                Min.   :0.7000   Min.   : 0.00000  
     1st Qu.:    0.00                1st Qu.:1.0000   1st Qu.: 0.00000  
     Median :    0.00                Median :1.0000   Median : 0.00000  
     Mean   :   25.14                Mean   :0.9986   Mean   : 0.04803  
     3rd Qu.:    0.00                3rd Qu.:1.0000   3rd Qu.: 0.00000  
     Max.   :21117.90                Max.   :1.0125   Max.   :39.00000  
                                                                        
     InvestmentFromFriendsCount InvestmentFromFriendsAmount   Investors      
     Min.   : 0.00000           Min.   :    0.00            Min.   :   1.00  
     1st Qu.: 0.00000           1st Qu.:    0.00            1st Qu.:   2.00  
     Median : 0.00000           Median :    0.00            Median :  44.00  
     Mean   : 0.02346           Mean   :   16.55            Mean   :  80.48  
     3rd Qu.: 0.00000           3rd Qu.:    0.00            3rd Qu.: 115.00  
     Max.   :33.00000           Max.   :25000.00            Max.   :1189.00  
                                                                             



```R
# variables in dataset
names(data)
```


<style>
.list-inline {list-style: none; margin:0; padding: 0}
.list-inline>li {display: inline-block}
.list-inline>li:not(:last-child)::after {content: "\00b7"; padding: 0 .5ex}
</style>
<ol class=list-inline><li>'ListingKey'</li><li>'ListingNumber'</li><li>'ListingCreationDate'</li><li>'CreditGrade'</li><li>'Term'</li><li>'LoanStatus'</li><li>'ClosedDate'</li><li>'BorrowerAPR'</li><li>'BorrowerRate'</li><li>'LenderYield'</li><li>'EstimatedEffectiveYield'</li><li>'EstimatedLoss'</li><li>'EstimatedReturn'</li><li>'ProsperRating..numeric.'</li><li>'ProsperRating..Alpha.'</li><li>'ProsperScore'</li><li>'ListingCategory..numeric.'</li><li>'BorrowerState'</li><li>'Occupation'</li><li>'EmploymentStatus'</li><li>'EmploymentStatusDuration'</li><li>'IsBorrowerHomeowner'</li><li>'CurrentlyInGroup'</li><li>'GroupKey'</li><li>'DateCreditPulled'</li><li>'CreditScoreRangeLower'</li><li>'CreditScoreRangeUpper'</li><li>'FirstRecordedCreditLine'</li><li>'CurrentCreditLines'</li><li>'OpenCreditLines'</li><li>'TotalCreditLinespast7years'</li><li>'OpenRevolvingAccounts'</li><li>'OpenRevolvingMonthlyPayment'</li><li>'InquiriesLast6Months'</li><li>'TotalInquiries'</li><li>'CurrentDelinquencies'</li><li>'AmountDelinquent'</li><li>'DelinquenciesLast7Years'</li><li>'PublicRecordsLast10Years'</li><li>'PublicRecordsLast12Months'</li><li>'RevolvingCreditBalance'</li><li>'BankcardUtilization'</li><li>'AvailableBankcardCredit'</li><li>'TotalTrades'</li><li>'TradesNeverDelinquent..percentage.'</li><li>'TradesOpenedLast6Months'</li><li>'DebtToIncomeRatio'</li><li>'IncomeRange'</li><li>'IncomeVerifiable'</li><li>'StatedMonthlyIncome'</li><li>'LoanKey'</li><li>'TotalProsperLoans'</li><li>'TotalProsperPaymentsBilled'</li><li>'OnTimeProsperPayments'</li><li>'ProsperPaymentsLessThanOneMonthLate'</li><li>'ProsperPaymentsOneMonthPlusLate'</li><li>'ProsperPrincipalBorrowed'</li><li>'ProsperPrincipalOutstanding'</li><li>'ScorexChangeAtTimeOfListing'</li><li>'LoanCurrentDaysDelinquent'</li><li>'LoanFirstDefaultedCycleNumber'</li><li>'LoanMonthsSinceOrigination'</li><li>'LoanNumber'</li><li>'LoanOriginalAmount'</li><li>'LoanOriginationDate'</li><li>'LoanOriginationQuarter'</li><li>'MemberKey'</li><li>'MonthlyLoanPayment'</li><li>'LP_CustomerPayments'</li><li>'LP_CustomerPrincipalPayments'</li><li>'LP_InterestandFees'</li><li>'LP_ServiceFees'</li><li>'LP_CollectionFees'</li><li>'LP_GrossPrincipalLoss'</li><li>'LP_NetPrincipalLoss'</li><li>'LP_NonPrincipalRecoverypayments'</li><li>'PercentFunded'</li><li>'Recommendations'</li><li>'InvestmentFromFriendsCount'</li><li>'InvestmentFromFriendsAmount'</li><li>'Investors'</li></ol>



> There are a lot of variables here and we are going to narrow these down to 12 variables to perform an analysis on. These variables will be:
> * Term
> * BorrowerAPR
> * BankcardUtilization
> * IncomeRange
> * LoanOriginalAmount
> * InquiriesLast6Months
> * EmploymentStatus
> * OnTimeProsperPayments
> * TotalProsperLoans
> * CreditScoreRangeLower
> * CreditScoreRangeUpper
> * LoanStatus

> I feel that these variables will provide good insight on loans off of eachother, for example, how does employment status affect the inquiries in the past 6 months? How does credit score affect the loan amount? These variables should provide good insight into different types of loans and how they affect other variables.


```R
# Getting the variables we want to keep
vars <- c('Term','BorrowerAPR','BankcardUtilization','IncomeRange','LoanOriginalAmount','InquiriesLast6Months','EmploymentStatus','OnTimeProsperPayments','TotalProsperLoans','CreditScoreRangeLower','CreditScoreRangeUpper','LoanStatus')

# Assigning the variables we want to a seperate dataset
newData <- data[vars]

# Showing the names of the new dataset to make sure we got the correct variables
names(newData)
```


<style>
.list-inline {list-style: none; margin:0; padding: 0}
.list-inline>li {display: inline-block}
.list-inline>li:not(:last-child)::after {content: "\00b7"; padding: 0 .5ex}
</style>
<ol class=list-inline><li>'Term'</li><li>'BorrowerAPR'</li><li>'BankcardUtilization'</li><li>'IncomeRange'</li><li>'LoanOriginalAmount'</li><li>'InquiriesLast6Months'</li><li>'EmploymentStatus'</li><li>'OnTimeProsperPayments'</li><li>'TotalProsperLoans'</li><li>'CreditScoreRangeLower'</li><li>'CreditScoreRangeUpper'</li><li>'LoanStatus'</li></ol>



## Univariate Analysis

### Term

> The length of the loan expressed in months.


```R
termChart <- ggplot(aes(x = Term), data = newData) +
                geom_histogram(binwidth = 12, fill = 'blue') +
                scale_x_continuous(breaks = seq(0, 60, 12))

termChart + ggtitle('User Count vs Term Length') +
            xlab('Term Length in Months') +
            ylab('User Count')
```


![png](output_15_0.png)


> We can see from this chart that the terms offered by Prosper are either 12 months, 36 months, or 60 months. 1, 3, or 5 years. Nothing inbetween. From the user count, the most popular term length is 3 years, followed by significantly less users at 5 year terms. The 1 year term is very unpopular by a user count perspective.

### Borrower APR

> The Borrower's Annual Percentage Rate (APR) for the loan. 


```R
aprChart <- ggplot(aes(x = BorrowerAPR), data = newData) +
                geom_histogram(binwidth = 0.01, fill = 'cyan4') +
                scale_x_continuous(breaks = seq(0, 0.5, 0.05))

aprChart + ggtitle('User Count vs APR') +
            xlab('APR') +
            ylab('User Count')
```

    Warning message:
    "Removed 25 rows containing non-finite values (stat_bin)."
    


![png](output_19_1.png)


> APR is really spread out all over the place. There really isnt one APR that is significantly more common than the others. The count with the highest is around ~0.38 but there is a very even grouping of users with APR all over the chart.

### Bankcard Utilization

> The percentage of available revolving credit that is utilized at the time the credit profile was pulled.


```R
bankChart <- ggplot(aes(x = BankcardUtilization), data = newData) +
                geom_histogram(binwidth = 0.01, fill = 'turquoise') +
                scale_x_continuous(limits = c(0,0.9), breaks = seq(0, 0.9, 0.1)) +
                scale_y_continuous(limits = c(0,1500))

bankChart + ggtitle('User Count vs Credit Utilization') +
            xlab('Credit Utilization') +
            ylab('User Count')
```

    Warning message:
    "Removed 25854 rows containing non-finite values (stat_bin)."
    Warning message:
    "Removed 2 rows containing missing values (geom_bar)."
    


![png](output_23_1.png)


> More users have a higher credit utilization. Fewer users have a lower credit utilization. We could infer from this that as credit utilization increases, more people will look into getting a loan, probably trying to pay down on their credit cards. As credit utilization increases, the chance a person seek a loan is higher.

### Income Range

> The income range of the borrower at the time the listing was created.


```R

```


```R

```


```R

```

### Original Loan Amount

> The origination amount of the loan.


```R

```


```R

```


```R

```

### Inquiries Last 6 Months

> Number of inquiries in the past six months at the time the credit profile was pulled.


```R

```


```R

```


```R

```

### Employment Status

> The employment status of the borrower at the time they posted the listing.


```R

```


```R

```


```R

```

### On Time Prosper Payments

> Number of on time payments the borrower had made on Prosper loans at the time they created this listing. This value will be null if the borrower has no prior loans.


```R

```


```R

```


```R

```

### Total Prosper Loans

> Number of Prosper loans the borrower at the time they created this listing. This value will be null if the borrower had no prior loans. 


```R

```


```R

```


```R

```

### Credit Score Range Lower

> The lower value representing the range of the borrower's credit score as provided by a consumer credit rating agency.


```R

```


```R

```


```R

```

### Credit Score Range Upper

> The upper value representing the range of the borrower's credit score as provided by a consumer credit rating agency.


```R

```


```R

```


```R

```

### Loan Status

> The current status of the loan: Cancelled, Chargedoff, Completed, Current, Defaulted, FinalPaymentInProgress, PastDue. The PastDue status will be accompanied by a delinquency bucket.


```R

```


```R

```


```R

```
