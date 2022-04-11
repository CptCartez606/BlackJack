class User
{
    [Hand]$PHand

    User()
    {
        $this.PHand = [Hand]::new()
    }

    [void]AddToHand($param)
    {
        $this.PHand.AddToList($param)
    }
}