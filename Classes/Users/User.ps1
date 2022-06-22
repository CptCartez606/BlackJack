class User
{
    [Hand]$m_PHand
    [int]$m_DealtCards
    [bool]$IsStay = $false
    #BJ - Hit 21
    [bool]$IsBust = $false
    [bool]$IsBJ = $false
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
        $this.IsStay = $true
        $this.EndStatus = "Staying"
        Write-Host "Staying..."
    }
    [void]CheckForBJ()
    {
        if($this.GetScore() -eq 21)
        {
            $this.IsBJ = $true
            $this.EndStatus = "Black Jack"
        }
    }
    [void]CheckForBust()
    {
        if($this.GetScore() -gt 21)
        {
            $this.IsBust = $true
            $this.EndStatus = "Busted"
        }
    }
    # Runs Checks functions above
    [void]UpdateStatus()
    {
        $this.CheckForBust()
        $this.CheckForBJ()
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
                Write-Host "Staying"
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
    [bool]IsTurn()
    {
        if($this.GetScore() -ge 21 -OR $this.GetTurn())
        {
            $this.EndTurn()
        }
        return $true
    }
}