class Dealer:User
{
    [Deck]$Game_Deck

    [void]DealCards()
    {
        $this.PHand.items[0] = $this.Game_Deck.DrawCard()
        $this.PHand.items[1] = $this.Game_Deck.DrawCard()
    }
    Dealer()
    {
        $this.Game_Deck = [Deck]::new()
        Write-Host "Dealer Created"
    }
}