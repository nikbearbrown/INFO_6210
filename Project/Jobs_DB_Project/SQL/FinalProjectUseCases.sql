/* Copyright (c) 2015 Valerie Charry, Andrew Hombach, Andrew Martone
Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:
The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE. */

/* USE CASE 1: Takes the difference of the average opening and
closing prices for all the companies in a specific industry */
CREATE VIEW Diff_Avg_OpenClose_ByIndustry as
SELECT s.industry as 'Industry', avg( y.open ) - avg( y.close ) as 'Average Difference'
FROM `dmin`.YFinance as y
JOIN `dmin`.Ticker_Map as t
ON y.ticker_time = t.ticker_time
JOIN `dmin`.SPCompanies as s 
ON s.ticker = t.ticker
GROUP BY s.industry
 
/* USE CASE 2: Finds the average ROAs of each industry */
CREATE VIEW Avg_ROA_ByIndustry as
SELECT s.industry as 'Industry', avg(e.roa) as 'Average ROA'
FROM `dmin`.ExpandedData as e
JOIN `dmin`.Ticker_Map as t
ON e.ticker_time = t.ticker_time
JOIN `dmin`.SPCompanies as s
ON s.ticker = t.ticker
GROUP BY s.industry 
 
/* USE CASE 3: Finds the average Quarterly Earnings
Growth for each company based in MA */
CREATE VIEW Avg_QEG_ByState_MA as
SELECT t.ticker, avg(e.Quart_Earn_Growth) as 'Average Quarterly Earn Growth', s.address
FROM `dmin`.YFinance as y
JOIN `dmin`.ExpandedData as e 
ON y.ticker_time = e.ticker_time
JOIN `dmin`.Ticker_Map as t
ON y.ticker_time = t.ticker_time
JOIN `dmin`.SPCompanies as s
ON t.ticker = s.ticker
WHERE s.address LIKE '%Massachusetts%'
GROUP BY s.ticker
 
/* USE CASE 4: Finds the average of the ratio of debt
to equity per company in sub-sector Apparel Retail */
CREATE VIEW Avg_DebtEquity_BySubSector_ApparelRetail as
SELECT s.ticker, avg(e.debt_equity) as 'Average Debt/Equity Ratio'
FROM `dmin`.SPCompanies as s
JOIN `dmin`.Ticker_Map as t
ON s.ticker = t.ticker
JOIN `dmin`.ExpandedData as e 
ON e.ticker_time = t.ticker_time
WHERE s.sub_sector = 'Apparel Retail'
GROUP BY s.ticker
 
/* USE CASE 5: Finds the average Quarterly Earn
Growth for all companies in Tech Industry */
CREATE VIEW Avg_QEG_ByIndustry_Tech as
SELECT s.ticker, avg(e.Quart_Earn_Growth) as 'Average Quarterly Earn Growth'
FROM `dmin`.SPCompanies as s
JOIN `dmin`.Ticker_Map as t 
ON s.ticker = t.ticker
JOIN `dmin`.ExpandedData as e 
ON e.ticker_time = t.ticker_time
WHERE s.industry LIKE '%Tech%'
GROUP BY s.ticker
 
/* USE CASE 6: Finds the average Quarterly Earn
Growth for all companies by sub sector */
CREATE VIEW Avg_QEG_BySubSector as
SELECT s.sub_sector as 'Sub-Sector', avg(e.Quart_Earn_Growth) as 'Average Quarterly Earn Growth'
FROM `dmin`.SPCompanies as s
JOIN `dmin`.Ticker_Map as t 
ON s.ticker = t.ticker
JOIN `dmin`.ExpandedData as e 
ON e.ticker_time = t.ticker_time
GROUP BY s.sub_sector
 
/* USE CASE 7: Takes the difference of the average opening and
closing prices for all the companies by sub sector */
CREATE VIEW Diff_Avg_OpenClose_BySubSector as
SELECT s.sub_sector as 'Sub-Sector', avg( y.open ) - avg( y.close ) as 'Average Difference'
FROM `dmin`.YFinance as y
JOIN `dmin`.Ticker_Map as t
ON y.ticker_time = t.ticker_time
JOIN `dmin`.SPCompanies as s 
ON s.ticker = t.ticker
GROUP BY s.sub_sector
 
