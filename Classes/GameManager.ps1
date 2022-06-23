class GameManager
{
    [Dealer]$m_Dealer
    [Deck]$m_Game_Deck
    [Player]$m_Player

    [string]$m_Winner
    
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
        $this.m_Winner = "Tie"
    }
    #I hope I don't have to explain this
    [void]DealerTurn()
    {
        $score = $this.m_Dealer.GetScore()
        if($score -ge 2 -and $score -le 16)
        {
            $this.DealCard("Dealer")
            Write-Host "Hitting!"
        }
        elseif ($score -ge 17 -and $score -le 20 -or $this.m_Player.EndStatus -eq "Busted") 
        {
            $this.m_Dealer.Stay()
            Write-Host "Staying!"
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
        $plyer = $this.m_Player
        $dler = $this.m_Dealer

        #If no special conditions, just check score
        if($plyer.EndStatus -eq "Staying" -and $dler.EndStatus -eq "Staying")
        {
            if($plyer.GetScore() -gt $dler.GetScore()){
                $this.m_Winner = "Player"
            }
            elseif($plyer.GetScore() -lt $dler.GetScore()){
                $this.m_Winner = "Dealer"
            }
            elseif($plyer.GetScore() -eq $dler.GetScore()){
                $this.m_Winner = "Tie"
            }
        }
        #If someone busted
        elseif($plyer.EndStatus -eq "Busted" -or $dler.EndStatus -eq "Busted")
        {
           if($plyer.EndStatus -eq "Busted" -and $dler.EndStatus -eq "Busted"){
                $this.m_Winner = "Tie"
           }
           elseif ($plyer.EndStatus -eq "Busted") {
                $this.m_Winner = "Dealer"
           }
           elseif ($dler.EndStatus -eq "Busted") {
            $this.m_Winner = "Player"
           }
        }
        #If BlackJack
        elseif($plyer.EndStatus -eq "Black Jack" -or $dler.EndStatus -eq "Black Jack")
        {
            if($plyer.EndStatus -eq "Black Jack" -and $dler.EndStatus -eq "Black Jack"){
                $this.m_Winner = "Tie"
            }
            elseif ($plyer.EndStatus -eq "Black Jack") {
                $this.m_Winner = "Player"
            }
            elseif ($dler.EndStatus -eq "Busted") {
                $this.m_Winner = "Dealer"
           }
        }

        Write-Host "The winner is" $this.m_Winner
    }
}