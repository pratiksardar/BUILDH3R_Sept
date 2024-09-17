// The 'tee_auction' program.
program auction_aleo_sept.aleo {
   
    record Bid {
        owner: address,
        bidder: address,
        amount: u64,
        is_winner: bool,
    }

    record Prize {
        owner: address,
        amount: u64
    }

    transition place_bid(bidder: address, amount: u64) -> Bid {
        return Bid {
            owner: aleo16m2f7ylsjqw70rs0rskag6mdcvr3ha25lshncdx7ex3qaerheygqamyuht,
            bidder: bidder,
            amount: amount,
            is_winner: false,
        };
    }

   
    transition resolve(first: Bid, second: Bid) -> Bid {
        // Resolve the winner of the auction.
        if (first.amount >= second.amount) {
            return first;
        } else {
            return second;
        }
    }

   
    transition finish(bid: Bid) -> Bid {
        // Return 'is_winner' as 'true' in the winning 'Bid'.
        return Bid {
            owner: bid.bidder,
            bidder: bid.bidder,
            amount: bid.amount,
            is_winner: true,
        };
    }

    transition claim(bid: Bid) -> Prize {
        assert_eq(bid.is_winner, true);
        return Prize {
            owner: bid.bidder,
            amount: bid.amount,
        };
        
    }
}