/* USE CASE 8: Takes the difference of the average opening and
closing prices for each company */
CREATE VIEW Diff_Avg_OpenClose_ByTicker as
SELECT s.ticker as 'Ticker', avg( y.open ) - avg( y.close ) as 'Average Difference'
FROM `dmin`.YFinance as y
JOIN `dmin`.Ticker_Map as t
ON y.ticker_time = t.ticker_time
JOIN `dmin`.SPCompanies as s 
ON s.ticker = t.ticker
GROUP BY s.ticker
 
/* USE CASE 9: Finds the average of the ratio of debt
to equity per company by sub sector */
CREATE VIEW Avg_DebtEquity_BySubSector as
SELECT s.sub_sector, avg(e.debt_equity) as 'Average Debt/Equity Ratio'
FROM `dmin`.SPCompanies as s
JOIN `dmin`.Ticker_Map as t
ON s.ticker = t.ticker
JOIN `dmin`.ExpandedData as e 
ON e.ticker_time = t.ticker_time
GROUP BY s.sub_sector
 
/* USE CASE 10: Finds the average of the ratio of debt
to equity per company by sub sector */
CREATE VIEW Avg_DebtEquity_ByIndustry as
SELECT s.industry as 'Industry', avg(e.debt_equity) as 'Average Debt/Equity Ratio'
FROM `dmin`.SPCompanies as s
JOIN `dmin`.Ticker_Map as t
ON s.ticker = t.ticker
JOIN `dmin`.ExpandedData as e 
ON e.ticker_time = t.ticker_time
GROUP BY s.industry
 
/* USE CASE 11: Finds the average ROAs of per sub sector */
CREATE VIEW Avg_ROA_BySubSector as
SELECT s.sub_sector as 'Sub-Sector', avg(e.roa) as 'Average ROA'
FROM `dmin`.ExpandedData as e
JOIN `dmin`.Ticker_Map as t
ON e.ticker_time = t.ticker_time
JOIN `dmin`.SPCompanies as s
ON s.ticker = t.ticker
GROUP BY s.sub_sector 
 
/* USE CASE 12: Finds the average ROAs of companies by location */
CREATE VIEW Avg_ROA_ByAddress as
SELECT s.address as 'Address', avg(e.roa) as 'Average ROA'
FROM `dmin`.ExpandedData as e
JOIN `dmin`.Ticker_Map as t
ON e.ticker_time = t.ticker_time
JOIN `dmin`.SPCompanies as s
ON s.ticker = t.ticker
GROUP BY s.address 
 
/* USE CASE 13: Finds the average ROAs of companies in California */
CREATE VIEW Avg_ROA_ByState_CA as
SELECT s.ticker as 'Ticker', avg(e.roa) as 'Average ROA', s.address as 'Address'
FROM `dmin`.ExpandedData as e
JOIN `dmin`.Ticker_Map as t
ON e.ticker_time = t.ticker_time
JOIN `dmin`.SPCompanies as s
ON s.ticker = t.ticker
WHERE s.address LIKE '%California%'
GROUP BY s.ticker
 
/* USE CASE 14: Finds the average of the ratio of debt
to equity per company */
CREATE VIEW Avg_DebtEquity_ByTicker as
SELECT s.ticker as 'Ticker', avg(e.debt_equity) as 'Average Debt/Equity Ratio'
FROM `dmin`.SPCompanies as s
JOIN `dmin`.Ticker_Map as t
ON s.ticker = t.ticker
JOIN `dmin`.ExpandedData as e 
ON e.ticker_time = t.ticker_time
GROUP BY s.ticker
 
/* USE CASE 15: Finds the average Quarterly Earn
Growth for all companies by Industry */
CREATE VIEW Avg_QEG_ByIndustry as
SELECT s.industry as 'Industry', avg(e.Quart_Earn_Growth) as 'Average Quarterly Earn Growth'
FROM `dmin`.SPCompanies as s
JOIN `dmin`.Ticker_Map as t 
ON s.ticker = t.ticker
JOIN `dmin`.ExpandedData as e 
ON e.ticker_time = t.ticker_time
GROUP BY s.industry
 
