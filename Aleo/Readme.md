# ALEO TASK BUILDH3R

“claim” function task  RESULT


```
transition claim(bid: Bid) -> Prize 
        {
        assert_eq(bid.is_winner, true);
        return Prize {
            owner: bid.bidder,
            amount: bid.amount,
        };
```
        

Aleo wallet: aleo1hhrxfd4scsfcesxwk7nkuy7fjwyacms09wndljwjtznyfzt79vzqpn4kms

⌛ Deployment at1455qw2dfljs3yrjuxf4a2p22cck32hujutv2290gpd7c69hs9cxqrksf04 ('auction_aleo_sept.aleo') 

https://testnet.aleoscan.io/program?id=auction_aleo_sept.aleo

![image](![alt text](image.png))

