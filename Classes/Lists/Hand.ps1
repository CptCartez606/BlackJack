class Hand:List
{
    Hand()
    {
        Write-Host "Hand Created"
        $tempCard = [Card]::new(2, "Holder", "Number")
        $this.m_items += $tempCard
        $this.m_items += $tempCard

    }
}