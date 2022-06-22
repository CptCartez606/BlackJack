class GameManager
{
    [Dealer]$m_Dealer
    [Deck]$m_Game_Deck
    [Player]$m_Player
    
    GameManager()
    {
        $this.m_Dealer = [Dealer]::new()
        $this.m_Game_Deck = [Deck]::new()
        $this.m_Player = [Player]::new()

        #Write-Host "Manager Created"
        #run first time setup
        $this.InitalDealCards()
        $this.UpdateAllStatus()
    }

    [void]PrintBoard()
    {
        Write-Host "Dealer: " $this.m_Dealer.GetScore()
        $this.m_Dealer.m_PHand.PrintList()
        Write-Host "Player: " $this.m_Player.GetScore()
        $this.m_Player.m_PHand.PrintList()
    }
    #builds off of AddToHand()
    [void]DealCard($p)
    {
        switch ($p)
        {
                
            "Dealer"
            {
                $this.m_Dealer.AddToHand($this.m_Game_Deck.DrawCard())
            }
            "Player"
            {
                $this.m_Player.AddToHand($this.m_Game_Deck.DrawCard())
            }
        }
    }
    #builds off of DealCard()
    [void]InitalDealCards()
    {
            $this.DealCard("Dealer")
            $this.DealCard("Dealer")

            $this.DealCard("Player")
            $this.DealCard("Player")
    }
    #Get realtime status of players
    [void]UpdateAllStatus()
    {
        $this.m_Player.UpdateStatus()
        $this.m_Dealer.UpdateStatus()
    }
    #I hope I don't have to explain this
    [void]DealerTurn()
    {
        #TODO
    }
    #yeah I know I couldn't come up with a better name
    [void]ManagerResponseToPlayer()
    {
        switch ($this.m_Player.userInput)
            {
                "Hit"
                {
                    $this.DealCard("Player")
                }
                "Stay"
                {
                    $this.Stay()

                }
                Default
                {
                    Write-Host "You didn't enter a correct entry dummy!"
                }
            }
    }
}