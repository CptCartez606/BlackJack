class GameManager
{
    [Dealer]$m_Dealer
    [Deck]$m_Game_Deck
    [Player]$m_Player
    
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
    [void]PlayerChoice()
    {
        if($this.m_Player.GetTurn())
        {
            $choiceflag = $false
            [string]$userInput = ""
            while(!$choiceflag)
            {
                $message = "Hit or Stay?"
                try {
                    $userInput = Read-Host -Prompt $message
                    $choiceflag = $true
                }
                catch {
                    Write-Host "Error: Invalid entry! Try again"
                }
            }
            switch ($userInput)
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
                    "You didn't enter a correct entry dummy!"
                }
            }
        }
        else 
        {
            Write-Host "Player has ended their turn. Dealer's turn now..."
            Pause
        }
    }
    [bool]IsPlayerTurn()
    {
        if($this.m_Player.GetScore() -ge 21 -OR $this.m_Player.GetTurn())
        {
            $this.m_Player.EndTurn()
        }
        return $true
    }
    GameManager()
    {
        $this.m_Dealer = [Dealer]::new()
        $this.m_Game_Deck = [Deck]::new()
        $this.m_Player = [Player]::new()
        #Write-Host "Manager Created"
    }
}