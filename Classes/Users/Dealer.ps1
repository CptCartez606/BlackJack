class Dealer:User
{
    [Deck]$Game_Deck

    Dealer()
    {
        $this.Game_Deck = [Deck]::new()
        Write-Host "Dealer Created"
    }
}