/* USE CASE 16: Finds the average Quarterly Earn
Growth for all companies by ticker */
CREATE VIEW Avg_QEG_ByTicker as
SELECT s.ticker as 'Ticker', avg(e.Quart_Earn_Growth) as 'Average Quarterly Earn Growth'
FROM `dmin`.SPCompanies as s
JOIN `dmin`.Ticker_Map as t 
ON s.ticker = t.ticker
JOIN `dmin`.ExpandedData as e 
ON e.ticker_time = t.ticker_time
GROUP BY s.ticker

/* USE CASE 17: Finds the low multiple companies over time. It has been 
proven that companies (when diversified) perform better when they have 
low P/E Ratios at the time of investment. */
CREATE VIEW Pos_Low_PE AS
SELECT * 
FROM `dmin`.YFinance
WHERE pe > 0
ORDER BY pe
LIMIT 20
 
/* USE CASE 18: View for a fund that is trying to find good value 
stocks. It pulls many metrics of peer valuation and orders the 
companies in terms of their price to book. */
CREATE VIEW Comparables AS
SELECT t.ticker, y.close, y.beta, e.peg, e.ForwardPE, e.Price_Book, 
(e.EValue/e.EBITDA)
FROM `dmin`.YFinance AS y
JOIN `dmin`.Ticker_Map AS t
ON t.ticker_time = y.ticker_time
JOIN `dmin`.ExpandedData AS e
ON y.ticker_time = e.ticker_time
ORDER BY e.Price_Book
LIMIT 50
 
/* USE CASE 19: Tool for value investors. The lower the price/book ratio 
is, the more the equity investors will be able to realize during a liquidation.
Assuming the companies aren't a value trap this is a good screen for finding 
low risk value companies/industries. */
CREATE VIEW Low_PB AS
SELECT s.industry, e.Price_Book
FROM `dmin`.SPCompanies AS s
JOIN `dmin`.Ticker_Map as t
ON t.ticker = s.ticker
JOIN `dmin`.ExpandedData AS e
ON t.ticker_time = e.ticker_time
GROUP BY s.industry
ORDER BY e.Price_Book
 
/* USE CASE 20: Used to find sub sectors that are trading at a discount.
This is a useful tool for discovering undervalued sectors. */
CREATE VIEW Discount_Sectors AS
SELECT s.sub_sector, e.peg, (e.EValue/e.EBITDA)
FROM `dmin`.SPCompanies AS s
JOIN `dmin`.Ticker_Map as t
ON t.ticker = s.ticker
INNER JOIN `dmin`.ExpandedData AS e
ON e.ticker_time = t.ticker_time
GROUP BY s.sub_sector
ORDER BY e.peg
 
/* USE CASE 21: Used to find the average return on assets of the S&P 500.
SPCompanies is the S&P 500 and the inner join is used to filter */
CREATE VIEW Average_ROA AS
SELECT AVG(ROA)
FROM `dmin`.ExpandedData 
JOIN `dmin`.Ticker_Map
ON Ticker_Map.ticker_time = ExpandedData.ticker_time
INNER JOIN `dmin`.SPCompanies
ON Ticker_Map.ticker = SPCompanies.ticker
 
/* USE CASE 22: Retrieves companies that have come to trade 
or exist after 2013 */
CREATE VIEW After_2013 AS
SELECT s.ticker, y.open
from `dmin`.SPCompanies AS s
JOIN `dmin`.Ticker_Map as t
ON t.ticker = s.ticker
Join `dmin`.YFinance AS y
ON y.ticker_time = t.ticker_time
WHERE s.ticker NOT IN (SELECT WCompanies.ticker FROM `dmin`.WCompanies)
 
/* USE CASE 23: Retrieves stocks that have a significant dividend */
CREATE VIEW Dividend_Stocks AS
SELECT s.ticker, y.dividend
FROM `dmin`.SPCompanies as s
JOIN `dmin`.Ticker_Map as t
ON t.ticker = s.ticker
JOIN `dmin`.YFinance as y
ON y.ticker_time = t.ticker_time
WHERE y.dividend > 2
AND y.date_time > '2015-04-01'
GROUP BY t.ticker
ORDER BY y.dividend
 
