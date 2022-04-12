class User
{
    [Hand]$m_PHand
    [int]$m_DealtCards

    User()
    {
        $this.m_PHand = [Hand]::new()
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
}