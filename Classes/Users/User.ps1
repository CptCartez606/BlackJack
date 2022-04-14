class User
{
    [Hand]$m_PHand
    [int]$m_DealtCards
    [bool]$IsStay = $false
    [bool]$IsBust = $false

    User()
    {
        $this.m_PHand = [Hand]::new()
        $this.m_DealtCards = 0
    }
    [void]AddToHand($param)
    {
        $this.m_PHand.AddToList($param)
        $this.m_DealtCards++
    }
    [void]EndofRound()
    {
        $this.m_DealtCards = 0
    }
    [int]GetScore()
    {
        $score = 0
        foreach ($element in $this.m_PHand.m_items)
        {
            $score += $element.GetValue()
        }
        return $score
    }
    [void]Stay()
    {
        $this.IsStay = $true
        Write-Host "Staying..."
    }
    [void]CheckIfBust()
    {
        if($this.GetScore() -gt 21)
        {
            $this.IsBust = $true
        }
    }
    [bool]GetTurn()
    {
        $IsTurn = $true
        if($this.CheckIfBust() -or $this.IsStay -or $this.GetScore() -ge 21)
        {
            $IsTurn = $false
        }
        
        return $IsTurn
    }
}