/* USE CASE 24: Retrieves stocks that are trading under 
their 200 day moving average */
CREATE VIEW Under_200_Average As
SELECT s.ticker, s.sub_sector, y.open, e.Moving_Average_200
FROM `dmin`.SPCompanies as s
JOIN `dmin`.Ticker_Map as t
ON t.ticker = s.ticker
JOIN `dmin`.ExpandedData as e
ON e.ticker_time = t.ticker_time
JOIN `dmin`.YFinance as y
ON y.ticker_time = t.ticker_time
WHERE e.Moving_Average_200 > y.open
AND y.date_time LIKE '2015-04-01%'
GROUP BY s.ticker
ORDER BY e.Moving_Average_200 - y.open
 
/* USE CASE 25: Retrieves the combined revenues of all 
companies in each sector */
CREATE VIEW `dmin`.Sub_Secotr_Rev AS
SELECT s.sub_sector, SUM(e.Rev)
FROM `dmin`.SPCompanies as s
JOIN `dmin`.Ticker_Map as t
ON t.ticker = s.ticker
JOIN `dmin`.ExpandedData as e
ON e.ticker_time = t.ticker_time
GROUP BY s.sub_sector
ORDER BY SUM(e.Rev) DESC
 
/* USE CASE 26: Retrieves airlines' debt to equity and beta 
for the Sharpe ratio */
CREATE VIEW AirlinesBetaDebt AS
SELECT s.ticker, s.sub_sector, y.beta, e.Debt_Equity
FROM `dmin`.SPCompanies AS s
JOIN `dmin`.Ticker_Map as t
ON t.ticker = s.ticker
JOIN `dmin`.YFinance AS y
ON y.ticker_time = t.ticker_time
JOIN `dmin`.ExpandedData as e
ON e.ticker_time = t.ticker_time
WHERE sub_sector = 'Airlines'
GROUP BY t.ticker

/* USE CASE 27: Find companies with null as P/E ratio. Companies 
that do not have a PE ratio are usually losing money and are not
making money per share. */
CREATE VIEW peNull as
SELECT * 
FROM `dmin`.YFinance AS y
WHERE pe = 0
ORDER BY pe
 
/* USE CASE 28: Find the average peg ratio for companies in 
a specific sector */
CREATE VIEW pegSector as
SELECT avg(e.peg), s.sub_sector FROM `dmin`.SPCompanies AS s
JOIN `dmin`.Ticker_Map AS t
ON s.ticker = t.ticker
JOIN `dmin`.ExpandedData AS e
ON t.ticker_time = e.ticker_time
/*WHERE sub_sector LIKE '%Internet Software%'*/
/*AND y.date_time LIKE '2015-04-01%'*/
GROUP BY sub_sector
 
/* USE CASE 29: Find the average peg ratio for a certain industry */
CREATE VIEW pegIndustry as
SELECT avg(e.peg), s.industry, s.company_name 
FROM dmin.SPCompanies AS s
JOIN `dmin`.Ticker_Map AS t
ON s.ticker = t.ticker
JOIN `dmin`.ExpandedData AS e
ON t.ticker_time = e.ticker_time
WHERE industry = "Health Care"
GROUP BY company_name
 
/* USE CASE 30: Find companies with revenue greater than 50B. */
CREATE VIEW dmin.rev50B as
SELECT e.Rev, s.company_name FROM `dmin`.SPCompanies as s
JOIN `dmin`.Ticker_Map AS t
ON s.ticker = t.ticker
JOIN `dmin`.ExpandedData AS e
ON t.ticker_time = e.ticker_time
JOIN `dmin`.YFinance AS y
ON t.ticker_time = y.ticker_time
Where Rev > 50000
Order by Rev DESC
 
/* USE CASE 31: Find companies with a low Price-To-Book (P/B) ratio. 
Lower PB ratios could mean the stock is undervalued or something 
fundamentally wrong with the company. */
CREATE VIEW pricetobook as
SELECT *
FROM `dmin`.ExpandedData AS e
ORDER BY e.Price_Book ASC

/* USE CASE 32: This SQL statement will find the average of two 
statistics such as peg and pe for companies in New York on 
April 1st, 2015. */
CREATE VIEW avgAddressRevised as
SELECT avg(e.peg), avg(e.ForwardPE), s.address FROM `dmin`.SPCompanies as s
JOIN `dmin`.Ticker_Map as t
ON s.ticker = t.ticker
JOIN `dmin`.ExpandedData as e
ON t.ticker_time = e.ticker_time
JOIN `dmin`.YFinance as y
ON t.ticker_time = e.ticker_time
WHERE address LIKE '%New York%'
AND y.date_time LIKE '2015-04-01%'
GROUP BY address
 
