class User
{
    [Hand]$m_PHand
    [int]$m_DealtCards
    [string]$EndStatus

    User()
    {
        $this.m_PHand = [Hand]::new()
        $this.m_DealtCards = 0
        $this.EndStatus = "Active"
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
        #TODO - need logic for Aces
        $score = 0
        foreach ($element in $this.m_PHand.m_items)
        {
            $score += $element.GetValue()
        }
        return $score
    }
    # Runs function when player explicitly Stays
    [void]Stay()
    {
        $this.EndStatus = "Staying"
    }
    # Runs Checks functions above
    [void]UpdateStatus()
    {
        if($this.GetScore() -eq 21)
        {
            $this.EndStatus = "Black Jack"
        }
        elseif ($this.GetScore() -gt 21)
        {
            $this.EndStatus = "Busted"
        }
    }
    [string]GetStatus()
    {
        return $this.EndStatus
    }
    [void]PrintStatus()
    {
        switch($this.GetStatus())
        {
            "Staying"
            {
                Write-Host "Staying..."
            }
            "Black Jack"
            {
                Write-Host "Black Jack!"
            }
            "Busted"
            {
                Write-Host "Busted!"
            }
        }
    }
}