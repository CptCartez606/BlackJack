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
        $score = $this.m_Dealer.GetScore()
        if($score -ge 2 -and $score -le 16)
        {
            $this.DealCard("Dealer")
        }
        elseif ($score -ge 17 -and $score -le 20) 
        {
            $this.m_Dealer.Stay()
        }
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
                    $this.m_Player.Stay()

                }
                Default
                {
                    Write-Host "You didn't enter a correct entry dummy!"
                }
            }
    }
    #avengers theme plays in background
    [void]EndGameLogic()
    {
        $pStatus = $this.m_Player.EndStatus
        $dStatus = $this.m_Dealer.EndStatus

        if($pStatus -eq "Staying" -and $dStatus -eq "Staying")
        {
            #Check who has bigger number
        }
        #elseif(who busted)
        #elseif(if both busted)
        #elseif(if blackjack)
        #elseif(if both blackjack)
    }
}