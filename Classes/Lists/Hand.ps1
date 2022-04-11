class Hand:List
{
    Hand()
    {
        Write-Host "Hand Created"
        $tempCard = [Card]::new(2, "Holder", "Number")
        $this.items += $tempCard
        $this.items += $tempCard

    }
}