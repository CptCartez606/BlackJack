class User
{
    [Hand]$m_PHand

    User()
    {
        $this.m_PHand = [Hand]::new()
    }

    [void]AddToHand($param)
    {
        $this.m_PHand.AddToList($param)
    }
}