class Dealer:User
{
    [Deck]$m_Game_Deck
    #[Player]$m_Player

    [void]DealCard()
    {
        #TODO-single use
        $this.m_PHand.m_items[0] = $this.m_Game_Deck.DrawCard()
    }
    [void]DealCards()
    {
        $this.m_PHand.m_items[0] = $this.m_Game_Deck.DrawCard()
        $this.m_PHand.m_items[1] = $this.m_Game_Deck.DrawCard()
    }
    Dealer()
    {
        $this.m_Game_Deck = [Deck]::new()
        Write-Host "Dealer Created"
    }
}