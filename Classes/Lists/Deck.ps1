class Deck:List
{
    [void]CreateSuit($suit)
    {
        for($i = 2; $i -le 10; $i++)
        {
            $tempCard = [Card]::new($i, $suit, "Number")
            $this.AddToList($tempCard)
        }

        $tempCard = [Card]::new(10, $suit, "Jack")
        $this.AddToList($tempCard)

        $tempCard = [Card]::new(10, $suit, "Queen")
        $this.AddToList($tempCard)

        $tempCard = [Card]::new(10, $suit, "King")
        $this.AddToList($tempCard)

        $tempCard = [Card]::new(11, $suit, "Ace")
        $this.AddToList($tempCard)
    }
    [void]CreateDeck()
    {
        $this.CreateSuit("Spades")
        $this.CreateSuit("Clubs")
        $this.CreateSuit("Hearts")
        $this.CreateSuit("Diamonds")
              
        Write-Host "Deck Created"
    }
    [void]ShuffleDeck()
    {
        for($i = 0; $i -le 100; $i++)
        {
            $randomNum1 = 0
            $randomNum2 = 0
            #Randomize until both numbers aren't the same
            while($randomNum1 -eq $randomNum2)
            {
                $randomNum1 = Get-Random -Maximum 51
                $randomNum2 = Get-Random -Maximum 51
            }

            #Swap cards
            $tempCard = $this.m_items[$randomNum1]
            $this.m_items[$randomNum1] = $this.m_items[$randomNum2]
            $this.m_items[$randomNum2] = $tempCard
        }
        
    }
    [Card]DrawCard()
    {
        $tempC = $this.m_items[0]
        $this.m_items.RemoveAt(0)
        return $tempC
    }

    Deck()
    {
        $this.CreateDeck()
        $this.ShuffleDeck()
    }

}