/* USE CASE 33: Sorts by the largest volume change on a specific day. */
CREATE VIEW volumechange as
SELECT y.volume, s.ticker, y.ticker_time FROM dmin.SPCompanies as s
JOIN dmin.Ticker_Map as t
ON t.ticker = s.ticker
JOIN dmin.YFinance as y
ON y.ticker_time = t.ticker_time
JOIN `dmin`.ExpandedData AS e
ON y.ticker_time = e.ticker_time
WHERE y.date_time LIKE '2015-04-01%'
Order by volume DESC
 
/* USE CASE 34: Sorts by the largest market cap on a specific day */
CREATE VIEW mcLargest as
SELECT y.mc, s.ticker, y.ticker_time FROM dmin.SPCompanies as s
JOIN dmin.Ticker_Map as t
ON t.ticker = s.ticker
JOIN dmin.YFinance as y
ON y.ticker_time = t.ticker_time
JOIN `dmin`.ExpandedData AS e
ON y.ticker_time = e.ticker_time
WHERE y.date_time LIKE '2015-04-01%'
Order by mc DESC
 
/* USE CASE 35: Find companies with a high Price-To-Book (P/B) ratio. 
High PB ratios could mean the stock is operating well. */
CREATE VIEW pricetoBookLarge as
SELECT *
FROM `dmin`.ExpandedData AS e
ORDER BY e.Price_Book DESC
 
/* USE CASE 36: This SQL statement will find all the YFinance data 
for every stock in the month of April. */
CREATE VIEW allMonthStocksRevised as
SELECT * FROM `dmin`.YFinance as y 
WHERE date_time LIKE '2015-04%'

/* USE CASE 37: Finds the number of tweets about each company and then
returns the top 10 with the most tweets */
CREATE VIEW Top10_Companies_on_Twitter as
SELECT sp.ticker, sp.company_name, COUNT(m.tweet_id) as 'Number of Tweets' 
FROM `dmin`.Twitter_Symbols as m  
JOIN `dmin`.SPCompanies as sp 
ON m.symbol = sp.ticker 
GROUP BY sp.ticker 
ORDER BY COUNT(m.tweet_id) DESC
LIMIT 10

/* USE CASE 38: Counts the number of tweets in our domain on any given day 
and returns the top 10 */
CREATE VIEW Top10_TweetDays as
SELECT t.created_at, COUNT(t.tweet_id) as 'Number of Tweets'
FROM `dmin`.Twitter_Tweets as t
GROUP BY t.created_at
ORDER BY COUNT(t.tweet_id) DESC
LIMIT 10

/* USE CASE 39: Returns the number of tweets by sub_sector */
CREATE VIEW NumberTweets_BySubSector as
SELECT sp.sub_sector, COUNT(m.tweet_id) 
FROM `dmin`.Twitter_Symbols as m
JOIN `dmin`.SPCompanies as sp
ON sp.ticker = m.symbol
GROUP BY sp.sub_sector
ORDER BY COUNT(m.tweet_id) DESC

/* USE CASE 40: Returns the counts for each of the Urls being
tweeted in our domain */
CREATE VIEW TopTwitterUrls as
SELECT u.url, COUNT(u.url) 
FROM `dmin`.Twitter_Urls as u
GROUP BY u.url
ORDER BY COUNT(u.url) DESC

/* USE CASE 41: Returns all tweets related to a given company */
SELECT t.text FROM
`dmin`.Twitter_Tweets as t
JOIN `dmin`.Twitter_Symbols as s
ON s.tweet_id = t.tweet_id
JOIN `dmin`.SPCompanies as sp
ON sp.ticker = s.symbol
WHERE ticker = 'AAPL'

/* USE CASE 41: Returns all tweets  and hashtags related to a given industry */
SELECT h.hashtag, t.text 
FROM `dmin`.Twitter_Hashtags as h
JOIN `dmin`.Twitter_Tweets as t
ON t.tweet_id = h.tweet_id
JOIN `dmin`.Twitter_Symbols as s
ON s.tweet_id = t.tweet_id
JOIN `dmin`.SPCompanies as c
ON c.ticker = s.symbol
WHERE c.industry = 'Health Care'

