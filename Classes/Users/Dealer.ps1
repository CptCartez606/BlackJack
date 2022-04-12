class Dealer:User
{
    [Deck]$m_Game_Deck
    [Player]$m_Player
    [int]$m_DealtCards

    [void]DealCard($p)
    {
        #TODO-single use
        switch ($p)
        {
             
            "Dealer"
            {
                $this.AddToHand($this.m_Game_Deck.DrawCard())
            }
            "Player"
            {
                $this.m_Player.AddToHand($this.m_Game_Deck.DrawCard())
            }
        }
    }
    [void]InitalDealCards()
    {
        $this.DealCard("Dealer")
        $this.DealCard("Dealer")
        
        $this.DealCard("Player")
        $this.DealCard("Player")
    }
    Dealer()
    {
        $this.m_Game_Deck = [Deck]::new()
        $this.m_Player = [Player]::new()
        $this.m_DealtCards = 0
        #Write-Host "Dealer Created"
    }
}